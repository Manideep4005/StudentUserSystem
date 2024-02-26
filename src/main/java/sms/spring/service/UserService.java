package sms.spring.service;

import java.util.List;

import sms.spring.entity.User;

public interface UserService {

	public List<User> getUsers(Integer user_id, String password);

	public List<User> getAllUsers();

	public List<User> getUserById(Integer userId);

	public Integer saveUser(User theUser);

	public Integer updateUser(User theUser);
	
	public User getUserbyId(Integer theId);
	
	public void userUpdatePassword(Integer UserId, String password);

}
