package cft.commons.showcase.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import cft.commons.showcase.model.Role;

/**
 * @author daniel
 *
 */
public interface RoleDAO {
	
	String getLastPK() throws DataAccessException;

	Role getRoleByRoleId(String roleId) throws DataAccessException;
	
	List<Role> getRoleList(Role role) throws DataAccessException;
	
	void insertRole(Role role) throws DataAccessException;
	
	Integer updateRole(Role role) throws DataAccessException;
	
	Integer disableRole(String roleId) throws DataAccessException;

}
