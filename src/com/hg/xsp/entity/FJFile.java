package com.hg.xsp.entity;

/**
 * 文件类
 * 
 * @author 拉布拉多是条狗
 *
 */
public class FJFile {
	private String name = "";// 文件名
	private String path = "";// 文件路劲

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "FJFile [name=" + name + ", path=" + path + "]";
	}

	public FJFile(String name, String path) {
		super();
		this.name = name;
		this.path = path;
	}

}
