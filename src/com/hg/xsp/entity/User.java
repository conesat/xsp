package com.hg.xsp.entity;

public class User {
	private int id = 0;
	private String name = "";
	private String password = "";
	private String mail = "";
	
	public User() {

	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", mail=" + mail + "]";
	}
	public User(int id, String name, String password, String mail) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.mail = mail;
	}

}
