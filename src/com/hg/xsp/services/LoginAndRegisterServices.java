package com.hg.xsp.services;

import com.hg.xsp.entity.User;

public interface LoginAndRegisterServices {
	
	public boolean isHaveUser(User user);

	public User login(User user);
	
	public int register(User user);
}
