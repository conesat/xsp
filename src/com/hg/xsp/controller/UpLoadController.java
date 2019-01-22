package com.hg.xsp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hg.xsp.entity.Name;
import com.hg.xsp.entity.Plupload;
import com.hg.xsp.entity.Task;
import com.hg.xsp.entity.User;
import com.hg.xsp.staticvalues.StaticValues;
import com.hg.xsp.tools.Datetool;
import com.hg.xsp.tools.FileOperation;
import com.hg.xsp.tools.PluploadUtil;
import com.hg.xsp.tools.SendMail;
import com.hg.xsp.tools.XmlTool;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class UpLoadController {

	@RequestMapping(value = "submitSJ", method = RequestMethod.POST)
	public void submitSJ(Plupload plupload, HttpServletRequest request, HttpServletResponse response, String mail,
			String id, String username, String userid) {
		JSONObject json = new JSONObject();
		int re = 100;
		File dir=null;
		try {
			mail = new String(mail.getBytes("ISO8859-1"), "UTF-8");
			id = new String(id.getBytes("ISO8859-1"), "UTF-8");
			username = new String(username.getBytes("ISO8859-1"), "UTF-8");
			userid = new String(userid.getBytes("ISO8859-1"), "UTF-8");
			plupload.setName(username + "-" + userid + "." + plupload.getName().split("\\.")[1]);
			if (XmlTool.changeLoadState(mail, id, userid, username, plupload.getName(),"已提交")) {
				// 文件存储路径
				dir = new File(StaticValues.HOME_PATH + mail + "/task/dowork/" + id + "/files/upload");
			//	System.out.println(id+" "+mail+dir.exists());
				if (!dir.exists()) {
					dir.mkdirs();
				}
				plupload.setRequest(request);
				// 上传文件
				PluploadUtil.upload(plupload, dir);
				// 判断文件是否上传成功（被分成块的文件是否全部上传完成）
				if (PluploadUtil.isUploadFinish(plupload)) {
					// upDataServices.upDataSJ(task);
					File file = new File(StaticValues.HOME_PATH + mail + "/task/dowork/" + id + "/doname/namelist.xml");
				} else {
					
				}
			} else {
				re = 101;
			}
		} catch (Exception e) {
			e.printStackTrace();
			FileOperation.DeleteFolder(dir);
			re = 103;
		}

		json.put("code", re);
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		List<Name> names = XmlTool.getNameStateList(new File(
				StaticValues.HOME_PATH + mail + "/task/dowork/" + id + "/doname/namelist.xml"));
		int i=0;
		for (i = 0; i < names.size(); i++) {
			if (names.get(i).getState().equals("未提交")) {
				break;
			}
		}
		if (i==names.size()) {
			XmlTool.changeStackState(mail, id, "收集完成");
			try {	
				SendMail.sendMail(mail, "您创建的收集-任务号:" + id + "的收集已完成,请及时下载 www.chinahg.top/xsp/gotoDownloadPack?id="+id+"&state=收集完成");
			} catch (Exception e) {
				
			}
		
		}

	}
}
