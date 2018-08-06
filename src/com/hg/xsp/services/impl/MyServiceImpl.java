package com.hg.xsp.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hg.xsp.dao.LoginAndOutMapper;
import com.hg.xsp.dao.SelectMapper;
import com.hg.xsp.dao.UpdateMapper;
import com.hg.xsp.entity.Student;
import com.hg.xsp.services.MyService;

@Service
public class MyServiceImpl implements MyService{
	
	@Autowired
	LoginAndOutMapper loginAndOutMapper;
	
	@Autowired
	UpdateMapper updateMapper;
	
	@Autowired
	SelectMapper selectMapper;

	@Override
	public Student login(Student registerAndLogin) {
		Student registerAndLogin2=null;
		try {
			registerAndLogin2=loginAndOutMapper.login(registerAndLogin);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return registerAndLogin2;
	}

	@Override
	public boolean updateStudent(Student student) {
		try {
			updateMapper.updateStudent(student);
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	@Override
	public List<Student> selectStudentNo() {
		List<Student> list=null;
		list=selectMapper.selectListNo();
		return list;
	}

	@Override
	public List<Student> selectStudentYes() {
		List<Student> list=null;
		list=selectMapper.selectListYes();
		return list;
	}

	@Override
	public List<String> selectListMsg() {
		List<String> list=null;
		list=selectMapper.selectListMsg();
		return list;
	}

	@Override
	public void insertMsg(String msg) {
		updateMapper.insertMsg(msg);
	}


}
