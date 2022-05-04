package com.games.dys.member.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	@Bean
    public static JavaMailSender mailSender() {
		JavaMailSenderImpl jms = new JavaMailSenderImpl();

		jms.setHost("smtp.gmail.com");//google smtp 서버 설정
		jms.setPort(587);//google smtp 메일 서버 포트
		
		/*
		 *  Naver Mail을 이용해 전송
			jms.setHost("smtp.naver.com");
			jms.setPort(465);
		*/
		jms.setUsername("?");//보내는 계정
		jms.setPassword("?");

		//메일 전달 프로토콜 세부 설정
		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");
		prop.setProperty("mail.smtp.starttls.enable", "true");
		
		//prop.setProperty("mail.smtp.ssl.enable", "true"); // naver 사용시
		jms.setJavaMailProperties(prop);
	
		return jms;
    }

}