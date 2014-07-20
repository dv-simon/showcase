package cft.commons.showcase.service.impl;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cft.commons.core.constant.Constants;
import cft.commons.showcase.dao.mybatis.RoleDAO;
import cft.commons.showcase.model.Role;
import cft.commons.showcase.service.RoleService;

/**
 * @author daniel
 *
 */
@Slf4j
@Component("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDAO roleDAO;

	@Override
	public Role getRoleByRoleId(int roleId) {
		return roleDAO.getRoleByRoleId(roleId);
	}

	@Override
	public List<Role> getRoleList(Role role) {
		return roleDAO.getRoleList(role);
	}

	//for distribution PK Database
	/*@Synchronized
	@Override
	public String generatePK() {

		final String prefix = "R";
		String newPK = null;

		String lastId = roleDAO.getLastPK();
		if (StringUtils.isNotBlank(lastId)) {
			newPK = prefix + String.valueOf((Integer.parseInt(StringUtils.substring(lastId, 1)) + 1));
		} else {
			newPK = prefix + "1001";
		}

		return newPK;
	}*/

	@Override
	public void createRole(Role role) {
		//role.setRoleId(generatePK());
		roleDAO.insertRole(role);
		//演示插入数据后，object自动获取插入主键 id
		log.info(Constants.SVC_LOG + "RoleServiceImpl:createRole:roleId = " + role.getRoleId());

	}

	@Override
	public Integer updateRole(Role role) {
		return roleDAO.updateRole(role);
	}

	@Override
	public Integer disableRole(int roleId) {
		return roleDAO.disableRole(roleId);
	}

}
