package cft.commons.showcase.model;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * @author daniel
 *
 */
@Data
public class ActionLog implements Serializable {

	private static final long serialVersionUID = -2538102763895244167L;

	private int id;
	
	private Date logTime;
	private String logType;
	private String logClass;
	private String logBody;
	private long executeTime;
	private String remark;

	//for UI Component
	private Integer startIndex;
	private Integer endIndex;
	private Integer rows; //pageSize
	private Integer page; //pageNumber

	private String sidx; //sortColumn
	private String sord; //sortOrder

}