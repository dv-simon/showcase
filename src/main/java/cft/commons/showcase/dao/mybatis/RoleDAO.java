package cft.commons.showcase.dao.mybatis;

import java.util.List;

import org.springframework.dao.DataAccessException;

import cft.commons.showcase.model.Role;

/**
 * @author daniel
 *
 */
public interface RoleDAO {
	
	String getLastPK() throws DataAccessException;

	Role getRoleByRoleId(int roleId) throws DataAccessException;
	
	List<Role> getRoleList(Role role) throws DataAccessException;
	
	Integer insertRole(Role role) throws DataAccessException;
	
	Integer updateRole(Role role) throws DataAccessException;
	
	Integer disableRole(int roleId) throws DataAccessException;

}
