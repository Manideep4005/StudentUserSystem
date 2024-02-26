package sms.spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sms.spring.DAO.StudentDao;
import sms.spring.entity.Student;

@Service
public class StundetServiceImpl implements StudentService {

	@Autowired
	private StudentDao studentDao;
	
	@Override
	@Transactional
	public List<Student> getStundets() {
		return studentDao.getStudents();
	}

	@Override
	@Transactional
	public void saveStudent(Student theStudent) {
		
		studentDao.saveStudent(theStudent);
	}

	@Override
	@Transactional
	public void deleteStudent(Integer sId) {
		studentDao.deleteStudent(sId);
		
	}

	@Override
	@Transactional
	public Student getStudentById(Integer id) {
		// TODO Auto-generated method stub
		return studentDao.getStudentById(id);
	}

	@Override
	@Transactional
	public List<Student> searchStundet(String name) {
		// TODO Auto-generated method stub
		return studentDao.searchStundet(name);
	}

}
