package sms.spring.DAO;

import java.util.List;

import sms.spring.entity.Student;

public interface StudentDao {
	
	public List<Student> getStudents();
	
	public void saveStudent(Student theStudent);
	
	public void deleteStudent(Integer sId);
	
	public Student getStudentById(Integer id);
	
	public List<Student> searchStundet(String name);
	
}
