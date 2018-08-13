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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.hg.xsp.entity.FJFile;
import com.hg.xsp.entity.Name;
import com.hg.xsp.entity.Task;
import com.hg.xsp.entity.User;
import com.hg.xsp.services.InsertServices;
import com.hg.xsp.services.SelectServices;
import com.hg.xsp.staticvalues.StaticValues;
import com.hg.xsp.tools.Datetool;
import com.hg.xsp.tools.MyThread;
import com.hg.xsp.tools.XmlTool;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class GotoController {

	@Autowired
	private SelectServices selectServices;

	@Autowired
	private InsertServices insertServices;

	private MyThread myThread = null;

	@RequestMapping(value = "gotoUpload", method = RequestMethod.GET)
	public String gotomainpage(HttpServletRequest request) {
		return "upload";
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

	

	/**
	 * 新
	 */
	@RequestMapping(value = "gotoLogin", method = RequestMethod.GET)
	public String gotoLogin(HttpServletRequest request, Model model) {
		request.getSession().removeAttribute("user");
		return "login";
	}

	
	
	
	@RequestMapping(value = "gotoAbout", method = RequestMethod.GET)
	public String gotoAbout(HttpServletRequest request, Model model) {
		return "about";
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
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			List<Task> list = new ArrayList<>();
			list = XmlTool.getTasks(user.getMail());
			model.addAttribute("msg", "");
			model.addAttribute("tasks", list);
			return "shouji";
		} else {
			model.addAttribute("msg", "请先登录!");
			return "index";
		}
	}

	@RequestMapping(value = "gotoXinjianshouji", method = RequestMethod.GET)
	public String gotoXinjianshouji(HttpServletRequest request, Model model) {

		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			Task task = new Task();
			task.setEnd(Datetool.getTimeNowThroughDate());
			task.setMail(user.getMail());
			insertServices.addShouJi(task);
			File dowork = new File(StaticValues.HOME_PATH + user.getMail() + "/task/dowork");
			if (!dowork.exists()) {
				dowork.mkdirs();
			}
			List<String> names = new ArrayList<>();
			File file = new File(StaticValues.HOME_PATH + user.getMail() + "/namelist"); // 获取其file对象
			if (!file.exists()) {
				file.mkdirs();
			}
			File[] fs = file.listFiles(); // 遍历path下的文件和目录，放在File数组中
			for (File f : fs) { // 遍历File[]数组
				names.add(f.getName().split("\\.")[0]);
			}
			model.addAttribute("names", names);
			model.addAttribute("ID", task.getId());
			return "xinjianshouji";
		} else {
			model.addAttribute("msg", "请先登录!");
			return "index";
		}
	}

	@RequestMapping(value = "gotoShoujiye", method = RequestMethod.GET)
	public String gotoShoujiye(HttpServletRequest request, Model model, String id) {
		String mail = selectServices.selectSJMailById(id);
		if (mail == null) {
			model.addAttribute("msg", id + " 收集号不存在");
		} else {
			File file=new File(StaticValues.HOME_PATH+mail+"/task/dowork/"+id+"/files");
			if (file.exists()) {
				File[] files=file.listFiles();
				List<FJFile> fList=new ArrayList<>();
				for (int j = 0; j < files.length; j++) {
					fList.add(new FJFile(files[j].getName(), files[j].getAbsolutePath()));
				}
				model.addAttribute("files", fList);
			}
			Task task = XmlTool.getTaskById(mail, id);
			if (task == null) {
				model.addAttribute("msg", id + " 数据异常");
			} else {
				model.addAttribute("task", task);
				return "shoujiye";
			}
		}

		return "index";
	}

	@RequestMapping(value = "gotoGuanliuser", method = RequestMethod.GET)
	public String gotoGuanliuser(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "请先登录!");
			return "login";
		} else {
			model.addAttribute("msg", "");
			List<String> names = new ArrayList<>();
			File file = new File(StaticValues.HOME_PATH + user.getMail() + "/namelist"); // 获取其file对象
			if (!file.exists()) {
				file.mkdirs();
			}
			File[] fs = file.listFiles(); // 遍历path下的文件和目录，放在File数组中
			for (File f : fs) { // 遍历File[]数组
				names.add(f.getName().split("\\.")[0]);
			}
			model.addAttribute("names", names);
			return "guanliuser";
		}
	}

	@RequestMapping(value = "gotoShoujixiangxi", method = RequestMethod.GET)
	public String gotoShoujixiangxi(HttpServletRequest request, Model model, String id, String state) {
		User user = (User) request.getSession().getAttribute("user");
		String endTime = null;
		if (user != null) {
			try {
				endTime = selectServices.selectEndTime(id);
			} catch (Exception e) {
				model.addAttribute("msg", "数据异常!");
				return "index";
			}
			if (endTime == null) {
				model.addAttribute("msg", "该收集已过期!");
				return "index";
			} else {
				List<Name> names = XmlTool.getNameStateList(new File(
						StaticValues.HOME_PATH + user.getMail() + "/task/dowork/" + id + "/doname/namelist.xml"));
				JSONArray jsonArray = JSONArray.fromObject(names);
				model.addAttribute("id", id);
				model.addAttribute("names", jsonArray);
				model.addAttribute("endTime", endTime);
				model.addAttribute("state", state);
				return "shoujixiangxi";
			}
		} else {
			model.addAttribute("msg", "请先登录!");
			return "index";
		}
	}

	@RequestMapping(value = "gotoXinjianusers", method = RequestMethod.GET)
	public String gotoXinjianusers(HttpServletRequest request, Model model, String name) {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			if (name != null) {
				List<Name> names = XmlTool.getNameList(user.getMail(), name);
				JSONArray jsonArray = JSONArray.fromObject(names);
				model.addAttribute("name", name);
				model.addAttribute("names", jsonArray);
			}
			return "xinjianusers";
		} else {
			model.addAttribute("msg", "请先登录!");
			return "index";
		}
	}
}
