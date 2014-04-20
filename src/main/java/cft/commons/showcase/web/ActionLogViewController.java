package cft.commons.showcase.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ActionLogViewController {

	@RequestMapping(value = "/view/actionLog", method = RequestMethod.GET)
	public String toActionLog(String item, String subItem, Model model, HttpSession session) {
		session.setAttribute("item", item);
		session.setAttribute("subItem", subItem);
		return "/actionLogList";
	}

}
