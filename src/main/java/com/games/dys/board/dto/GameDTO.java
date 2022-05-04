package com.games.dys.board.dto;

/*
create table game_board(
no number,		
title varchar2(40),
link varchar2(400),
price varchar2(20),
launching varchar2(20),
genre varchar2(50),
publisher varchar2(30),
developer varchar2(30),
platform varchar2(30),
language varchar2(20),
explanation varchar2(4000),
primary KEY(no));
*/

public class GameDTO {
	private int no;
	private String title;
	private String link;
	private String price;
	private String launching;
	private String genre;
	private String publisher;
	private String developer;
	private String platform;
	private String language;
	private String explanation;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getLaunching() {
		return launching;
	}
	public void setLaunching(String launching) {
		this.launching = launching;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
}
