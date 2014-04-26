package cft.commons.showcase.service.impl;

import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;

import cft.commons.core.constant.Constants;
import cft.commons.core.helper.spring.ApplicationContextHelper;
import cft.commons.showcase.service.EmailService;

/**
 * MIME邮件服务类.
 * 
 * @author daniel
 */
public class EmailServiceImpl implements EmailService {

	private static Logger logger = LoggerFactory.getLogger(EmailServiceImpl.class);

	private JavaMailSender mailSender;

	private String contentTemplate;

	@Async
	public void sendForgotPasswordMail(String name, String userId, String from, String to, String subject) {

		try {
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, Constants.ENCODING_UTF8);

			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject(subject);

			String content = String.format(contentTemplate, name, userId, new Date());
			helper.setText(content, true);

			Resource image = ApplicationContextHelper.appCtx.getResource("static/images/cs_girl.jpg");
			helper.addInline("cs_girl", image);
			
			mailSender.send(msg);

			logger.info("email sent successful: " + to);
		} catch (Exception e) {
			logger.error("Exception during sending email", e);
		}
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setContentTemplate(String contentTemplate) {
		this.contentTemplate = contentTemplate;
	}

}
