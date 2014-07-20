package cft.commons.showcase.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Synchronized;
import lombok.extern.slf4j.Slf4j;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cft.commons.core.constant.Constants;
import cft.commons.core.helper.encrypt.EncryptUtils;
import cft.commons.core.util.EncodeUtils;
import cft.commons.showcase.dao.mybatis.UserDAO;
import cft.commons.showcase.model.Role;
import cft.commons.showcase.model.User;
import cft.commons.showcase.service.UserService;

@Slf4j
@Component("userService")
public class UserServiceImpl implements UserService {

	private static final int SALT_SIZE = 8;

	@Autowired
	private UserDAO userDAO;

	//for distribution PK Database
/*	@Override
	@Synchronized
	public String generatePK() {

		final String prefix = "U";
		String newPK = null;

		//pk generation logic
		String lastId = userDAO.getLastPK();
		if (StringUtils.isNotBlank(lastId)) {
			newPK = prefix + String.valueOf((Integer.parseInt(StringUtils.substring(lastId, 1)) + 1));
		} else {
			newPK = prefix + "1001";
		}

		return newPK;
	}*/

	@Override
	public List<User> getUserList(User user) {
		return userDAO.getUserList(user);
	}

	@Override
	public Integer getUserListCount(User user) {
		return userDAO.getUserListCount(user);
	}

	@Override
	public void createUser(User user) throws Exception {

		if (StringUtils.isNotBlank(user.getPlainPassword())) {

			byte[] salt = EncryptUtils.generateSalt(SALT_SIZE);

			user.setSalt(EncodeUtils.encodeHex(salt));
			user.setPassword(EncryptUtils.entryptPassword(user.getPlainPassword(), salt));

		}

		//user.setUserId(generatePK());
		userDAO.insertUser(user);

		//演示插入数据后，object自动获取插入主键 id
		log.info(Constants.SVC_LOG + "UserServiceImpl:createUser:userId = " + user.getUserId());

		if (CollectionUtils.isNotEmpty(user.getRoleList())) {
			for (Role role : user.getRoleList()) {
				Map<String, String> paramMap = new HashMap<String, String>();
				paramMap.put("userId", user.getUserId().toString());
				paramMap.put("roleId", role.getRoleId().toString());

				userDAO.insertUserRole(paramMap);
			}
		}
	}

	@Override
	public User getUserByLoginName(String loginName) {
		User user = userDAO.getUserByLoginName(loginName);
		return user;
	}

	@Override
	public User getUserByUserId(int userId) {
		return userDAO.getUserByUserId(userId);
	}

	@Transactional(readOnly = false, rollbackFor = DataAccessException.class)
	@Override
	public Integer updateUser(User user) {

		log.info(Constants.SVC_LOG + "UserServiceImpl:updateUser:user = " + user);

		userDAO.deleteUserRole(user.getUserId());
		if (CollectionUtils.isNotEmpty(user.getRoleList())) {
			for (Role role : user.getRoleList()) {

				Map<String, String> paramMap = new HashMap<String, String>();
				paramMap.put("userId", user.getUserId().toString());
				paramMap.put("roleId", role.getRoleId().toString());

				userDAO.insertUserRole(paramMap);
			}
		}

		return userDAO.updateUser(user);
	}

	@Override
	public Integer deleteUser(int userId) {

		log.info(Constants.SVC_LOG + "UserServiceImpl:deleteUser:userId = " + userId);

		userDAO.deleteUserRole(userId);
		return userDAO.deleteUser(userId);
	}

	@Override
	public Integer changeUserPassword(User user) {

		if (StringUtils.isNotBlank(user.getPlainPassword())) {

			byte[] salt = EncryptUtils.generateSalt(SALT_SIZE);

			user.setSalt(EncodeUtils.encodeHex(salt));
			user.setPassword(EncryptUtils.entryptPassword(user.getPlainPassword(), salt));

		}
		return userDAO.changeUserPassword(user);
	}

	@Override
	public Boolean isAvaiableLoginName(String loginName) {
		boolean isExist = false;
		Integer i = userDAO.isExistUser(loginName);

		if (i.intValue() == 1) {
			isExist = true;
		}

		log.info(Constants.SVC_LOG + "UserService:isAvaiableLoginName = " + !isExist);
		return !isExist;
	}

	@Override
	public User getUserByEmail(String email) {
		return userDAO.getUserByEmail(email);
	}

}
