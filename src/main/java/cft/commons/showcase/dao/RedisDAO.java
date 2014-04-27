package cft.commons.showcase.dao;

import org.springframework.dao.DataAccessException;

/**
 * @author daniel
 *
 */
public interface RedisDAO {

	void leftPushQueue(String key, String value, long limit) throws DataAccessException;

}
