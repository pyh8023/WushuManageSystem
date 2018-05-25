package com.pan.competition.bean;

public class Admin {
	private String username;
	private String password;
	private String email;
	private String code;

	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	
	public Admin(String username, String password) {
		this.username = username;
		this.password = password;
	}
	
	public Admin() {
		super();
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
}
