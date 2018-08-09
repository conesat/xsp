package com.hg.xsp.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hg.xsp.dao.SelectMapper;
import com.hg.xsp.services.SelectServices;

@Service
public class SelectServicesImpl implements SelectServices{

	@Autowired
	private SelectMapper selectMapper;
	
	@Override
	public int selectSJID() {
		return selectMapper.selectSJID();
	}

}
