package sms.spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sms.spring.DAO.UserDao;
import sms.spring.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	@Transactional
	public List<User> getUsers(Integer user_id, String password) {
		// TODO Auto-generated method stub
		return userDao.getUsers(user_id, password);
	}

	@Override
	@Transactional
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return userDao.getAllUsers();
	}

	@Override
	@Transactional
	public List<User> getUserById(Integer userId) {
		return userDao.getUserById(userId);
	}

	@Override
	@Transactional
	public Integer saveUser(User theUser) {
		return userDao.saveUser(theUser);
	}

	@Override
	@Transactional
	public void userUpdatePassword(Integer userId, String password) {
		userDao.userUpdatePassword(userId, password);
	}

	@Override
	@Transactional
	public User getUserbyId(Integer theId) {
		// TODO Auto-generated method stub
		return userDao.getUserbyId(theId);
	}

	@Override
	@Transactional
	public Integer updateUser(User theUser) {

		return userDao.updateUser(theUser);
	}

}
