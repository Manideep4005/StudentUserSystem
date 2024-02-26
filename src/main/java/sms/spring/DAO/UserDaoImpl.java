package sms.spring.DAO;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sms.spring.entity.User;
import sms.spring.mailService.MailConfig;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<User> getUsers(Integer user_id, String password) {

		Session currentSession = sessionFactory.getCurrentSession();

		List<User> getList = null;

		try {
			Query<User> query = currentSession.createQuery("from User where userId =:userid and password =:password",
					User.class);
			query.setParameter("userid", user_id);
			query.setParameter("password", password);
			getList = query.getResultList();

			return getList;
		} catch (NoResultException e) {
			// TODO: handle exception
			return null;
		}

	}

	@Override
	public List<User> getAllUsers() {
		List<User> uList = null;

		Session currentSession = sessionFactory.getCurrentSession();

		try {
			Query<User> query = currentSession.createQuery("from User", User.class);
			uList = query.getResultList();
			return uList;
		} catch (NoResultException e) {
			return null;
		}

	}

	@Override
	public List<User> getUserById(Integer user_id) {
		Session currentSession = sessionFactory.getCurrentSession();
		List<User> getUser = null;

		try {
			Query<User> query = currentSession.createQuery("from User where userId =:userid", User.class);
			query.setParameter("userid", user_id);
			getUser = query.getResultList();

			return getUser;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Integer saveUser(User theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theUser);

		Session currentSession2 = sessionFactory.getCurrentSession();
		Integer userId = theUser.getUserId();
		User theUser2 = (User) currentSession2.get(User.class, userId);
		System.out.println("\n----------------------------------------\nThe new user generated id is >>> "
				+ theUser2.getUserId() + "\n");

		/* Setting up sending the generated user id over Email */
		MailConfig sendMail = new MailConfig();

		boolean b = sendMail.userSendEmail(theUser2.getEmail(), theUser2.getUserId(),
				theUser2.getFirstName() + " " + theUser2.getLastName());

		if (b) {
			System.out.println("The Email Has sent Successfully to User\nUser Email >>> " + theUser2.getEmail()
					+ "\nUser Name >>> " + theUser2.getFirstName() + " " + theUser2.getLastName()
					+ "\nUser Address >>> " + theUser2.getAddress() + "\n----------------------------------------\n");

		} else {
			System.out.println("There is an error while sending an Email!");

		}

		return theUser2.getUserId();
	}

	@Override
	public void userUpdatePassword(Integer userId, String password) {
		Session currentSession = sessionFactory.getCurrentSession();

		try {

			User theUser2 = (User) currentSession.get(User.class, userId);
			theUser2.setPassword(password);
			currentSession.update(theUser2);
			System.out.println("The user DAO password Update:- " + theUser2.getUserId() + "\nnew Password:- "
					+ theUser2.getPassword());

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@Override
	public User getUserbyId(Integer userId) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = currentSession.get(User.class, userId);
		return theUser;
	}

	@Override
	public Integer updateUser(User theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theUser);
		
		Session currentSession2 = sessionFactory.getCurrentSession();
		Integer user_id = theUser.getUserId();
		
		User theUser2 = (User) currentSession2.get(User.class, user_id);
		
		return theUser2.getUserId();
	}

}
