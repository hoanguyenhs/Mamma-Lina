package com.hoanguyenhs.mammalina;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailTLS {
	
	final String username = "mammalina.webad@gmail.com";
	final String password = "hoanguyenhs92";
	final String destination = "nguyenthuanhoahs@gmail.com";
	
	public boolean sendMessage(String name, String phone, String email, String message1) {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		String content = "<b>Name:</b> " + name + "<br>" +
						"<b>Phone:</b> " + phone + "<br>" +
						"<b>Email:</b> " + email + "<br>" +
						"<b>Message:</b> " + message1 + "<br><br><br>" +
						"<i>Please do not reply this email.<br>" +
						"Thank you very much.<br>" + 
						"Web Admin</i>";

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destination));
			message.setSubject("Booking Alert");
			message.setContent(content, "text/html; charset=utf-8");
			Transport.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean booking(String name, String phone, String email, String date, String time) {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		String content = "<b>Name:</b> " + name + "<br>" +
						"<b>Phone:</b> " + phone + "<br>" +
						"<b>Email:</b> " + email + "<br>" +
						"<b>Date:</b> " + date + "<br>" +
						"<b>Time:</b> " + time + "<br><br><br>" +
						"<i>Please do not reply this email.<br>" +
						"Thank you very much.<br>" + 
						"Web Admin</i>";

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destination));
			message.setSubject("Recorded Message");
			message.setContent(content, "text/html; charset=utf-8");
			Transport.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}

//	public static void main(String[] args) {
//		final String username = "mammalina.webad@gmail.com";
//		final String password = "hoanguyenhs92";
//
//		Properties props = new Properties();
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.host", "smtp.gmail.com");
//		props.put("mail.smtp.port", "587");
//
//		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(username, password);
//			}
//		});
//
//		try {
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(username));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("nguyenthuanhoahs@gmail.com"));
//			message.setSubject("Testing Subject");
//			message.setText("Dear Hoa," + "\n\n This is test mail!");
//			Transport.send(message);
//			System.out.println("Done");
//		} catch (MessagingException e) {
//			throw new RuntimeException(e);
//		}
//	}
}
