package cft.commons.showcase.service;

import java.util.List;

import cft.commons.showcase.model.Role;

/**
 * @author daniel
 *
 */
public interface RoleService {
	
	//String generatePK();

	Role getRoleByRoleId(int roleId);

	List<Role> getRoleList(Role role);

	void createRole(Role role);

	Integer updateRole(Role role);

	Integer disableRole(int roleId);

}
