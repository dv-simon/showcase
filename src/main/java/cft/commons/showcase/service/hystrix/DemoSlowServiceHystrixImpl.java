package cft.commons.showcase.service.hystrix;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cft.commons.showcase.model.User;
import cft.commons.showcase.service.DemoSlowService;

import com.netflix.hystrix.HystrixCommand.Setter;
import com.netflix.hystrix.HystrixCommandGroupKey;
import com.netflix.hystrix.HystrixCommandKey;
import com.netflix.hystrix.HystrixCommandProperties;
import com.netflix.hystrix.HystrixThreadPoolProperties;

@Component("demoSlowServiceHystrix")
public class DemoSlowServiceHystrixImpl implements DemoSlowService {

	private Setter commandConfig;

	@Autowired
	private DemoSlowService demoSlowService;

	@Override
	public User getUserByUserId(String userId) {
		DemoSlowServiceHystrixCommand command = new DemoSlowServiceHystrixCommand(commandConfig, demoSlowService,
				userId);
		return command.execute();
	}

	
	/**
	 * 初始化Setter, just hardcode parameters here.
	 */
	@PostConstruct
	public void init() {

		/**
		 * 设置Group name , Command name 
		 */
		commandConfig = Setter.withGroupKey(HystrixCommandGroupKey.Factory.asKey("DemoSlowServiceGroup"))
				.andCommandKey(HystrixCommandKey.Factory.asKey("getUserByUserIdCommand"));

		/**
		 * 设置初始化Setter
		 */
		HystrixCommandProperties.Setter commandProperties = HystrixCommandProperties.Setter();
		commandConfig.andCommandPropertiesDefaults(commandProperties);

		/**
		 *  设置短路规则 
		 */
		//设置超时 默认值为1秒, 设为2秒
		commandProperties.withExecutionIsolationThreadTimeoutInMilliseconds(2000)

				// 至少多少请求在rolling window内发生错误，才开始触发短路的计算，默认为20, 设为5
				.withCircuitBreakerRequestVolumeThreshold(5)

				// 多少百分比的失败在rolling windows内发生，计算为短路。默认为50%.
				.withCircuitBreakerErrorThresholdPercentage(20)

				// 设置短路后的保护时间 ，默认为5秒，改为20秒
				.withCircuitBreakerSleepWindowInMilliseconds(20000)

				// rolling windows 长度，默认为20秒，同时需要相应改变桶的数量.
				.withMetricsRollingStatisticalWindowInMilliseconds(20000)
				.withMetricsRollingStatisticalWindowBuckets(20);

		/**
		 * 设置并发控制
		 */
		// 设置线程池属性， 线程池大小，默认为10, 待执行队列的大小，默认为5
		commandConfig.andThreadPoolPropertiesDefaults(HystrixThreadPoolProperties.Setter().withCoreSize(3000)
				.withQueueSizeRejectionThreshold(600));

	}
}
