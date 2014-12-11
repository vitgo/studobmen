package by.conspect.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	public static final String FROM_ADDRESS = "conspect.service@gmail.com";
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMail(String from, String to, String subject, String msg) throws Exception {
		MimeMessage mes = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mes, true, "UTF-8");
		helper.setFrom(from);
		helper.setTo(to);
		helper.setSubject(subject);
		helper.setText(msg, true);
		System.setProperty("mail.mime.charset", "utf8");
		mailSender.send(mes);
	}
	
}
