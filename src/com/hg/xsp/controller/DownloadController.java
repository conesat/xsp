package com.hg.xsp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hg.xsp.entity.Task;
import com.hg.xsp.entity.User;
import com.hg.xsp.staticvalues.StaticValues;
import com.hg.xsp.tools.CompactAlgorithm;
import com.hg.xsp.tools.FileOperation;
import com.hg.xsp.tools.XmlTool;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class DownloadController {
	@RequestMapping(value = "downLoadFile", method = RequestMethod.GET)
	public void downLoadFile(String file, HttpServletResponse response) throws Exception {
		File f = new File(file);
		String fileName = f.getName();
		InputStream inStream = new FileInputStream(f);
		response.reset();
		response.setContentType("bin");
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
		byte[] b = new byte[100];
		int len;
		try {
			while ((len = inStream.read(b)) > 0)
				response.getOutputStream().write(b, 0, len);
			inStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "downLoadUserFile", method = RequestMethod.GET)
	public String downLoadUserFile(String filename, String id, HttpServletResponse response, HttpServletRequest request,
			Model model) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "请先登录!");
			return "index";
		}
		File f = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/upload/" + filename);
		String fileName = f.getName();
		InputStream inStream = new FileInputStream(f);
		response.reset();
		response.setContentType("bin");
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
		byte[] b = new byte[100];
		int len;
		try {
			while ((len = inStream.read(b)) > 0)
				response.getOutputStream().write(b, 0, len);
			inStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "setSJPack", method = RequestMethod.POST)
	public void setSJPack(String id, HttpServletResponse response, HttpServletRequest request, Model model, String lin,
			String namespace) {
		User user = (User) request.getSession().getAttribute("user");
		JSONObject jsonObject = new JSONObject();
		int re = 100;
		if (user == null) {
			re = 101;
		} else {
			File file = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/uploadcopy");
			if (file.exists()) {
				FileOperation.DeleteFolder(file);
			}
			file = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/zip");
			if (file.exists()) {
				FileOperation.DeleteFolder(file);
			}
			file.mkdirs();
			try {
				FileOperation.copyDirByNameSpace(
						StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/upload",
						StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/uploadcopy",
						JSONArray.fromObject(namespace), lin);
				new CompactAlgorithm(new File(
						StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/zip", id + ".zip"))
								.zipFiles(new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id
										+ "/files/uploadcopy"));
				if (!new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/zip").exists()) {
					re = 102;
				} else {
					file = new File(
							StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/uploadcopy");
					if (file.exists()) {
						FileOperation.DeleteFolder(file);
					}
				}
			} catch (Exception e) {
				file = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/uploadcopy");
				if (file.exists()) {
					FileOperation.DeleteFolder(file);
				}
				re = 103;
				jsonObject.put("code", re);
				try {
					response.getWriter().println(jsonObject);
				} catch (Exception e1) {

				}
			}
		}
		jsonObject.put("code", re);
		try {
			response.getWriter().println(jsonObject);
		} catch (Exception e) {

		}
	}

	@RequestMapping(value = "downLoadSJPackge", method = RequestMethod.GET)
	public String downLoadSJPackge(String id, HttpServletResponse response, HttpServletRequest request, Model model)
			throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "请先登录!");
			return "index";
		}
		File f = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/files/zip/" + id + ".zip");
		InputStream inStream = new FileInputStream(f);
		Task task = XmlTool.getTaskById(user.getMail(), id);
		response.reset();
		response.setContentType("bin");
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(task.getTitle()+"."+f.getName().split("\\.")[1], "UTF-8"));
		byte[] b = new byte[100];
		int len;
		try {
			while ((len = inStream.read(b)) > 0)
				response.getOutputStream().write(b, 0, len);
			inStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
