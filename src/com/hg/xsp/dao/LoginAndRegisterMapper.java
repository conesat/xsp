package com.hg.xsp.dao;

import com.hg.xsp.entity.User;

public interface LoginAndRegisterMapper {
	public User isHaveUser(User user);

	public User login(User user);
	
	public boolean register(User user);
}
