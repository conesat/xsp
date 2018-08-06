package com.hg.xsp.services;

import java.util.List;

import com.hg.xsp.entity.Student;

public interface MyService {
	public Student login(Student registerAndLogin);
	public boolean updateStudent(Student student);
	public List<Student> selectStudentNo();
	public List<Student> selectStudentYes();
	public List<String> selectListMsg();
	public void insertMsg(String msg);
}
