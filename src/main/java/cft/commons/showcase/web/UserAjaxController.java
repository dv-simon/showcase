package cft.commons.showcase.web;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cft.commons.core.constant.Constants;
import cft.commons.core.model.display.PaginationObject;
import cft.commons.core.model.display.ResultJSON;
import cft.commons.core.validate.ValidationUtil;
import cft.commons.showcase.model.Role;
import cft.commons.showcase.model.User;
import cft.commons.showcase.service.UserService;

/**
 * @author daniel
 *
 */
@Scope("prototype")
@Controller
public class UserAjaxController {

	private static final Logger logger = LoggerFactory.getLogger(UserAjaxController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private MessageSource messageSource;

	private ValidationUtil validationUtil = new ValidationUtil();

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Role.class, new RolePropertyEditor());
	}

	@RequestMapping("/ajax/getUserList")
	public @ResponseBody
	PaginationObject getUserList(User user) {

		PaginationObject pno = new PaginationObject();

		List<User> pageData = userService.getUserList(user);
		pno.setRows(pageData);

		return pno;
	}

	@RequestMapping(value = "/ajax/doCreateUser", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON doCreateNews(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Locale locale) {
		ResultJSON json = new ResultJSON();

		//String inValidString = validationUtil.getInValidMsg(bindingResult, userForm, User.doCreateUser.class);
		String inValidString = null;
		logger.info("inValidString" + inValidString);
		if (inValidString != null) {
			json = validationUtil.callbackFailJson(messageSource, locale, inValidString);
		} else {
			//String userId = userService.generatePK();
			//userForm.setUserId(userId);
			
			userService.createUser(userForm);
			User savedUser = userService.getUserByLoginName(userForm.getLoginName());

			logger.info(Constants.SVC_LOG + "doCreateUser finished: savedUser userId: " + savedUser.getUserId());

			if (savedUser != null) {
				json.setSuccess(true);
				json.setDataObject(savedUser);
				json.setResultCode("61000");
			} else {
				json.setResultCode("63000");
			}
		}

		json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));
		return json;
	}

	@RequestMapping(value = "/ajax/doUpdateUser", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON doUpdateUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Locale locale) {

		ResultJSON json = new ResultJSON();

		//String inValidString = validationUtil.getInValidMsg(bindingResult, userForm, User.doUpdateUser.class);
		String inValidString = null;
		logger.info("inValidString" + inValidString);
		if (inValidString != null) {
			json = validationUtil.callbackFailJson(messageSource, locale, inValidString);
		} else {
			Integer i = userService.updateUser(userForm);

			if (i == 1) {
				json.setSuccess(true);
				json.setDataObject(userForm.getUserId());
				json.setResultCode("61002");
			} else {
				json.setResultCode("63002");
			}

			json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));
		}
		return json;
	}

	@RequestMapping(value = "/ajax/deleteUser", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON deleteUser(String userId, Locale locale) {

		ResultJSON json = new ResultJSON();

		Integer i = userService.deleteUser(userId);
		if (i == 1) {
			json.setSuccess(true);
			json.setDataObject(userId);
			json.setResultCode("61001");
		} else {
			json.setResultCode("63001");
		}

		json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));

		return json;
	}

	@RequestMapping(value = "/ajax/changeUserPassword", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON changeUserPassword(User user, BindingResult bindingResult, Locale locale) {
		ResultJSON json = new ResultJSON();

		//String inValidString = validationUtil.getInValidMsg(bindingResult, user, User.doChangePassword.class);
		String inValidString = null;
		if (inValidString != null) {
			json = validationUtil.callbackFailJson(messageSource, locale, inValidString);
		} else if (!user.getPassword().equals(user.getPlainPassword())) {
			json.setSuccess(false);
			json.setResultCode("63020");
			json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));
		} else {
			Integer i = userService.changeUserPassword(user);
			if (i == 1) {
				json.setSuccess(true);
				json.setDataObject(user.getUserId());
				json.setResultCode("61003");
			} else {
				json.setResultCode("63003");
			}

			json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));
		}

		return json;
	}

	@RequestMapping(value = "/ajax/isAvaiableLoginName", method = RequestMethod.POST)
	public @ResponseBody
	Boolean isAvaiableLoginName(String loginName) {
		return userService.isAvaiableLoginName(loginName);
	}
}
