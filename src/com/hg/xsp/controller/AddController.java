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
import com.hg.xsp.entity.NameList;
import com.hg.xsp.entity.User;
import com.hg.xsp.tools.XmlTool;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class AddController {
	@RequestMapping(value = "addUserList", method = RequestMethod.POST)
	public void gotomainpage(HttpServletRequest request, String userlist, String name, HttpServletResponse response,
			String change) {
		User user = (User) request.getSession().getAttribute("user");
		JSONObject json = new JSONObject();
		int re = 100;
		if (user == null) {
			re = 102;
		} else {
			File file1 = new File("D:\\xsp\\user\\" + user.getMail() + "\\namelist\\" + change + ".xml");
			if (change != null && file1.exists()) {
				file1.delete();
			}
			File file = new File("D:\\xsp\\user\\" + user.getMail() + "\\namelist\\" + name + ".xml");
			if (file.exists()) {
				re = 103;
			} else {
				try {
					XmlTool.taskXmlCreate(file, "userlist");
					List<Name> names = new ArrayList<>();
					JSONArray jsonArray = JSONArray.fromObject(userlist);
					for (int i = 0; i < jsonArray.size(); i++) {
						Name n = new Name();
						n.setId(jsonArray.getJSONObject(i).get("id").toString());
						n.setName(jsonArray.getJSONObject(i).get("name").toString());
						names.add(n);
					}
					NameList nameList = new NameList(names, name);
					XmlTool.addName(user.getMail(), name, nameList);
				} catch (Exception e) {
					file.delete();
					re = 101;
				}
			}
		}
		json.put("code", re);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
