package cft.commons.showcase.web;

import javax.servlet.http.HttpSession;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cft.commons.showcase.service.UserService;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/view/index", method = RequestMethod.GET)
	public String login(String item, String subItem, Model model, HttpSession session) {
		session.setAttribute("item", item);
		return "/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		return "login";
	}

}
