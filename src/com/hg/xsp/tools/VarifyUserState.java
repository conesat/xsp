package com.hg.xsp.tools;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public class VarifyUserState {
	
	
	/**
	 * 判断登录账号可用性
	 * 
	 * @return
	 */
	public static int verifyUser(HttpServletRequest request, Model model) {
		Object object= request.getSession().getAttribute("user_number");
		if (object==null) {
			model.addAttribute("msg", "身份已过期，请重新登录！");
			return 1;
		} else if (SessionListener.getSession(object.toString()) != request.getSession()) {
			model.addAttribute("msg", "账号在其他地方登陆！，如非本人登录请尽快修改密码！请重新登录！");
			return 1;
		}else {
			return 0;
		}
			
			
	}
}
