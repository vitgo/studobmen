package by.conspect.service;


public interface MailService {
	
	public void sendMail(String from, String to, String subject, String msg) throws Exception;
	
}
