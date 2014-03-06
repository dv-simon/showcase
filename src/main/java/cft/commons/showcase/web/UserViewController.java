package cft.commons.showcase.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cft.commons.showcase.model.Role;
import cft.commons.showcase.model.User;
import cft.commons.showcase.service.RoleService;
import cft.commons.showcase.service.UserService;

@Controller
public class UserViewController {

	private static final Logger logger = LoggerFactory.getLogger(UserViewController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Resource(name = "languageMap")
	private Map<String, String> languageMap;

	private static Map<String, String> allStatus = new HashMap<String, String>();

	static {
		allStatus.put("active", "active");
		allStatus.put("inactive", "inactive");
	}

	@RequestMapping(value = "/view/toUserList", method = RequestMethod.GET)
	public String toUserList(User user, Model model) {

		model.addAttribute("userParam", user);

		return "uams/userListCenter";
	}

	@RequestMapping(value = "/view/toCreateUser", method = RequestMethod.GET)
	public String toCreateUser(Model model) {

		User user = new User();
		model.addAttribute("userForm", user);

		Role role = new Role();
		role.setStatus("active");
		List<Role> roleList = roleService.getRoleList(role);
		model.addAttribute("roleList", roleList);
		model.addAttribute("languageMap", languageMap);

		return "/uams/userCreateDailog";
	}

	@RequestMapping(value = "/view/toUpdateUser", method = RequestMethod.GET)
	public String toUpdateuser(String userId, Model model) {

		User user = userService.getUserByUserId(userId);
		model.addAttribute("userForm", user);

		User userPasswordForm = new User();
		userPasswordForm.setUserId(userId);
		model.addAttribute("userPasswordForm", userPasswordForm);

		model.addAttribute("allStatus", allStatus);
		model.addAttribute("languageMap", languageMap);

		Role role = new Role();
		role.setStatus("active");
		List<Role> roleList = roleService.getRoleList(role);
		model.addAttribute("roleList", roleList);

		return "/uams/userUpdateDailog";
	}
}
