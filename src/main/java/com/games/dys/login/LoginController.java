package com.games.dys.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.games.dys.login.dto.LoginDTO;
import com.games.dys.login.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired LoginService loginService;
	
	@RequestMapping(value = "loginProc")
	public String loginProc(LoginDTO login,Model model) {
		System.out.println(login.getId()+""+login.getPw());
		boolean check = loginService.loginProc(login);
		
		if(check==true) {
			return "forward:/index";
		}else {
			model.addAttribute("msg", "아이디 비밀번호를 확인해주세요.");
			return "forward:/login";
		}
	}
}
