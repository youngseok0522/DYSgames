package com.games.dys.login.dao;

import org.springframework.stereotype.Repository;

import com.games.dys.login.dto.LoginDTO;

@Repository
public interface LoginDAO {
	public LoginDTO loginProc(LoginDTO login);
}

