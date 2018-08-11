package com.hg.xsp.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hg.xsp.dao.DeleteMapper;
import com.hg.xsp.services.DeleteServices;

@Service
public class DeleteServicesImpl implements DeleteServices {

	@Autowired
	private DeleteMapper deleteMapper;

	@Override
	public boolean deleteShouJi(String id) {
		try {
			deleteMapper.deleteShouJi(id);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

}
