package com.games.dys.login.dto;

/*
SQL> create table dys_login(
  2  id varchar2(20),
  3  pw varchar2(30));
 */
public class LoginDTO {
	private String id;
	private String pw;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
}