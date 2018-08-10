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
import com.hg.xsp.entity.Plupload;
import com.hg.xsp.entity.User;
import com.hg.xsp.staticvalues.StaticValues;
import com.hg.xsp.tools.PluploadUtil;
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
			File file1 = new File(StaticValues.HOME_PATH + user.getMail() + "/namelist/" + change + ".xml");
			if (change != null && file1.exists()) {
				file1.delete();
			}
			File file = new File(StaticValues.HOME_PATH + user.getMail() + "/namelist/" + name + ".xml");
			if (file.exists()) {
				re = 103;
			} else {
				try {
					XmlTool.createXml(file, "userlist");
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
	
	
	/**上传处理方法*/
	@RequestMapping(value="addShouJi", method = RequestMethod.POST)
	public void addShouJi(Plupload plupload,HttpServletRequest request, HttpServletResponse response,String title) {
		User user = (User) request.getSession().getAttribute("user");
		JSONObject json = new JSONObject();
		System.out.println(title);
		int re = 100;
		if (user == null) {
			re = 102;
		} else {
			plupload.setRequest(request);
			//文件存储路径
			File dir = new File(StaticValues.HOME_PATH+user.getMail()+"/task/dowork/"+title);
			System.out.println(dir);
			//System.out.println(dir.getPath());
			try {
				//上传文件
				PluploadUtil.upload(plupload, dir);
				//判断文件是否上传成功（被分成块的文件是否全部上传完成）
				if (PluploadUtil.isUploadFinish(plupload)) {
				}
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
