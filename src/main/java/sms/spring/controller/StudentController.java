package sms.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sms.spring.entity.Student;
import sms.spring.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;

	@GetMapping("students-list")
	public String getStudents(Model theModel) {
		
		List<Student> sList = studentService.getStundets();
		theModel.addAttribute("students", sList);
		
		return "students-list";
	}
	
	@GetMapping("student-form")
	public String getStudentFormAdd(Model theModel) {
		
		Student theStudent = new Student();
		
		theModel.addAttribute("student", theStudent);
		
		return "student-form";
	}
	
	@PostMapping("/student-add")
	public String addStudent(@ModelAttribute("student") Student theStudent) {
		
		studentService.saveStudent(theStudent);
		
		return "redirect:/students-list";
	}
	
	@GetMapping("/student-delete") 
	public String deleteStudent(@RequestParam("studentId") Integer theId) {
		
		studentService.deleteStudent(theId);
		
		return "redirect:/students-list";
	}
	
	
	@GetMapping("/student-update")
	public String editStudent(@RequestParam("studentId") Integer theId,Model theModel) {
		
		Student theStudent = studentService.getStudentById(theId);
		theModel.addAttribute("student", theStudent);
		
		return "student-form";
	}
	
	@GetMapping("/student-search")
	public String searchStudent(@RequestParam("student_name") String name, Model theModel) {
		
		List<Student> students = studentService.searchStundet(name);
		theModel.addAttribute("students", students);
		return "students-list";
	}
}
