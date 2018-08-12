package com.hg.xsp.dao;

import java.util.List;

import com.hg.xsp.entity.Task;

public interface SelectMapper {
	/**
	 * 获取id
	 * @return
	 */
	public String selectSJMailById(String id);
	
	/**
	 * 根据mail和ID判断是否存在收集
	 * @param task
	 * @return
	 */
	public int selectSJByMailAndID(Task task);
	
	/**
	 * 获取收集截止日期
	 * @return
	 */
	public String selectEndTime(String id);
	
	
	/**
	 * 获取已过期的id
	 * @return
	 */
	public List<Task> selectSJIDOutTime(String endTime);
}
