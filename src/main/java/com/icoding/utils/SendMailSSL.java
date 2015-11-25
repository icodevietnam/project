package com.icoding.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailSSL {
	public static void sendMailResetPassword(String toEmail) {
		Properties props = new Properties();
		props.put("ail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("ee111213141516",
								"Toilatoi1");
					}
				});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("ee111213141516@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(toEmail));
			message.setSubject("Reset Password");
			message.setText("Dear Customer,"
					+ "\n\n Your password will be changed!!!"
					+ "\n\n New password: EE223344@5");
			Transport.send(message);
			System.out.println("Done");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//https://www.google.com/settings/security/lesssecureapps
	public static void sendMailTLSResetPassword(String toEmail){
		final String username = "ee111213141516@gmail.com";
		final String password = "Toilatoi1";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getInstance(props,
				  new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				  });
				try {
					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress("ee111213141516@gmail.com"));
					message.setRecipients(Message.RecipientType.TO,
							InternetAddress.parse(toEmail));
					message.setSubject("Reset Password");
					message.setText("Dear Customer,"
							+ "\n\n Your password will be changed!!!"
							+ "\n\n New password: EE223344@5");
					Transport.send(message);
					System.out.println("Done");
				} catch (Exception e) {
					e.printStackTrace();
				}
	}
}
