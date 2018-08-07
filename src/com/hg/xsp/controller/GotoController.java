package com.hg.xsp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Null;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.hg.xsp.entity.Student;
import com.hg.xsp.entity.Task;
import com.hg.xsp.entity.User;
import com.hg.xsp.services.MyService;
import com.hg.xsp.tools.MyThread;
import com.hg.xsp.tools.XmlTool;

import net.sf.json.JSONObject;

@Controller
public class GotoController {
	@Autowired
	MyService myService;

	private MyThread myThread = null;

	@RequestMapping(value = "gotoUpload", method = RequestMethod.GET)
	public String gotomainpage(HttpServletRequest request) {
		return "upload";
	}

	@RequestMapping(value = "XLH", method = RequestMethod.GET)
	public String XLH(HttpServletRequest request, Model model) {
		List<String> list = myService.selectListMsg();
		model.addAttribute("list", list);
		return "xinlihua";
	}

	@RequestMapping(value = "gotoGame", method = RequestMethod.GET)
	public String gotoGame(HttpServletRequest request, Model model) {
		List<String> list = myService.selectListMsg();
		model.addAttribute("list", list);
		return "game";
	}

	@RequestMapping(value = "addmsg", method = RequestMethod.GET)
	public String addmsg(String msg, HttpServletRequest request, Model model) {
		myService.insertMsg(msg);
		return "redirect:XLH";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public void uploadFile(MultipartFile file, HttpServletRequest request, String path, String name, String stu_id,
			String open, HttpServletResponse response) throws IllegalStateException, IOException {
		JSONObject json = new JSONObject();
		path = "/root/�ĵ�/bgfile/tj/";
		String fname = "���154��" + stu_id + name + "."
				+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
		if (!file.isEmpty()) {
			// �ļ�����·��
			String filePath = path + fname;
			// ת���ļ�
			file.transferTo(new File(filePath));
			Student student = new Student();
			student.setName(name);
			student.setOpen(open);
			student.setStu_id(stu_id);
			student.setUrl(fname);
			if (myService.updateStudent(student)) {
				json.put("code", 0);
			} else {
				json.put("code", 1);
			}

		} else {
			json.put("code", 1);
		}
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "downLoad", method = RequestMethod.GET)
	public void downLoad(String url, HttpServletResponse response, boolean isOnLine) throws Exception {
		File f = new File("/root/�ĵ�/bgfile/tj/" + url);
		// ���ر����ļ�
		String fileName = f.getName(); // �ļ���Ĭ�ϱ�����
		// ��������
		InputStream inStream = new FileInputStream(f);// �ļ��Ĵ��·��
		// ��������ĸ�ʽ
		response.reset();
		response.setContentType("bin");
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
		// ѭ��ȡ�����е�����
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

	@RequestMapping(value = "downLoadZIP", method = RequestMethod.GET)
	public void downLoadZIP(HttpServletResponse response, boolean isOnLine) throws Exception {
		File f = new File("/root/�ĵ�/bgfile/tj.zip");
		// ���ر����ļ�
		String fileName = f.getName(); // �ļ���Ĭ�ϱ�����
		// ��������
		InputStream inStream = new FileInputStream(f);// �ļ��Ĵ��·��
		// ��������ĸ�ʽ
		response.reset();
		response.setContentType("bin");
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
		// ѭ��ȡ�����е�����
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

	@RequestMapping(value = "downLoadwd", method = RequestMethod.GET)
	public void downLoadwd(String type, HttpServletResponse response, boolean isOnLine) throws Exception {
		File f = new File("/root/�ĵ�/bgfile/" + type + ".doc");
		// ���ر����ļ�
		String fileName = f.getName(); // �ļ���Ĭ�ϱ�����
		// ��������
		InputStream inStream = new FileInputStream(f);// �ļ��Ĵ��·��
		// ��������ĸ�ʽ
		response.reset();
		response.setContentType("bin");
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
		// ѭ��ȡ�����е�����
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

	/**
	 * 新
	 */
	@RequestMapping(value = "gotoLogin", method = RequestMethod.GET)
	public String gotoLogin(HttpServletRequest request, Model model) {
		return "login";
	}

	@RequestMapping(value = "gotoIndex", method = RequestMethod.GET)
	public String gotoIndex(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			model.addAttribute("user", user);
		}
		model.addAttribute("msg", "");
		return "index";
	}

	@RequestMapping(value = "gotoShouji", method = RequestMethod.GET)
	public String gotoShouji(HttpServletRequest request, Model model) {
		User user=(User)request.getSession().getAttribute("user");
		if (user!=null) {
			List<Task> list=new ArrayList<>();
			list=XmlTool.getTasks(user.getMail());
			model.addAttribute("msg", "");
			model.addAttribute("tasks", list);
			System.out.println(list.toString());
			return "shouji";
		}else {
			model.addAttribute("msg", "请先登录!");
			return "index";
		}
	}

	@RequestMapping(value = "gotoXinjianshouji", method = RequestMethod.GET)
	public String gotoXinjianshouji(HttpServletRequest request, Model model) {
		return "xinjianshouji";
	}

	@RequestMapping(value = "gotoShoujiye", method = RequestMethod.GET)
	public String gotoShoujiye(HttpServletRequest request, Model model) {
		return "shoujiye";
	}

	@RequestMapping(value = "gotoGuanliuser", method = RequestMethod.GET)
	public String gotoGuanliuser(HttpServletRequest request, Model model) {
		return "guanliuser";
	}

	@RequestMapping(value = "gotoShoujixiangxi", method = RequestMethod.GET)
	public String gotoShoujixiangxi(HttpServletRequest request, Model model) {
		return "shoujixiangxi";
	}

	@RequestMapping(value = "gotoXinjianusers", method = RequestMethod.GET)
	public String gotoXinjianusers(HttpServletRequest request, Model model) {
		return "xinjianusers";
	}


}
