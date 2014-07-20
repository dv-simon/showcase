package cft.commons.showcase.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import cft.commons.showcase.model.User;

public interface UserDAO {

	String getLastPK() throws DataAccessException;

	Integer isExistUser(String loginName) throws DataAccessException;

	User getUserByUserId(int userId) throws DataAccessException;

	User getUserByLoginName(String loginName) throws DataAccessException;
	
	User getUserByEmail(String email) throws DataAccessException;

	List<User> getUserList(User user) throws DataAccessException;
	
	Integer getUserListCount(User user) throws DataAccessException;

	Integer insertUser(User user) throws DataAccessException;

	Integer updateUser(User user) throws DataAccessException;

	Integer changeUserPassword(User user) throws DataAccessException;

	Integer deleteUser(int userId) throws DataAccessException;

	void deleteUserRole(int userId) throws DataAccessException;

	void insertUserRole(Map<String, String> paramMap) throws DataAccessException;

}
