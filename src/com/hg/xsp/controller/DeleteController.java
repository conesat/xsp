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
import com.hg.xsp.services.DeleteServices;
import com.hg.xsp.staticvalues.StaticValues;
import com.hg.xsp.tools.FileOperation;
import com.hg.xsp.tools.XmlTool;

import net.sf.json.JSONObject;

@Controller
public class DeleteController {
	
	@Autowired
	private DeleteServices deleteServices;
	
	
	
	@RequestMapping(value = "deleteName", method = RequestMethod.POST)
	public void registerUser(HttpServletRequest request, Model model, HttpServletResponse response, String name) {
		JSONObject json = new JSONObject();
		int re = 100;
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			File file=new File(StaticValues.HOME_PATH+user.getMail()+"/namelist/"+name+".xml");
			if (file.exists()) {
				file.delete();
			}
		}else {
			re=101;
		}
		json.put("code", re);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value = "deleteShouJi", method = RequestMethod.POST)
	public void deleteShouJi(HttpServletRequest request, Model model, HttpServletResponse response, String id) {
		JSONObject json = new JSONObject();
		int re = 100;
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			File dir = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" +id);
			if (dir.exists()) {
				FileOperation.DeleteFolder(dir);
			}
			XmlTool.delNode(user.getMail(), id);
			deleteServices.deleteShouJi(id);
		}else {
			re=101;
		}
		json.put("code", re);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
