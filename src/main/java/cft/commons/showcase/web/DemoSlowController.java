package cft.commons.showcase.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cft.commons.showcase.model.User;
import cft.commons.showcase.service.DemoSlowService;

@Controller
public class DemoSlowController {

	@Resource(name = "demoSlowService")// without Hystrix
	private DemoSlowService demoSlowService;

	@Resource(name = "demoSlowServiceHystrix")
	private DemoSlowService demoSlowService2;

	/*
		@RequestMapping(value = "/demoSlow", method = RequestMethod.GET)
		public @ResponseBody
		User demoSlow() {
			return demoSlowService.getUserByUserId("U1001");
		}*/

	@RequestMapping(value = "/demoHystrix", method = RequestMethod.GET)
	public @ResponseBody
	User demoHystrix() {
		User user = null;
		try {
			user = demoSlowService2.getUserByUserId("U1001");
		} catch (Exception ex) {

		}
		return user;
	}
}
