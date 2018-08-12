package com.hg.xsp.dao;

public interface DeleteMapper {
	/**
	 * 删除id的收集
	 * @param id
	 */
	public void deleteShouJi(String id);
	
	/**
	 * 删除过期收集
	 */
	public void deleteShouJiOutTime(String endTime);
}
