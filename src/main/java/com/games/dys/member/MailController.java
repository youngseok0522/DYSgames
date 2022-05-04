package com.games.dys.member;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.games.dys.member.service.MemberService;

@RestController
public class MailController {
	final static Logger logger = LoggerFactory.getLogger(MailController.class);
	
	
	@Autowired MemberService service;
	
	@RequestMapping(value = "sendAuth", produces ="application/text; charset=utf8")
	public String sendAuth(HttpSession session, @RequestBody String email){
		logger.warn(email);
		
		String auth;
		Boolean check = (Boolean)session.getAttribute("authState");
		
		if(check != null && check == true) {
			auth = "인증 완료되었습니다.";
			return auth;
		}
		
		auth = service.sendAuth(email);
		
		return auth;
	}
	
	@RequestMapping(value = "authCheck", produces ="application/text; charset=utf8")
	public String authCheck(HttpSession session, @RequestBody String authNum, Model model){
		logger.warn("authCheck");
		
		String checkResult;
		Boolean check = (Boolean)session.getAttribute("authState");
		
		if(check != null && check == true) {
			checkResult = "인증 완료되었습니다.";
			return checkResult;
		}
		
		checkResult = service.authCheck(authNum);
		
		return checkResult;
	}
	
	
	@RequestMapping(value = "sessionRemove")
	public void sessionRemove(HttpSession session) {
		if(session.getAttribute("authState") != null) {
			session.invalidate();	
		}
		if(session.getAttribute("authNum") != null) {
			session.removeAttribute("authNum");
		}
	}
	
}
