package cft.commons.showcase.web.uams;

import java.beans.PropertyEditorSupport;

import cft.commons.showcase.model.Role;

/**
 * @author daniel
 *
 */
public class RolePropertyEditor extends PropertyEditorSupport {

	@Override  
    public void setAsText(final String text) {  
		Role role = new Role();
		role.setRoleId(Integer.parseInt(text));
		
        setValue(role);  
    }  
}
