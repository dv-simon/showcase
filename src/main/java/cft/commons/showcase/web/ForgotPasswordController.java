package cft.commons.showcase.web;

import java.util.Locale;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cft.commons.core.model.display.ResultJSON;
import cft.commons.core.util.EncodeUtils;
import cft.commons.core.util.IdentityUtils;
import cft.commons.showcase.constant.ShowcaseConstants;
import cft.commons.showcase.model.User;
import cft.commons.showcase.service.EmailService;
import cft.commons.showcase.service.UserService;

/**
 * @author daniel
 *
 */
@Controller
public class ForgotPasswordController {

	@Autowired
	private UserService userService;

	@Autowired
	private StringRedisTemplate redisTemplate;

	@Autowired
	private EmailService mimeMailService;

	@Autowired
	private MessageSource messageSource;

	/**
	 * 第一步：提交找回密码请求，系统发送验证Email
	 */
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON requetForgotPassword(String email, Model model) {

		ResultJSON json = new ResultJSON();

		User user = userService.getUserByEmail(email);

		if (user != null) {

			//生成随机token，并将加密的token限时持久化到Redis DB
			String uuid = IdentityUtils.uuid2();
			String encodeToken = EncodeUtils.encodeBase64String(uuid.getBytes());
			final String key = ShowcaseConstants.KEY_TOKEN_FORGOTPASSWORD + encodeToken;
			final String loginName = user.getLoginName();

			redisTemplate.opsForValue().set(key, loginName, 600, TimeUnit.SECONDS);

			//异步发送通知Email
			mimeMailService.sendForgotPasswordMail(user.getName(), uuid, "admin@tvb.com", email, "cft 忘记密码 通知.");

			json.setSuccess(true);
			json.setMessage("Email sent, please check your email. Back to login page...");
		} else {
			json.setSuccess(false);
			json.setMessage("Can't find that email account, sorry.");
		}

		return json;
	}

	/**
	 * 第二步：登录邮箱, 点击Email中的链接打开reset password界面，并验证token
	 */
	@RequestMapping(value = "/forgotPassword/{token}", method = RequestMethod.GET)
	public String toRetreivPassword(@PathVariable("token") String token, Model model) {

		//首先检查此token是否存有效，并取出loginName
		String encodeToken = EncodeUtils.encodeBase64String(token.getBytes());
		String key = ShowcaseConstants.KEY_TOKEN_FORGOTPASSWORD + encodeToken;
		String loginName = redisTemplate.opsForValue().get(key);
		//redisTemplate.opsForValue().getOperations().delete(key);

		User user = userService.getUserByLoginName(loginName);

		if (StringUtils.isNotBlank(loginName) && StringUtils.isNotBlank(user.getUserId())) {
			model.addAttribute("passwordForm", user);
			model.addAttribute("token", token);
		} else {
			model.addAttribute("forgotPasswordError", "token.inavaild");
			return "login";
		}
		return "resetPassword";
	}

	/**
	 * 第三步：重新填写密码并提交，系统更新密码并自动登录
	 */
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON resetPassword(User user, String token, Locale locale, HttpServletRequest request,
			HttpServletResponse response) {

		ResultJSON json = new ResultJSON();

		//Validation
		if (!user.getPassword().equals(user.getPlainPassword())) {
			json.setResultCode("63020");
			json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));

			return json;
		}

		//检测token是否有效，检测之后删除token
		String encodeToken = EncodeUtils.encodeBase64String(token.getBytes());
		String key = ShowcaseConstants.KEY_TOKEN_FORGOTPASSWORD + encodeToken;
		String loginName = redisTemplate.opsForValue().get(key);
		if (StringUtils.isNotBlank(loginName)) {

			Integer i = userService.changeUserPassword(user);
			if (i == 1) {
				json.setSuccess(true);
				json.setDataObject(user.getUserId());
				json.setResultCode("61003");

				/**
				 * 自动登录
				 */
				AuthenticationToken authenToken = new UsernamePasswordToken(loginName, user.getPlainPassword());
				Subject currentUser = SecurityUtils.getSubject();
				currentUser.login(authenToken);

				//成功后删除token
				redisTemplate.opsForValue().getOperations().delete(key);

			} else {
				json.setResultCode("63003");
			}
			json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));

		} else {
			json.setMessage("Token expired");
		}

		return json;
	}
}