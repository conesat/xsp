package com.hg.xsp.entity;
/**
 * 提交时的信息
 * @author 拉布拉多是条狗
 *
 */
public class Name {
	private String id = "";// 提交文件所用的编号
	private String name = "";// 登录所用的姓名
	private String date = "";// 提交日期
	private String state = "";// 提交状态
	private String fileName = "";// 提交的文件名
	public Name() {
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "Name [id=" + id + ", name=" + name + ", date=" + date + ", state=" + state + ", fileName=" + fileName
				+ "]";
	}
	public Name(String id, String name, String date, String state, String fileName) {
		super();
		this.id = id;
		this.name = name;
		this.date = date;
		this.state = state;
		this.fileName = fileName;
	}
	
	
}
