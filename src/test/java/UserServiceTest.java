import junit.framework.TestSuite;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cft.commons.showcase.model.User;
import cft.commons.showcase.service.UserService;

@ContextConfiguration(locations = { "/applicationContext.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class UserServiceTest {

	@Autowired
	private UserService userService;

	@Test
	public void CRUD() {

		User user = new User();
		user.setLoginName("88888");
		user.setSalt("asdfasdf");
		user.setPassword("asdfasdf");
		user.setName("Mike");
		user.setStatus("active");

		userService.createUser(user);
		
		 user = userService.getUserByLoginName("88888");
		System.out.println(user);
		
		
		user = userService.getUserByLoginName("88888");
		user.setName("9999");
		userService.updateUser(user);
		
		userService.deleteUser("U1005");
		
	}

}
