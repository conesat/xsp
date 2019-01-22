package com.hg.xsp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hg.xsp.entity.Name;
import com.hg.xsp.entity.User;
import com.hg.xsp.staticvalues.StaticValues;
import com.hg.xsp.tools.XmlTool;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class SelectController {

	@RequestMapping(value = "seleteUserList", method = RequestMethod.POST)
	public void seleteUserList(HttpServletRequest request, HttpServletResponse response, String msg) {
		User user = (User) request.getSession().getAttribute("user");
		JSONObject json = new JSONObject();
		response.setCharacterEncoding("UTF-8");
		int re = 100;
		if (user == null) {
			re = 101;
		} else {
			List<String> names = new ArrayList<>();
			File file = new File(StaticValues.HOME_PATH + user.getMail() + "/namelist"); // 获取其file对象
			if (!file.exists()) {
				file.mkdirs();
			}
			File[] fs = file.listFiles(); // 遍历path下的文件和目录，放在File数组中
			for (File f : fs) { // 遍历File[]数组
				names.add(f.getName().split("\\.")[0]);
			}
			
			json.put("names", names);
		}
		json.put("code", re);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "seleteNamesByListName", method = RequestMethod.POST)
	public void seleteNamesByListName(HttpServletRequest request, HttpServletResponse response, String name) {
		User user = (User) request.getSession().getAttribute("user");
		JSONObject json = new JSONObject();
		response.setCharacterEncoding("UTF-8");
		int re = 100;
		if (user == null) {
			re = 101;
		} else {
			List<Name> names = XmlTool.getNameList(user.getMail(), name);
			JSONArray jsonArray = JSONArray.fromObject(names);
			json.put("names", jsonArray);
		}
		json.put("code", re);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}
