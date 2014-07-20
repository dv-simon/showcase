import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cft.commons.showcase.dao.mybatis.RoleDAO;
import cft.commons.showcase.model.Role;
import cft.commons.showcase.model.Role;
import cft.commons.showcase.service.RoleService;

@ContextConfiguration(locations = { "/applicationContext.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class RoleServiceTest {
	
	@Autowired
	private RoleDAO roleDAO;

	@Autowired
	private RoleService roleService;
	
	
	@Test
	public void testService() {
		 
		Role role = new Role();
		role.setStatus("active");
		System.out.println(roleService.getRoleList(role));

		
		
	}

}
