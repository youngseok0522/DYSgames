package com.games.dys.member.service;


import java.util.Random;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.games.dys.member.dao.MemberDAO;
import com.games.dys.member.dto.MemberDTO;


@Service
public class MemberService{
	final static Logger logger = LoggerFactory.getLogger(MemberService.class);

	@Autowired MemberDAO dao;
	@Autowired HttpSession session;
	@Autowired MailService mailService;
	
	public String memberProc(MemberDTO member) {
		Boolean check = (Boolean)session.getAttribute("authState");
		if(check == null) {
			return "이메일 인증 후 가입할 수 있습니다.";
		}
		
		if(member.getId() == "" || member.getPw() == "") {
			return "필수 정보를 입력해주세요";
		}
		
		dao.insertMember(member);
		dao.insertLogin(member);
		session.removeAttribute("authState");
		
		return "가입 완료";
	}
	
	public String sendAuth(String email) {
		String authNum = (String)session.getAttribute("authNum");
		if(authNum == null) {
			Random r = new Random();
			String rNum = String.format("%06d", r.nextInt(1000000));
			session.setAttribute("authNum", rNum);
			session.setMaxInactiveInterval(180);
			mailService.sendMail(email, "[DYS games 인증번호]", "안녕하세요. DYS games입니다.\n 요청하신 인증번호는 ["+rNum+"] 입니다.");
			logger.warn("이메일 : " + email);
			logger.warn("인증번호 : " + rNum);
			return "인증번호를 발송했습니다. \n3분 이내에 확인해 주세요.";
		}
		else {
			return "인증번호가 이미 발송되었습니다.";
		}
	}

	public String authCheck(String authNum){
		String sessionAuthNum = (String)session.getAttribute("authNum");
		logger.warn(sessionAuthNum);
		if(sessionAuthNum == null) {
			return "인증번호를 생성해주세요.";
		}
		if(authNum == "") {
			return "인증번호를 입력해주세요";
		}
		if(authNum.equals(sessionAuthNum)) {
			session.setAttribute("authState", true);
			return "인증 성공";
		}
		return "인증 실패";
	}
	
	public String idExist(String id) {
		logger.warn("idExist");
		int count = dao.idExist(id);
		if(count == 0) {
			return "사용 가능한 아이디입니다.";
		}
		return "중복된 아이디입니다.";
	}
	
}
