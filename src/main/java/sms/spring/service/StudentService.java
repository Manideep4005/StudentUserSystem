package sms.spring.service;

import java.util.List;

import sms.spring.entity.Student;

public interface StudentService {
	public List<Student> getStundets();

	public void saveStudent(Student theStudent);

	public void deleteStudent(Integer sId);

	public Student getStudentById(Integer id);

	public List<Student> searchStundet(String name);

}
