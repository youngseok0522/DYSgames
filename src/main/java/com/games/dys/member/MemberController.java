package com.games.dys.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.games.dys.member.dto.MemberDTO;
import com.games.dys.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired MemberService service;
	
	@RequestMapping(value = "memberProc")
	public String memberProc(MemberDTO member) {
		service.memberProc(member);
		return "forward:/memberSuccess";
	}
	
	@RequestMapping(value = "idExist", produces ="application/text; charset=utf8")
	@ResponseBody
	public String idExist(@RequestBody String id) {
		String result = service.idExist(id);
		return result;
	}
}
