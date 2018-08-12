package com.hg.xsp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hg.xsp.entity.Name;
import com.hg.xsp.entity.NameList;
import com.hg.xsp.entity.Plupload;
import com.hg.xsp.entity.Task;
import com.hg.xsp.entity.User;
import com.hg.xsp.services.InsertServices;
import com.hg.xsp.services.UpDataServices;
import com.hg.xsp.staticvalues.StaticValues;
import com.hg.xsp.tools.Datetool;
import com.hg.xsp.tools.FileOperation;
import com.hg.xsp.tools.PluploadUtil;
import com.hg.xsp.tools.XmlTool;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class AddController {

	@Autowired
	private InsertServices insertServices;

	@Autowired
	private UpDataServices upDataServices;

	/**
	 * 添加用户组
	 * 
	 * @param request
	 * @param userlist
	 * @param name
	 * @param response
	 * @param change
	 */
	@RequestMapping(value = "addUserList", method = RequestMethod.POST)
	public void gotomainpage(HttpServletRequest request, String userlist, String name, HttpServletResponse response,
			String change) {
		User user = (User) request.getSession().getAttribute("user");
		JSONObject json = new JSONObject();
		System.out.println(name);
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
					e.printStackTrace();
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

	/**
	 * 新建收集
	 * 
	 * @param plupload
	 * @param request
	 * @param response
	 * @param title
	 */
	@RequestMapping(value = "addShouJi", method = RequestMethod.POST)
	public void addShouJi(Plupload plupload, HttpServletRequest request, HttpServletResponse response, Task task) {
		User user = (User) request.getSession().getAttribute("user");
		JSONObject json = new JSONObject();
		int re = 100;
		if (user == null) {
			re = 101;
		} else {
			task.setMail(user.getMail());
			task.setBegin(Datetool.getTimeNowThroughDate());
			// 文件存储路径
			File dir = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + task.getId());
			if (dir.exists()) {
				re = 102;
			} else {
				File floder = new File(
						StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + task.getId() + "/doname");
				if (!floder.exists()) {
					floder.mkdirs();
					new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + task.getId()+"/files").mkdir();
				}
				try {
					MultipartHttpServletRequest test = (MultipartHttpServletRequest) request;
					plupload.setRequest(request);
					try {
						// 上传文件
						PluploadUtil.upload(plupload, new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + task.getId()+"/files"));
						// 判断文件是否上传成功（被分成块的文件是否全部上传完成）
						if (PluploadUtil.isUploadFinish(plupload)) {
							upDataServices.upDataSJ(task);
							File file = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/"
									+ task.getId() + "/doname/namelist.xml");
							XmlTool.createXml(file, "userlist");
							List<Name> names = XmlTool.getNameList(user.getMail(), task.getNameListName());
							XmlTool.addNameState(file, names);
							XmlTool.addTask(user.getMail(), task);

						} else {
							FileOperation.DeleteFolder(dir);
							re = 103;
						}
					} catch (Exception e) {
						e.printStackTrace();
						FileOperation.DeleteFolder(dir);
						re = 103;
					}
				} catch (Exception e) {
					try {
						upDataServices.upDataSJ(task);
						File file = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + task.getId()
								+ "/doname/namelist.xml");
						file.createNewFile();
						XmlTool.createXml(file, "userlist");
						List<Name> names = XmlTool.getNameList(user.getMail(), task.getNameListName());
						XmlTool.addNameState(file, names);
						XmlTool.addTask(user.getMail(), task);
					} catch (Exception e1) {
						e1.printStackTrace();
						re = 103;
					}
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
