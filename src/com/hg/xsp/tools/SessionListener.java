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
 * 登录监听
 * @author 
 *
 */

public class SessionListener implements HttpSessionListener,
		HttpSessionAttributeListener {

	
	// log4j
	private final static Log log = LogFactory.getLog(SessionListener.class);

	// 保存当前登录的所有用户
	public static Map<String, HttpSession> loginUser = new HashMap<String, HttpSession>();

	// 用这个作为session中的key
	public static String SESSION_LOGIN_NAME = "user_number";

	// 执行setAttribute的时候, 当这个属性本来不存在于Session中时, 调用这个方法.
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// 如果添加的属性是用户名, 则加入map中
		if (se.getName().equals(SESSION_LOGIN_NAME)) {
			String number = (String) se.getValue();
			HttpSession session = loginUser.get(number);
			if (session != null) {
				session.removeAttribute("user");
			}
			loginUser.put(number, se.getSession());
		}

	}

	// 当执行removeAttribute时调用的方法
	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// 如果移除的属性是用户名, 则从map中移除
		if (se.getName().equals(SESSION_LOGIN_NAME)) {
			try {
				String  number = (String) se.getSession().getAttribute(SESSION_LOGIN_NAME);
				loginUser.remove(number);
			} catch (Exception e) {
				log.debug(e);
			}
		}
		
	}

	// 当执行setAttribute时 ,如果这个属性已经存在, 覆盖属性的时候, 调用这个方法
	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		// 如果改变的属性是用户名, 则跟着改变map
		if (se.getName().equals(SESSION_LOGIN_NAME)) {
			String number = (String) se.getValue();
			HttpSession session = loginUser.get(number);
			if (session != null) {
				session.removeAttribute("user");
			}
			loginUser.put(number, se.getSession());
		}
	}

	// session创建时调用这个方法
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		log.debug("SessionListener........session创建-----"
				+ se.getSession().getId());
	}

	// Session失效或者过期的时候调用的这个方法,
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// 如果session超时, 则从map中移除这个用户
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
