package sms.spring.DAO;

import java.util.List;

import sms.spring.entity.User;

public interface UserDao {

	public List<User> getUsers(Integer user_id, String password);

	public List<User> getAllUsers();

	public List<User> getUserById(Integer userId);
	
	public User getUserbyId(Integer userId);

	public Integer saveUser(User theUser);
	
	
	public Integer updateUser(User theUser);
	
	public void userUpdatePassword(Integer UserId, String password);
	
}
