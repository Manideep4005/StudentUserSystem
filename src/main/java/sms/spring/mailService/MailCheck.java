package sms.spring.mailService;

import java.net.UnknownHostException;

public class MailCheck {
	@SuppressWarnings("static-access")
	public static void main(String[] args) throws UnknownHostException {
		MailConfig sendMail = new MailConfig();
		
		
		String to = "to";
		String from = "from";
		String subject = "This testing mail for Student Management System"
				+ "";
		
		
		boolean b = sendMail.userSendEmail(to, 15800, "Manideep Nakka");
		
		if (b) {
			System.out.println(sendMail.iAddress());
			System.out.println("Mail has send to receipient Successfull.");
		} else {
			System.out.println("There is an error while sending Email.");
		}
	
	}
}
