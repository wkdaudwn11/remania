package com.util;

import com.entity.member.MemberDTO;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.MimeUtility;
import java.util.Date;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.Address;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import javax.mail.Authenticator;
import java.util.Properties;

public class SendMail {
	
	String host = "smtp.naver.com";
	String subject = "안녕하세요. 중고매니아 입니다.";
	String from = "wkdaudwn11@naver.com"; //보내는 사람의 메일주소
	String passwd = "qjffp0101";
	
	public void sendMail(MemberDTO memberDTO, String mobile){
		String to = memberDTO.getEmail(); //받는 사람의 메일주소
		String fromName = memberDTO.getName();	//받는 사람의 이름
		String content = "";
		if(mobile.equals("o")){
			content = "링크를 클릭해주세요. \n <a href='http:\\localhost:8090/remania/mobileUpdatePwdUI'>[중고매니아] 이메일 인증하기 </a>";
		}else{
			content = "링크를 클릭해주세요. \n <a href='http:\\localhost:8090/remania/updatePwdUI'>[중고매니아] 이메일 인증하기 </a>";
			//content = "링크를 클릭해주세요. \n <a href='http:\\localhost:8090/remania/updatePwdUI?email=email'>[중고매니아] 이메일 인증하기 </a>";
		}
		
		try {
			//프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
			Properties props = new Properties();
			//네이버 SMTP 사용시
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);

			props.put("mail.smtp.port", "465"); // 보내는 메일 포트 설정
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");

			// Authenticator auth = new SendMail();
			Authenticator auth = new SMTPAuthenticator();
			//Session mailSession = Session.getDefaultInstance(props,auth);
			Session mailSession = Session.getInstance(props, auth);
			mailSession.setDebug(true);
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B"))); //보내는 사람 설정
			InternetAddress[] address = { new InternetAddress(to) };

			msg.setRecipients(Message.RecipientType.TO, address); //받는 사람설정

			msg.setSubject(subject); //제목설정
			msg.setSentDate(new java.util.Date()); //보내는 날짜 설정
			msg.setContent(content, "text/html; charset=UTF-8"); //내용 설정(MIME 지정-HTML 형식)

			Transport.send(msg); //메일 보내기

			System.out.println("메일 발송을 완료하였습니다.");
		} catch (MessagingException ex) {
			System.out.println("mail send error : " + ex.getMessage());
			ex.printStackTrace();
		} catch (Exception e) {
			System.out.println("error : " + e.getMessage());
			e.printStackTrace();
		}
		
	}// sendMail(MemberDTO memberDTO, String mobile)
	
	private class SMTPAuthenticator extends javax.mail.Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(from, passwd);
		}
	}// SMTPAuthenticator
	
}///////////////////////////////////////////////////////////////////////////
