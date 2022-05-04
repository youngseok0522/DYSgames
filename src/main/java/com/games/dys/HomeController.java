package com.games.dys;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.warn("index");		
		return "index";
	}
	
	@RequestMapping(value = "/index")
	public String index() {
		logger.warn("index");
		return "index";
	}
	
	@RequestMapping(value = "/login")
	public String login(Model model) {
		logger.warn("login");
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member")
	public String member() {
		logger.warn("member");
		return "member/memberForm";
	}
	
	@RequestMapping(value = "/about")
	public String about() {
		logger.warn("about");
		return "board/about";
	}
	
	@RequestMapping(value = "/notice")
	public String notice() {
		logger.warn("notice");
		return "board/notice";
	}
	
	@RequestMapping(value = "/memberSuccess")
	public String memberSuccess() {
		logger.warn("memberSuccess");
		return "member/memberSuccessForm";
	}
	
	
}
