package com.hg.xsp.services;

import java.util.List;

import com.hg.xsp.entity.Task;

public interface SelectServices {
	
	/**
	 * 获取正在进行的收集数量
	 * @return 
	 */
	public String selectSJMailById(String id);
	
	/**
	 * 获取收集截止日期
	 * @return
	 */
	public String selectEndTime(String id);
	
	

	/**
	 * 获取已过期的id
	 * @return
	 */
	public List<Task> selectSJIDOutTime();
}
