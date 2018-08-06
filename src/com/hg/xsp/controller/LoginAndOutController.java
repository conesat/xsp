package com.hg.xsp.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hg.xsp.entity.Student;
import com.hg.xsp.services.MyService;

import net.sf.json.JSONObject;

@Controller
public class LoginAndOutController {

	@Autowired
	MyService myService;

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public void login(HttpServletRequest request, Student student, Model model,HttpServletResponse response,String type) {
		Student student2;
		int code=100;
		student2 = myService.login(student);
		if (student2 == null) {
			code=101;
		}
		JSONObject json = new JSONObject();
		if (type.compareTo("getdoc")==0) {
			json.put("url",student2.getUrl());
		}
		json.put("code",code);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
