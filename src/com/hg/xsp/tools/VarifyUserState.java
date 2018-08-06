package com.hg.xsp.tools;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public class VarifyUserState {
	
	
	/**
	 * �жϵ�¼�˺ſ�����
	 * 
	 * @return
	 */
	public static int verifyUser(HttpServletRequest request, Model model) {
		Object object= request.getSession().getAttribute("user_number");
		if (object==null) {
			model.addAttribute("msg", "����ѹ��ڣ������µ�¼��");
			return 1;
		} else if (SessionListener.getSession(object.toString()) != request.getSession()) {
			model.addAttribute("msg", "�˺��������ط���½������Ǳ��˵�¼�뾡���޸����룡�����µ�¼��");
			return 1;
		}else {
			return 0;
		}
			
			
	}
}
