package sms.spring.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sms.spring.entity.User;
import sms.spring.mailService.MailConfig;
import sms.spring.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	// Starting request
	@RequestMapping("/")
	public String userLogin() {
		return "login";
	}

	// User login end points.
	@PostMapping("/user-login")
	public String loginProcess(@RequestParam("userid") Integer user_id, @RequestParam("password") String password,
			Model theModel, HttpServletRequest request) {

		String href = "";
		HttpSession session = request.getSession();

		User user = new User();

		List<User> list = userService.getUsers(user_id, password);
		System.out.println(list.size());
		System.out.println("\n\n\n\n" + list);

		Iterator<User> itr = list.iterator();

		Integer userId = null;
		String FirstName = "";
		String lastName = "";

		if (list.size() != 0) {
			while (itr.hasNext()) {
				user = itr.next();
				System.out.println("\nThe User Id:" + user.getUserId());
				userId = user.getUserId();
				FirstName = user.getFirstName();
				lastName = user.getLastName();
			}
			session.setAttribute("currentUserId", userId);
			session.setAttribute("currentUserName", FirstName + " " + lastName);
			href = "redirect:/StudentManagementSystem";
		}

		else if (list.size() == 0 || list == null) {
			System.out.println("\nuser Login failed\n");
			theModel.addAttribute("error", "Invalid user id/Password");
			href = "login";
		}

		return href;
	}

	// user logout functionality
	@GetMapping("/user-login")
	public String loginDisplay(Model theModel, HttpSession session) {

		if (session.getAttribute("currentUserId") != null) {
			session.invalidate();
			System.out.println("\nLogged out user\n");
			theModel.addAttribute("success", "You have logged out Successfully!!!");

		}

		String profileUpdateMessage = (String) theModel.asMap().get("userPasswordChangeSuccess");
		if (profileUpdateMessage != null) {
			theModel.addAttribute("userPasswordChangeSuccess", "Password Reset Success!");
			return "login";
		}

		return "login";
	}

	// Mapping to StudentManagemetSystem Home
	@GetMapping("/StudentManagementSystem")
	public String getHome() {
		return "studentmanagementsystem";
	}

	// Mapping to display all Users
	@GetMapping("/list-users")
	public String displayUsers(Model theModel) {
		List<User> uList = userService.getAllUsers();
		theModel.addAttribute("usersList", uList);
		return "users-list";
	}

	// get user details by user id
	@GetMapping("/user-details")
	public String getUserDetailsbyId(Model theModel, @RequestParam("id") Integer userId) {

		List<User> uList = userService.getUserById(userId);
		theModel.addAttribute("usersList", uList);

		String message = (String) theModel.asMap().get("passwordUpdateUser");

		if (message != null) {
			theModel.addAttribute("passwordUserUpdate", "Password changed successfully.");
			return "user-details";
		}

		String profileUpdateMessage = (String) theModel.asMap().get("userProfileUpdate");
		if (profileUpdateMessage != null) {
			theModel.addAttribute("profileUpdateUser", "Profile updated successfully.");
			return "user-details";
		}

		return "user-details";
	}

	@GetMapping("/user-register")
	public String registerUser(Model theModel) {
		User user = new User();
		theModel.addAttribute("user_model", user);
		return "user-form";
	}

	// Registering the User
	@PostMapping("/user-add")
	public String addStudent(@ModelAttribute("user_model") User theUser, Model theModel, RedirectAttributes ra) {

		Integer newUserId = userService.saveUser(theUser);

		theModel.addAttribute("user", theUser);

		ra.addFlashAttribute("newUserId", newUserId);

		return "redirect:/login-user"; // redirecting to helper controller
	}

	// helper controller redirecting for registering controller
	@GetMapping("login-user")
	public String addStudentHandler(Model theModel, HttpServletRequest request) {

		Integer userId = (Integer) theModel.asMap().get("newUserId");
		System.out.println("first time " + userId);
		theModel.addAttribute("userIdnew", userId);
		System.out.println("second time " + userId);
		return "login";
	}

	// Mapping to show user password update form
	@GetMapping("user-update-password")
	public String getUserPassUpdateForm() {

		return "user-update-password";
	}

	// Post Mapping to Update User Password
	@PostMapping("update-user-password")
	public String updatePasswordUser(@RequestParam("user_id") Integer theId, @RequestParam("upassword") String password,
			Model theModel, RedirectAttributes ra) {

		userService.userUpdatePassword(theId, password);
		theModel.addAttribute("passwordUpdateUser", "Password changed successfully.");
		ra.addFlashAttribute("passwordUpdateUser", "Password changed successfully.");

		return "redirect:/user-details?id=" + theId;
	}

	// Mapping to update user
	@GetMapping("/user-update-form")
	public String showUserUpdateform(@RequestParam("userId") Integer theId, Model theModel) {

		User user = userService.getUserbyId(theId);
		theModel.addAttribute("user_model", user);

		return "user-update-form";
	}

	// Mapping for user update
	@PostMapping("user-update")
	public String updateUser(@ModelAttribute("user_model") User theUser, Model theModel, RedirectAttributes ra,
			HttpServletRequest request) {

		HttpSession session = request.getSession();

		Integer userId = userService.updateUser(theUser);

		List<User> list = userService.getUserById(userId);

		Iterator<User> itr = list.iterator();

		String firstName = "";
		String lastName = "";

		User user = new User();

		if (list.size() != 0) {
			while (itr.hasNext()) {
				user = itr.next();
				firstName = user.getFirstName();
				lastName = user.getLastName();
			}
		}
		session.setAttribute("currentUserName", firstName + " " + lastName);

		ra.addFlashAttribute("userProfileUpdate", "Profile Updated successfully.");

		return "redirect:/user-details?id=" + userId;

	}

	// mapping for password forgot
	@GetMapping("/user-forgot-password")
	public String userForgotPass() {
		return "user-forgot-password";
	}

	// mapping for password change form
	@PostMapping("/change-user-password-form")
	public String getCPassForm(@RequestParam("user_id") Integer theId, HttpServletRequest request, Model theModel,
			RedirectAttributes ra) {
		HttpSession session = request.getSession();

		List<User> theUser = userService.getUserById(theId);

		if (theUser.size() != 0) {

			User getUserEmail = new User();
			String userEmail = "";
			String userFirstName = "";
			String userLastName = "";

			Random random = new Random();
			Integer otp = random.nextInt(999999 - 1 + 1) + 1;

			Iterator<User> itr = theUser.iterator();

			while (itr.hasNext()) {
				getUserEmail = itr.next();
				theId = getUserEmail.getUserId();
				userEmail = getUserEmail.getEmail();
				userFirstName = getUserEmail.getFirstName();
				userLastName = getUserEmail.getLastName();
			}

			MailConfig mail = new MailConfig();
			boolean mailSend = mail.userSendEmailPasswordChangeOTP(userEmail, otp, userFirstName + " " + userLastName);

			if (mailSend) {
				System.out.println("\nOTP has been sent to user Email With id: " + theId);
				session.setAttribute("userForgotPasswordId", theId);
				session.setAttribute("userPasswordOtp", otp);
				session.setAttribute("otpSentSuccess", "An OTP was sent to your mail.");
				return "redirect:/user-validate-otp";
			} else {

				ra.addFlashAttribute("OtpMailNotSent", "An error occurred!");
				return "redirect:/user-not-found";
			}
		}

		else {
			ra.addFlashAttribute("InvalidUserId", "User not found!");
			return "redirect:/user-not-found";

		}
	}

	@GetMapping("/user-validate-otp")
	public String userValidateOTP(HttpServletRequest request) {

		HttpSession session = request.getSession();

		Integer theId = (Integer) session.getAttribute("userForgotPasswordId");
		Integer otp = (Integer) session.getAttribute("userPasswordOtp");

		session.setAttribute("userForgotPasswordId", theId);
		session.setAttribute("userPasswordOtp", otp);

		return "user-forgot-password-otp";
	}

	@GetMapping("/user-not-found")
	public String userNotFOund(Model theModel) {

		String profileUpdateMessage = (String) theModel.asMap().get("InvalidUserId");
		if (profileUpdateMessage != null) {
			theModel.addAttribute("InvalidUserId", "User not found!");
			return "user-forgot-password";
		}

		String mailOTP = (String) theModel.asMap().get("OtpMailNotSent");
		if (mailOTP != null) {
			theModel.addAttribute("OtpMailNotSent", "An error occurred!");
			return "user-forgot-password";
		}

		return "user-forgot-password";
	}

	@PostMapping("/change-user-password")
	public String changeUpass(@RequestParam("user_id") Integer theId, @RequestParam("cpassword") String password,
			RedirectAttributes ra) {

		userService.userUpdatePassword(theId, password);

		ra.addFlashAttribute("userPasswordChangeSuccess", "Password reset success!");

		return "redirect:/user-login";
	}

	@PostMapping("/change-user-password-otp-validate")
	public String changePassValidateOtp(@RequestParam("user_otp") Integer otp, HttpSession session,
			RedirectAttributes ra) {

		Integer sentOtp = (Integer) session.getAttribute("userPasswordOtp");

		if (sentOtp.equals(otp)) {
			return "user-forgot-password-form";
		} else {
			ra.addFlashAttribute("InvalidUserOtp", "Invalid OTP");
			return "redirect:/user-otp";
		}

	}

	@GetMapping("user-otp")
	public String userInvalidOtp(Model theModel, HttpSession session) {
		String invalidOtp = (String) theModel.asMap().get("InvalidUserOtp");
		if (invalidOtp != null) {
			session.removeAttribute("otpSentSuccess");
			theModel.addAttribute("InvalidUserOtp", "Invalid OTP");
			return "user-forgot-password-otp";
		}

		return "user-forgot-password-otp";
	}
}
