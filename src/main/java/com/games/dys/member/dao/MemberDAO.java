package com.games.dys.member.dao;

import org.springframework.stereotype.Repository;

import com.games.dys.member.dto.MemberDTO;

@Repository
public interface MemberDAO {
	public void insertMember(MemberDTO member);
	
	public void insertLogin(MemberDTO member);
	
	public int idExist(String id);
}
