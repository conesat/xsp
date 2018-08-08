package com.hg.xsp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hg.xsp.entity.Name;

@Controller
public class AddController {
	@RequestMapping(value = "addUserList", method = RequestMethod.POST)
	public void gotomainpage(HttpServletRequest request,String userlist,String name) {
		System.out.println(userlist+"NAME:"+name);
	}
}
