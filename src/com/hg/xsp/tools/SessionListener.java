package com.hg.xsp.tools;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * ��¼����
 * @author 
 *
 */

public class SessionListener implements HttpSessionListener,
		HttpSessionAttributeListener {

	
	// log4j
	private final static Log log = LogFactory.getLog(SessionListener.class);

	// ���浱ǰ��¼�������û�
	public static Map<String, HttpSession> loginUser = new HashMap<String, HttpSession>();

	// �������Ϊsession�е�key
	public static String SESSION_LOGIN_NAME = "user_number";

	// ִ��setAttribute��ʱ��, ��������Ա�����������Session��ʱ, �����������.
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// �����ӵ��������û���, �����map��
		if (se.getName().equals(SESSION_LOGIN_NAME)) {
			String number = (String) se.getValue();
			HttpSession session = loginUser.get(number);
			if (session != null) {
				session.removeAttribute("user");
			}
			loginUser.put(number, se.getSession());
		}

	}

	// ��ִ��removeAttributeʱ���õķ���
	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// ����Ƴ����������û���, ���map���Ƴ�
		if (se.getName().equals(SESSION_LOGIN_NAME)) {
			try {
				String  number = (String) se.getSession().getAttribute(SESSION_LOGIN_NAME);
				loginUser.remove(number);
			} catch (Exception e) {
				log.debug(e);
			}
		}
		
	}

	// ��ִ��setAttributeʱ ,�����������Ѿ�����, �������Ե�ʱ��, �����������
	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		// ����ı���������û���, ����Ÿı�map
		if (se.getName().equals(SESSION_LOGIN_NAME)) {
			String number = (String) se.getValue();
			HttpSession session = loginUser.get(number);
			if (session != null) {
				session.removeAttribute("user");
			}
			loginUser.put(number, se.getSession());
		}
	}

	// session����ʱ�����������
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		log.debug("SessionListener........session����-----"
				+ se.getSession().getId());
	}

	// SessionʧЧ���߹��ڵ�ʱ����õ��������,
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// ���session��ʱ, ���map���Ƴ�����û�
		try {
			String number = (String) se.getSession().getAttribute(SESSION_LOGIN_NAME);
			loginUser.remove(number);
		} catch (Exception e) {
			log.debug(e);
		}
	}
	
	public static HttpSession getSession(String key) {
		return loginUser.get(key);
	}

}
