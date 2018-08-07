package com.hg.xsp.dao;

import java.util.List;

import com.hg.xsp.entity.Student;

public interface SelectMapper {
	public List<Student> selectListNo();
	public List<Student> selectListYes();
	public List<String> selectListMsg();
}
