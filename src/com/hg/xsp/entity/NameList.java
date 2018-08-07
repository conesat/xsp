package com.hg.xsp.entity;

import java.util.ArrayList;
import java.util.List;

public class NameList {
	private List<Name> names=new ArrayList<>();//用户列表
	private String name="";//群组名
	public NameList() {
		// TODO Auto-generated constructor stub
	}
	public List<Name> getNames() {
		return names;
	}
	public void setNames(List<Name> names) {
		this.names = names;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "NameList [names=" + names + ", name=" + name + "]";
	}
	public NameList(List<Name> names, String name) {
		super();
		this.names = names;
		this.name = name;
	}
	
	
}
