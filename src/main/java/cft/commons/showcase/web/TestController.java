package cft.commons.showcase.web;

import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Slf4j
@Controller
public class TestController {



	@RequestMapping(value = "/view/test", method = RequestMethod.GET)
	public String test(Model model, HttpSession session) {
		return "/test";
	}

	

}
