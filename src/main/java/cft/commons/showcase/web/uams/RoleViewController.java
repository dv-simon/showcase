package cft.commons.showcase.web.uams;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cft.commons.showcase.model.Role;
import cft.commons.showcase.service.RoleService;

@Controller
@Slf4j
public class RoleViewController {
	
	@Autowired
	private RoleService roleService;
	
	@Resource(name = "statusMap")
	private Map<String, String> statusMap;
	
	@ModelAttribute("statusMap")
	public Map<String,String> prepareStatusMap(){
		return this.statusMap;
	}
	
	@RequestMapping(value = "/view/role", method = RequestMethod.GET)
	public String toRoleList(String item, String subItem, Role role, Model model,HttpSession session) {
		session.setAttribute("item", item);
		session.setAttribute("subItem", subItem);		
		return "uams/roleList";
	}
	
	@RequestMapping(value = "/roleEdit", method = RequestMethod.GET)
	public String toRoleEdit(String act,String roleId, Model model) {	
		
		if(StringUtils.equals(act,"edit") && StringUtils.isNotBlank(roleId)){
			Role role = roleService.getRoleByRoleId(roleId);
			role.setPermissionList(role.getAllPermissions());
			
			model.addAttribute("roleForm", role);
			
		}else{
			Role role = new Role();
			model.addAttribute("roleForm", role);
		}
		
		Role role = new Role();
		role.setStatus("active");
		List<Role> roleList = roleService.getRoleList(role);
		model.addAttribute("roleList", roleList);
		
		return "/uams/roleEdit";
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
