package cft.commons.showcase.web.uams;

import java.util.List;
import java.util.Locale;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cft.commons.core.constant.Constants;
import cft.commons.core.helper.pagination.MySQLPaginationUtils;
import cft.commons.core.model.display.JqPageObject;
import cft.commons.core.model.display.ResultJSON;
import cft.commons.showcase.model.Role;
import cft.commons.showcase.model.User;
import cft.commons.showcase.service.UserService;
import cft.commons.showcase.web.RolePropertyEditor;

/**
 * @author daniel
 *
 */
@Scope("prototype")
@Controller
@Slf4j
public class UserAPIController {

	@Autowired
	private UserService userService;

	@Autowired
	private MessageSource messageSource;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Role.class, new RolePropertyEditor());
	}

	@RequestMapping(value ="/api/v1/user" ,method = RequestMethod.GET)
	public @ResponseBody
	JqPageObject getUserList(User user) {

		int pageNo = user.getPage(); //current page number ,default:1
		int pageSize = user.getRows(); //records size per page, defaults :10	
		int totalRecords = userService.getUserListCount(user); //total count of records
		int totalPage = MySQLPaginationUtils.getTotalPage(totalRecords, pageSize); //total count of pages

		//for MySQL pagination
		int start = MySQLPaginationUtils.getStartIndex(pageSize, pageNo);
		user.setStartIndex(start);
		List<User> pageData = userService.getUserList(user);

		JqPageObject jpo = new JqPageObject();
		jpo.setRows(pageData); //Data List
		jpo.setPage(pageNo); //current page number
		jpo.setRecords(totalRecords); //total count of records
		jpo.setTotal(totalPage); //total count of pages

		return jpo;
	}

	@RequestMapping(value = "/api/v1/user", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON saveUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Locale locale) {

		ResultJSON json = new ResultJSON();

		//if userId is null, then create new record
		if (StringUtils.isBlank(userForm.getUserId())) {

			try {
				userService.createUser(userForm);
				User savedUser = userService.getUserByLoginName(userForm.getLoginName());

				if (StringUtils.isNotBlank(savedUser.getUserId())) {
					log.info(Constants.SVC_LOG + "doCreateUser finished: savedUser userId: " + savedUser.getUserId());
					json.setSuccess(true);
					json.setDataObject(savedUser);
					json.setResultCode("61000");
				} else {
					json.setResultCode("63000");
				}

			} catch (Exception ex) {
				log.error("Exception during create user", ex);
				json.setResultCode("63000");
				json.setExceptionMsg(ex.getMessage());
			}

		} else { // update recored
			try {
				Integer i = userService.updateUser(userForm);

				if (i == 1) {
					json.setSuccess(true);
					json.setDataObject(userForm.getUserId());
					json.setResultCode("61002");
				} else {
					json.setResultCode("63002");
				}

			} catch (Exception ex) {
				log.error("Exception during update user", ex);
				json.setResultCode("63000");
				json.setExceptionMsg(ex.getMessage());
			}

		}

		json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));
		return json;
	}

	@RequestMapping(value = "/api/v1/user/{userId}", method = RequestMethod.DELETE)
	public @ResponseBody
	ResultJSON deleteUser(@PathVariable("userId") String userId, Locale locale) {

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

	@RequestMapping(value = "/api/v1/changeUserPassword", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON changeUserPassword(User user,Locale locale) {
		
		log.info(user.toString());
		ResultJSON json = new ResultJSON();
		
		if (!user.getPassword().equals(user.getPlainPassword())) {
			json.setSuccess(false);
			json.setResultCode("63020");
			json.setExceptionMsg(messageSource.getMessage(json.getResultCode(), null, locale));
			json.setMessage("更新密碼失敗.");
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

	@RequestMapping(value = "/api/v1/isAvaiableLoginName", method = RequestMethod.POST)
	public @ResponseBody
	Boolean isAvaiableLoginName(String loginName) {
		return userService.isAvaiableLoginName(loginName);
	}
}
