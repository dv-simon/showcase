package cft.commons.showcase.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import cft.commons.showcase.dao.RedisDAO;

/**
 * @author daniel
 *
 */
@Component("redisDAO")
public class RedisDAOImpl implements RedisDAO {

	@Autowired
	private StringRedisTemplate redisTemplate;

	@Override
	public void leftPushQueue(String key, String value, long limit) throws DataAccessException {
		redisTemplate.opsForList().leftPush(key, value);
		int totalRecords = redisTemplate.opsForList().size(key).intValue();

		if (totalRecords > limit) {
			redisTemplate.opsForList().trim(key, 0, limit - 1);
		}

	}

}
