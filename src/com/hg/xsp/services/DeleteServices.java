package com.hg.xsp.services;

public interface DeleteServices {
	
	/**
	 * 删除 id 记录
	 * @param id
	 */
	public boolean deleteShouJi(String id);
	
	/**
	 * 删除过期收集
	 */
	public void deleteShouJiOutTime(String endTime);
}