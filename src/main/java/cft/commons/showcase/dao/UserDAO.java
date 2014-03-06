package cft.commons.showcase.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import cft.commons.showcase.model.User;

public interface UserDAO {

	String getLastPK() throws DataAccessException;

	Integer isExistUser(String loginName) throws DataAccessException;

	User getUserByUserId(String userId) throws DataAccessException;

	User getUserByLoginName(String loginName) throws DataAccessException;

	List<User> getUserList(User user) throws DataAccessException;

	void insertUser(User user) throws DataAccessException;

	Integer updateUser(User user) throws DataAccessException;

	Integer changeUserPassword(User user) throws DataAccessException;

	Integer deleteUser(String userId) throws DataAccessException;

	void deleteUserRole(String userId) throws DataAccessException;

	void insertUserRole(Map<String, String> paramMap) throws DataAccessException;

}
