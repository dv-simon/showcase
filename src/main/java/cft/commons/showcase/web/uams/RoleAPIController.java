package cft.commons.showcase.web.uams;

import java.util.List;
import java.util.Locale;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cft.commons.core.constant.Constants;
import cft.commons.core.model.display.JqPageObject;
import cft.commons.core.model.display.ResultJSON;
import cft.commons.showcase.model.Role;
import cft.commons.showcase.model.User;
import cft.commons.showcase.service.RoleService;

/**
 * @author daniel
 *
 */
@Scope("prototype")
@Controller
@Slf4j
public class RoleAPIController {

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private MessageSource messageSource;

	/*	@InitBinder
		public void initBinder(WebDataBinder binder) {
			binder.registerCustomEditor(Role.class, new RolePropertyEditor());
		}*/

	@RequestMapping(value = "/api/v1/role",method = RequestMethod.GET)
	public @ResponseBody
	JqPageObject getRoleList(Role role) {
		
		List<Role> pageData = roleService.getRoleList(role);
		JqPageObject jpo = new JqPageObject();
		jpo.setRows(pageData);

		return jpo;
	}

	@RequestMapping(value = "/api/v1/role", method = RequestMethod.POST)
	public @ResponseBody
	ResultJSON doSaveRole(@ModelAttribute("roleForm") Role roleForm, Locale locale) {
		ResultJSON json = new ResultJSON();
		/*String permissions = StringUtils.join(roleForm.getPermissionList(), ",");
		roleForm.setPermissions(permissions);
		logger.info(Constants.CTL_LOG + "roleForm: " + roleForm);

		if (StringUtils.isBlank(roleForm.getRoleId())) {
			logger.info(Constants.CTL_LOG + "roleId is null, triger createRole service.");

			roleService.createRole(roleForm);
			Role savedRole = roleService.getRoleByRoleId(roleForm.getRoleId());

			if (savedRole != null) {
				json.setSuccess(true);
				json.setDataObject(roleForm.getRoleId());
				json.setResultCode("61004");
			} else {
				json.setResultCode("63004");
			}

		} else {
			logger.info(Constants.CTL_LOG + "roleId isnot null, triger updateRole service.");
			Integer i = roleService.updateRole(roleForm);
			if (i == 1) {
				json.setSuccess(true);
				json.setDataObject(roleForm.getRoleId());
				json.setResultCode("61006");
			} else {
				json.setResultCode("63006");
			}
		}

		*/
		if (roleForm.getRoleId() == null) {

			try {
				roleService.createRole(roleForm);
				Role savedRole = roleService.getRoleByRoleId(roleForm.getRoleId());

				if (savedRole != null) {
					json.setSuccess(true);
					json.setDataObject(roleForm.getRoleId());
					json.setResultCode("61004");
				} else {
					json.setResultCode("63004");
				}

			} catch (Exception ex) {
				log.error("Exception during create role", ex);
				json.setResultCode("63004");
				json.setExceptionMsg(ex.getMessage());
			}

		} else { // update recored
			try {
				Integer i = roleService.updateRole(roleForm);
				if (i == 1) {
					json.setSuccess(true);
					json.setDataObject(roleForm.getRoleId());
					json.setResultCode("61006");
				} else {
					json.setResultCode("63006");
				}
			} catch (Exception ex) {
				log.error("Exception during update role", ex);
				json.setResultCode("63006");
				json.setExceptionMsg(ex.getMessage());
			}

		}

		json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));
		return json;
	}

	@RequestMapping(value = "/api/v1/role/{roleId}", method = RequestMethod.DELETE)
	public @ResponseBody
	ResultJSON disableRole(@PathVariable("roleId") String roleId, Locale locale) {

		ResultJSON json = new ResultJSON();

		Integer i = roleService.disableRole(Integer.parseInt(roleId));
		if (i == 1) {
			json.setSuccess(true);
			json.setDataObject(roleId);
			json.setResultCode("61005");
		} else {
			json.setResultCode("63005");
		}

		json.setMessage(messageSource.getMessage(json.getResultCode(), null, locale));
		return json;
	}

}