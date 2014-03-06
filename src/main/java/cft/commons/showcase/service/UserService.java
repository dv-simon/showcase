package cft.commons.showcase.service;

import java.util.List;

import cft.commons.showcase.model.User;

/**
 * @author daniel
 *
 */
public interface UserService {

	String generatePK();

	void createUser(User user);

	User getUserByUserId(String userid);

	User getUserByLoginName(String loginName);

	List<User> getUserList(User user);

	Integer updateUser(User user);

	Integer deleteUser(String userId);

	Integer changeUserPassword(User user);

	Boolean isAvaiableLoginName(String loginName);

}
