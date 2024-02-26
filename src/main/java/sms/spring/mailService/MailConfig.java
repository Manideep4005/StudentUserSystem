package sms.spring.mailService;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class MailConfig {
	
	/* Mail configuration for user registration.*/
	public boolean userSendEmail(String to, Integer userId, String userName) {
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

		final String mailUserName = "systems2hms";
		final String mailPassword = "raci ycsi wean vezu";

		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress("systems2hms@gmail.com", "no-replay@Student Management System."));
			message.setSubject(userName + " thank you for registering at Student Management System");
			message.setContent("<!DOCTYPE html>\r\n"
					+ "<html lang=\"en\">\r\n"
					+ "  <head>\r\n"
					+ "    <style>*{"
					+ "font-family: 'Times New Roman', Times, serif;}body{"
					+ ""
					+ "background:#f9f9f9;}\r\n"
					+ "      .container {\r\n"
					+ "        width: 700px;margin:auto;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .para {\r\n"
					+ "        font-size: 18px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      #user_id {\r\n"
					+ "        font-weight: 600;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      #login {\r\n"
					+ "        text-decoration: none;\r\n"
					+ "        color: dodgerblue;\r\n"
					+ "        display: block;\r\n"
					+ "        text-align: center;\r\n"
					+ "        font-size: 18px;\r\n"
					+ "        border: 1px solid dodgerblue;\r\n"
					+ "        width: 100px;\r\n"
					+ "        margin: auto;\r\n"
					+ "        padding: 10px;"
					+ "transition-duration: .4s;\r\n"
					+ "      } #login:hover{color:white;background:dodgerblue;}\r\n"
					+ "\r\n"
					+ "      #message {\r\n"
					+ "        text-align: center;\r\n"
					+ "        font-size: 15px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      #message a {\r\n"
					+ "        text-decoration: none;\r\n"
					+ "        color: blue;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      #note {\r\n"
					+ "        font-size: 16px;\r\n"
					+ "      }\r\n"
					+ "    </style>\r\n"
					+ "  </head>\r\n"
					+ "  <body>\r\n"
					+ "    <div class=\"container\">\r\n"
					+ "      <p class=\"para\">\r\n"
					+ "        Dear "+userName+",\r\n"
					+ "\r\n"
					+ "        <br /><br />\r\n"
					+ "        You have registered as a user at Student Management system.\r\n"
					+ "        <br /><br />\r\n"
					+ "        For your identification a Unique user id is generated for you, the id\r\n"
					+ "        is:&nbsp;<span id=\"user_id\">"+ userId+"</span> use your id and password for\r\n"
					+ "        login. <br /><br />\r\n"
					+ "        click below button for login\r\n"
					+ "        <br /><br />\r\n"
					+ "        <a href=\"http://"+iAddress()+":8081/springsms/\" id=\"login\">click here</a>\r\n"
					+ "        <br /><br /><br />\r\n"
					+ "        Best Regards,<br />Student Management system\r\n"
					+ "      </p>\r\n"
					+ "      <hr />\r\n"
					+ "      <p id=\"note\">Note: This email is system generated please do not replay</p>\r\n"
					+ "      <p id=\"message\">\r\n"
					+ "        This email was intended for\r\n"
					+ "        <a href=\"mailto:"+to+"\">"+to+"</a>\r\n"
					+ "      </p>\r\n"
					+ "    </div>\r\n"
					+ "  </body>\r\n"
					+ "</html>\r\n", "text/html");

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}
	
	
	/* OTP FOR USER PASSWORD RESET*/
	public boolean userSendEmailPasswordChangeOTP(String to, Integer OTP, String userName) {
		boolean flag = false;

		// Smtp properties (simple mail transfer protocol)
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

		final String mailUserName = "systems2hms";
		final String mailPassword = "raci ycsi wean vezu";

		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailUserName, mailPassword);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress("systems2hms@gmail.com", "no-replay@Student Management System."));
			message.setSubject("requested for password reset");
			message.setContent("<!DOCTYPE html>\r\n"
					+ "<html lang=\"en\">\r\n"
					+ "  <head>\r\n"
					+ "    <style>*{"
					+ "font-family: 'Times New Roman', Times, serif;}body{"
					+ ""
					+ "background:#f9f9f9;}\r\n"
					+ "      .container {\r\n"
					+ "        width: 700px;margin:auto;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      .para {\r\n"
					+ "        font-size: 18px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      #user_id {\r\n"
					+ "        font-weight: 600;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      #login {\r\n"
					+ "        text-decoration: none;\r\n"
					+ "        color: dodgerblue;\r\n"
					+ "        display: block;\r\n"
					+ "        text-align: center;\r\n"
					+ "        font-size: 18px;\r\n"
					+ "        border: 1px solid dodgerblue;\r\n"
					+ "        width: 100px;\r\n"
					+ "        margin: auto;\r\n"
					+ "        padding: 10px;"
					+ "transition-duration: .4s;\r\n"
					+ "      } #login:hover{color:white;background:dodgerblue;}\r\n"
					+ "\r\n"
					+ "      #message {\r\n"
					+ "        text-align: center;\r\n"
					+ "        font-size: 15px;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      #message a {\r\n"
					+ "        text-decoration: none;\r\n"
					+ "        color: blue;\r\n"
					+ "      }\r\n"
					+ "\r\n"
					+ "      #note {\r\n"
					+ "        font-size: 16px;\r\n"
					+ "      }\r\n"
					+ "    </style>\r\n"
					+ "  </head>\r\n"
					+ "  <body>\r\n"
					+ "    <div class=\"container\">\r\n"
					+ "      <p class=\"para\">\r\n"
					+ "        Dear "+userName+",\r\n"
					+ "\r\n"
					+ "        <br /><br />\r\n"
					+ "        You receiving this email as you have requested for a password reset for your user account.\r\n"
					+ "        <br /><br />\r\n"
					+ "        The OTP \r\n"
					+ "        is:&nbsp;<span id=\"user_id\">"+ OTP+"</span><br><br/><br/>"
					+ "        Best Regards,<br />Student Management system\r\n"
					+ "      </p>\r\n"
					+ "      <hr />\r\n"
					+ "      <p id=\"note\">Note: This email is system generated please do not replay</p>\r\n"
					+ "      <p id=\"message\">\r\n"
					+ "        This email was intended for\r\n"
					+ "        <a href=\"mailto:"+to+"\">"+to+"</a>\r\n"
					+ "      </p>\r\n"
					+ "    </div>\r\n"
					+ "  </body>\r\n"
					+ "</html>\r\n", "text/html");

			Transport.send(message);

			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}
	
	
	/*Ip Address*/
	public static String iAddress() throws UnknownHostException {
		InetAddress ip;

		ip = InetAddress.getLocalHost();

		String s = ip.getHostAddress();
		return s;
	}

}
