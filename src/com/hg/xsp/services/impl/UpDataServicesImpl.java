package com.hg.xsp.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hg.xsp.dao.UpdataMapper;
import com.hg.xsp.entity.Task;

@Service
public class UpDataServicesImpl implements com.hg.xsp.services.UpDataServices {

	@Autowired
	private UpdataMapper updataMapper;

	@Override
	public void upDataSJ(Task task) {
		updataMapper.upDataSJ(task);
	}

}
