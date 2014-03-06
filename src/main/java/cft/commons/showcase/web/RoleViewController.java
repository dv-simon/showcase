package cft.commons.showcase.web;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cft.commons.showcase.model.Role;
import cft.commons.showcase.service.RoleService;

@Controller
public class RoleViewController {
	
	private static final Logger logger = LoggerFactory.getLogger(RoleViewController.class);

	@Autowired
	private RoleService roleService;
	
	@ModelAttribute("allStatus")
	Map<String,String> prepareStatusList() {
		Map<String, String> allStatus = new HashMap<String , String>();
		allStatus.put("active", "active");
		allStatus.put("inactive", "inactive");
		return allStatus;
	}
	
	@RequestMapping(value = "/view/toRoleList", method = RequestMethod.GET)
	public String toUserList(Role role,Model model) {

		model.addAttribute("roleParam", role);
		
		return "uams/roleListCenter";
	}

	@RequestMapping(value = "/view/toCreateRole", method = RequestMethod.GET)
	public String toCreateRole(Model model) {
		
		Role role = new Role();
		model.addAttribute("roleForm", role);
		
		return "/uams/roleDailog";
	}
	
	@RequestMapping(value = "/view/toUpdateRole", method = RequestMethod.GET)
	public String toUpdateRole(String roleId, Model model) {

		Role role = roleService.getRoleByRoleId(roleId);
		role.setPermissionList(role.getAllPermissions());
		
		model.addAttribute("roleForm", role);
		
		return "/uams/roleDailog";
	}
}
