package cft.commons.showcase.service;

public interface EmailService {

	void sendForgotPasswordMail(String name, String userId, String from, String to, String subject);
	
}
