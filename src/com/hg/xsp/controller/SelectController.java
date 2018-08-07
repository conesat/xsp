package com.hg.xsp.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hg.xsp.entity.Student;

import net.sf.json.JSONObject;
import sun.applet.resources.MsgAppletViewer;

@Controller
public class SelectController {
	public static int msgint=0;
	public static String msgstring="";
	@RequestMapping(value = "setMSG", method = RequestMethod.POST)
	public void setMSG(HttpServletRequest request,HttpServletResponse response,String msg) {
		JSONObject json = new JSONObject();
		System.out.println(msg);
		if (msgint==0) {
			json.put("code", 0);
			msgstring=msg;
			msgint=1;
		} else {
			json.put("code", 1);
		}
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "selectMSG", method = RequestMethod.GET)
	public void selectMSG(HttpServletRequest request,HttpServletResponse response) {
		JSONObject json = new JSONObject();
		response.setCharacterEncoding("UTF-8");
		if (msgint==0) {
			json.put("code", 0);
		} else {
			json.put("code", 1);
			json.put("msg", msgstring);
		}
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "resetMSG", method = RequestMethod.GET)
	public void resetMSG(HttpServletRequest request,HttpServletResponse response) {
		JSONObject json = new JSONObject();
		if (msgint==0) {
			json.put("code", 0);
		} else {
			msgint=0;
			json.put("code", 1);
		}
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
