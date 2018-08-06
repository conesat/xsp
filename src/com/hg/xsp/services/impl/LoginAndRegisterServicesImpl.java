package com.hg.xsp.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hg.xsp.dao.LoginAndOutMapper;
import com.hg.xsp.dao.LoginAndRegisterMapper;
import com.hg.xsp.entity.User;
import com.hg.xsp.services.LoginAndRegisterServices;

@Service
public class LoginAndRegisterServicesImpl implements LoginAndRegisterServices{

	@Autowired
	private LoginAndRegisterMapper loginAndRegisterMapper;
	
	@Override
	public boolean isHaveUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int register(User user) {
		int re=100;
		if (loginAndRegisterMapper.isHaveUser(user)) {
			re=101;
		}else{
			try {
				loginAndRegisterMapper.register(user);
			} catch (Exception e) {
				re=102;
			}
		}
		return re;
	}

}
