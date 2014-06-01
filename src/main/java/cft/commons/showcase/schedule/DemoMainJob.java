package cft.commons.showcase.schedule;

import lombok.extern.slf4j.Slf4j;

/**
 * @author daniel
 *
 */
@Slf4j
public class DemoMainJob {

	private static long starttime = 0;

	/**
	 * 演示一個簡單的Cron job, 定時寫一條log顯示Server已運行時間.
	 */
	public void testTask() {

		log.info(">>>>>>>>>>>>> Server has been running for (Minutes): "
				+ String.valueOf((System.currentTimeMillis() - starttime) / 1000 / 60));
	}

	static {
		starttime = System.currentTimeMillis();
	}
}
