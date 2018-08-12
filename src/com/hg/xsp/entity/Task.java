package com.hg.xsp.entity;

public class Task {

	private String id = "";//
	private String title = "";// 标题
	private String content = "";// 内容
	private String begin = "";// 开始时间
	private String end = "";// 结束时间
	private String state = "";// 状态
	private String nameListName = "";// 名单name
	private String mail="";//创建者邮箱

	public Task() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getNameListName() {
		return nameListName;
	}

	public void setNameListName(String nameListName) {
		this.nameListName = nameListName;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", title=" + title + ", content=" + content + ", begin=" + begin + ", end=" + end
				+ ", state=" + state + ", nameListName=" + nameListName + ", mail=" + mail + "]";
	}

	public Task(String id, String title, String content, String begin, String end, String state, String nameListName,
			String mail) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.begin = begin;
		this.end = end;
		this.state = state;
		this.nameListName = nameListName;
		this.mail = mail;
	}


}
