package sms.spring.DAO;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sms.spring.entity.Student;

@Repository
public class StudentDaoImpl implements StudentDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Student> getStudents() {
		List<Student> sList = null;

		Session currentSession = sessionFactory.getCurrentSession();

		try {
			Query<Student> query = currentSession.createQuery("from Student", Student.class);
			sList = query.getResultList();
			return sList;

		} catch (NoResultException e) {
			return null;
		}

	}

	@Override
	public void saveStudent(Student theStudent) {
		Session currentSession = sessionFactory.getCurrentSession();

		currentSession.saveOrUpdate(theStudent);

	}

	@Override
	public void deleteStudent(Integer sId) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		try {
			Query query = currentSession.createQuery("delete from Student where studentId=:sid");
			query.setParameter("sid", sId);
			query.executeUpdate();
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public Student getStudentById(Integer id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Student theStudent = currentSession.get(Student.class, id);
		
		return theStudent;
	}

	@Override
	public List<Student> searchStundet(String name) {
		Session currentSession = sessionFactory.getCurrentSession();
		System.out.println(name);
		Query query = null;
		
		if (name != null && name.trim().length() > 0) {
			query =currentSession.createQuery("from Student where lower(firstName) like :theName or lower(lastName) like :theName", Student.class);
            query.setParameter("theName", "%" + name.toLowerCase() + "%");

		} else {
			query = currentSession.createQuery("from Student", Student.class);
		}
		
		List<Student> students = query.getResultList();
		
		return students;
	}

}
