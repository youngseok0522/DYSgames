package com.games.dys.login.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.games.dys.login.dao.LoginDAO;
import com.games.dys.login.dto.LoginDTO;

@Service
public class LoginService {
	final static Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	@Autowired HttpSession session;
	@Autowired LoginDAO dao;
	
	public boolean loginProc(LoginDTO login) {
		LoginDTO check = dao.loginProc(login);
		if(check == null) {
			logger.warn("null 실패");
			return false;
		}else if(login.getPw().equals(check.getPw())) {
			logger.warn("성공");
			session.setAttribute("id", login.getId());
			return true;
		}else {
			logger.warn("비밀번호 오류");
			return false;
		}
	}
}
