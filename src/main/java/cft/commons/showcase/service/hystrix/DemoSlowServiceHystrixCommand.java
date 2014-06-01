package cft.commons.showcase.service.hystrix;

import lombok.extern.slf4j.Slf4j;
import cft.commons.showcase.model.User;
import cft.commons.showcase.service.DemoSlowService;

import com.netflix.hystrix.HystrixCommand;
import com.netflix.hystrix.exception.HystrixBadRequestException;

/**
 * @author daniel
 *
 */
@Slf4j
public class DemoSlowServiceHystrixCommand extends HystrixCommand<User> {

	private DemoSlowService demoSlowService;

	private String userId;

	public DemoSlowServiceHystrixCommand(Setter commandConfig, DemoSlowService demoSlowService, String userId) {
		super(commandConfig);
		this.demoSlowService = demoSlowService;
		this.userId = userId;
	}

	@Override
	public User run() throws Exception {
		try {
			return demoSlowService.getUserByUserId(userId); //invoke original function
		} catch (Exception e) {
			throw new HystrixBadRequestException(e.getMessage(), e);
		}
	}

	@Override
	protected User getFallback() {
		log.info("Call getFallback ########################");
		return new User(); // just return a dummy object
	}

}
