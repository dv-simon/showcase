package cft.commons.showcase.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.ToString;

/**
 * @author daniel
 *
 */
@Data
@ToString(exclude="password")
public class User implements Serializable {

	private static final long serialVersionUID = -4471280354347234495L;

	private Integer userId;
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

	private String sidx; //sortColumn
	private String sord; //sortOrder

	/*public String retrieveRoleNames() {
		return Collections3.extractToString(roleList, "name", ", ");
	}*/

}