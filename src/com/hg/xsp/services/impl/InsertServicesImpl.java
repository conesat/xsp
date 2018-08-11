package com.hg.xsp.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hg.xsp.dao.InsertMapper;
import com.hg.xsp.entity.Task;
import com.hg.xsp.services.InsertServices;


@Service
public class InsertServicesImpl implements InsertServices{

	
	@Autowired
	private InsertMapper insertMapper;
	
	@Override
	public boolean addShouJi(Task task) {
		try {
			insertMapper.addShouJi(task);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

}
