package com.hg.xsp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hg.xsp.entity.User;
import com.hg.xsp.services.LoginAndRegisterServices;

@Controller
public class LoginAndRegisterController {
	
	@Autowired
	private LoginAndRegisterServices loginAndRegisterServices;
	
	@RequestMapping(value = "verifyLogin", method = RequestMethod.POST)
	public String verifyLogin(HttpServletRequest request, Model model,User user) {
		return "login";
	}
}
