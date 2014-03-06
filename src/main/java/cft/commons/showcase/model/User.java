package cft.commons.showcase.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.ToString;
import cft.commons.core.util.Collections3;

/**
 * @author daniel
 *
 */
@Data
@ToString(exclude="password")
public class User implements Serializable {

	private static final long serialVersionUID = -4471280354347234495L;

	private String userId;
	private String loginName;
	private String plainPassword;
	private String password;
	private String salt;
	private String name;
	private String email;
	private String phone;
	private String office;
	private String dept;
	private String language;
	private String status;
	private String remark;

	private List<Role> roleList = new ArrayList<Role>();

	//for UI Component
	private Integer startIndex;
	private Integer endIndex;
	private Integer rows; //pageSize
	private Integer page; //pageNumber

	private String sort; //sortColumn
	private String order; //sortOrder

	public String getRoleNames() {
		return Collections3.extractToString(roleList, "name", ", ");
	}

}