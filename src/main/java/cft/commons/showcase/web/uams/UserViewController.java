package cft.commons.showcase.web.uams;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cft.commons.showcase.model.Role;
import cft.commons.showcase.model.User;
import cft.commons.showcase.service.RoleService;
import cft.commons.showcase.service.UserService;

@Controller
public class UserViewController {


	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	
	@Resource(name = "languageMap")
	private Map<String, String> languageMap;
	
	@ModelAttribute("languageMap")
	public Map<String,String> prepareLanguageMap(){
		return this.languageMap;
	}
	
	
	@Resource(name = "statusMap")
	private Map<String, String> statusMap;
	
	@ModelAttribute("statusMap")
	public Map<String,String> prepareStatusMap(){
		return this.statusMap;
	}


	@RequestMapping(value = "/view/user", method = RequestMethod.GET)
	public String toUserList(String item, String subItem, User user, Model model,HttpSession session) {
		session.setAttribute("item", item);
		session.setAttribute("subItem", subItem);
		
		return "uams/userList";
	}
	
	@RequestMapping(value = "/userEdit", method = RequestMethod.GET)
	public String toUserEdit(String act,String userId, Model model) {	
		
		if(StringUtils.equals(act,"edit") && StringUtils.isNotBlank(userId)){
			
			User user = userService.getUserByUserId(Integer.parseInt(userId));
			model.addAttribute("userForm",user);
			
			User userPasswordForm = new User();
			userPasswordForm.setUserId(Integer.parseInt(userId));
			model.addAttribute("passwordForm", userPasswordForm);
			
		}else{
			model.addAttribute("userForm", new User());
		}
		
		Role role = new Role();
		role.setStatus("active");
		List<Role> roleList = roleService.getRoleList(role);
		model.addAttribute("roleList", roleList);
		
		return "uams/userEdit";
	}


}
