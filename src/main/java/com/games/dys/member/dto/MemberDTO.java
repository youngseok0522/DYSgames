package com.games.dys.member.dto;

/*
SQL> create table dys_member(
  2  id varchar2(20) not null,
  3  pw varchar2(30),
  4  email varchar2(50),
  5  zipcode int,
  6  address1 varchar2(100),
  7  address2 varchar2(100));
  
  ----
  8  constraint pk_dys_member primary key(id));
 */

public class MemberDTO {
	private String id;
	private String pw;
	private String email;
	private int zipcode;
	private String address1;
	private String address2;
	
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
}
