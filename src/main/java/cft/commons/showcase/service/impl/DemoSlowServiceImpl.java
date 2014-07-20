package cft.commons.showcase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cft.commons.core.util.Threads;
import cft.commons.showcase.dao.mybatis.UserDAO;
import cft.commons.showcase.model.User;
import cft.commons.showcase.service.DemoSlowService;

/**
 * 
 * @author daniel
 *
 *簡單建立一個Service, 只有一個運行緩慢的 method
 */
@Component("demoSlowService")
public class DemoSlowServiceImpl implements DemoSlowService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public User getUserByUserId(int userId) {
		Threads.sleep((int) (Math.random() * 2000) + 400); // just for demo slow
		return userDAO.getUserByUserId(userId);
	}
}
