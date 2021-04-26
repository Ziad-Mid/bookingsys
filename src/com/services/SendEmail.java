package com.services;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	
	 //generate vrification code
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    //send email to the user email
    public boolean sendEmail(String email , String code) {
        boolean test = false;

        String toEmail = email;
        String Code =  code;
        String myAccountEmail = "test980.test980@gmail.com"; //put your email here for test
        String password ="test098@test/"; //put your email password here

        try {

            // your host email smtp server details
        	Properties properties = new Properties();
        	
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable","true");
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");
            
            //get session to authenticate the host email address and password
            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(myAccountEmail, password);
                }
            });

         
          

            Message message = prepareMessage(session, myAccountEmail, toEmail ,  Code );
            
    	
    		
            Transport.send(message);
            
            test=true;
            
          
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

	private static Message prepareMessage(Session session, String myAccountEmail, String toEmail ,String code) {
		try {
			   //set email message details
			Message message = new MimeMessage(session);
			//set from email address
			message.setFrom(new InternetAddress(myAccountEmail));
			//set to email address or destination email address
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			//set email subject
			message.setSubject("User Email Verification");  
			//set message text
			message.setText("Registered successfully.Please verify your account using this code: " + code);
			return message;
		}catch(Exception e)
		{
			System.out.print("error sending mssg");
		}		
		return null;
	}
}
