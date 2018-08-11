package com.hg.xsp.services;

import com.hg.xsp.entity.User;

public interface LoginAndRegisterServices {
	
	/**
	 * 是否存在用户
	 * @param user
	 * @return true\false
	 */
	public boolean isHaveUser(User user);

	
	/**
	 * 验证账号  如果通过则返回完整信息 否则返回空
	 * @param user
	 * @return user完整信息  or null
	 */
	public User verifyLogin(User user);
	
	
	/**
	 * 注册用户
	 * @param user
	 * @return 100成功 101已存在用户名 102系统错误
	 */
	public int register(User user);
}
