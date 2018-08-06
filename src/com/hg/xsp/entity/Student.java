package com.hg.xsp.entity;

public class Student {
	private String stu_id="";
	private String name="";
	private String open="";
	private String state="";
	private String url="";
	public Student() {
		// TODO Auto-generated constructor stub
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "RegisterAndLogin [stu_id=" + stu_id + ", name=" + name + ", open=" + open + ", state=" + state
				+ ", url=" + url + "]";
	}
	public Student(String stu_id, String name, String open, String state, String url) {
		super();
		this.stu_id = stu_id;
		this.name = name;
		this.open = open;
		this.state = state;
		this.url = url;
	}

	
}
