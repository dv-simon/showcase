package cft.commons.showcase.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cft.commons.core.constant.Constants;
import cft.commons.core.helper.jackson.JsonMapper;
import cft.commons.core.helper.pagination.RedisPaginationUtils;
import cft.commons.core.model.display.JqPageObject;
import cft.commons.showcase.constant.RedisConstants;
import cft.commons.showcase.model.ActionLog;

@Controller
public class ActionLogAPIController {
	
	@Autowired
	private StringRedisTemplate redisTemplate;
	
	@RequestMapping(value ="/api/v1/actionLog" ,method = RequestMethod.GET)
	public @ResponseBody
	JqPageObject getLogList(ActionLog systemLog) {

		int pageNo = systemLog.getPage(); //current page number ,default:1
		int pageSize = systemLog.getRows(); //records size per page, defaults :10	
		int totalRecords = redisTemplate.opsForList().size(RedisConstants.KEY_SYSTEM_LOG_ACTION).intValue(); //total count of records

		int totalPage = RedisPaginationUtils.getTotalPage(totalRecords, pageSize);
		int start = RedisPaginationUtils.getStartIndex(pageSize, pageNo);
		int end = RedisPaginationUtils.getEndIndex(pageSize, pageNo);
		
		List<String> logJsonList = redisTemplate.opsForList().range(RedisConstants.KEY_SYSTEM_LOG_ACTION, start, end);
		
		JsonMapper jsonMapper = new JsonMapper();
		jsonMapper.getMapper().setDateFormat(new SimpleDateFormat(Constants.C_DATETIME_PATTERN_DEFAULT));
		
		List<ActionLog> systemLogList = new ArrayList<ActionLog>();
		for(String log : logJsonList){
				systemLogList.add((ActionLog)jsonMapper.fromJson(log, ActionLog.class));
		}

		JqPageObject jpo = new JqPageObject();
		jpo.setRows(systemLogList); //Data List
		jpo.setPage(pageNo); //current page number
		jpo.setRecords(totalRecords); //total count of records
		jpo.setTotal(totalPage); //total count of pages

		return jpo;
	}
	

}
