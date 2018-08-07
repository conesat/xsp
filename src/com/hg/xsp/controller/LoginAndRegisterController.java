package com.hg.xsp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hg.xsp.entity.User;
import com.hg.xsp.services.LoginAndRegisterServices;
import com.hg.xsp.tools.SendMail;

import net.sf.json.JSONObject;

@Controller
public class LoginAndRegisterController {

	@Autowired
	private LoginAndRegisterServices loginAndRegisterServices;

	@RequestMapping(value = "verifyLogin", method = RequestMethod.POST)
	public String verifyLogin(HttpServletRequest request, Model model, User user) {
		return "login";
	}

	@RequestMapping(value = "registerUser", method = RequestMethod.POST)
	public void registerUser(HttpServletRequest request, Model model, User user, HttpServletResponse response,
			String code) {
		JSONObject json = new JSONObject();
		System.out.println(user.toString()+"  code:"+code);
		int re = 100;
		if (request.getSession().getAttribute("code").equals(code)) {
			re = loginAndRegisterServices.register(user);
		} else {
			re = 200;
		}
		json.put("code", re);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "getCode", method = RequestMethod.POST)
	public void getCode(HttpServletRequest request, Model model, User user, HttpServletResponse response, String mail) {
		JSONObject json = new JSONObject();
		String code = "";
		for (int i = 0; i < 4; i++) {
			code += Integer.toString((int) (Math.random() * 10));
		}
		System.out.println("code：" + code + " email:" + mail);
		try {
			SendMail.sendMail(mail, "您使用此邮箱注册学生派，验证码为" + code + "  如非本人操作，请忽略此邮件");
			request.getSession().setAttribute("code", code);
			File file = new File("D:\\xsp\\user\\"+mail);
			file.mkdirs();
			json.put("code", 100);
		} catch (Exception e1) {
			e1.printStackTrace();
			json.put("code", 101);
		}
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
