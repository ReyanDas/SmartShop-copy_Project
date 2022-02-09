package com.learn.mycart.helper;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import java.util.*;

public class Mailer {
	protected static final String senderMail = "reyandas7960@gmail.com";
	protected static final String senderMailPassword = "reyan@1999";
	protected static final String host = "smtp.gmail.com";

	public static boolean sendMail(String mailBody, String mailSubject, String recipientMail) {
		boolean status;

		// get system properties
		Properties properties = System.getProperties();

//		setting system properties
		properties.put("mail.smtp.host", Mailer.host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

//		get session object
		Session session = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(Mailer.senderMail, Mailer.senderMailPassword);
			}

		});

	
		MimeMessage msg = new MimeMessage(session);
		try {
			session.setDebug(true);
			msg.setFrom(new InternetAddress(Mailer.senderMail));
			msg.addRecipient(RecipientType.TO, new InternetAddress(recipientMail));
			msg.setSubject(mailSubject);
			msg.setText(mailBody);
			Transport.send(msg);
			System.out.println("mail sent successfully......");
			status = true;

		} catch (Exception e) {
			e.printStackTrace();
			status = false;
		}
		return status;

	}

}
