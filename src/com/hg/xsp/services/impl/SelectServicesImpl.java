package com.hg.xsp.services.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hg.xsp.dao.SelectMapper;
import com.hg.xsp.entity.Task;
import com.hg.xsp.services.DeleteServices;
import com.hg.xsp.services.SelectServices;
import com.hg.xsp.staticvalues.StaticValues;
import com.hg.xsp.tools.Datetool;
import com.hg.xsp.tools.FileOperation;
import com.hg.xsp.tools.XmlTool;

@Service
public class SelectServicesImpl implements SelectServices {

	@Autowired
	private SelectMapper selectMapper;

	@Autowired
	private DeleteServices deleteServices;

	@Override
	public String selectSJMailById(String id) {
		return selectMapper.selectSJMailById(id);
	}

	@Override
	public String selectEndTime(String id) {
		String endTime = selectMapper.selectEndTime(id);
		int time = Datetool.getTimeBetweenDate(endTime);
		selectSJIDOutTime();
		if (time > StaticValues.OUT_DAYS) {
			return null;
		}
		return endTime;
	}

	/**
	 * 获取超时记录 并删除文件和记录
	 */
	@Override
	public List<Task> selectSJIDOutTime() {
		try {
			List<Task> list=selectMapper.selectSJIDOutTime(Datetool.dateToString(Datetool.dateAdd(new Date(), -3)));
			for (int i = 0; i < list.size(); i++) {
				File dir = new File(StaticValues.HOME_PATH + list.get(i).getMail() + "/task/dowork/" + list.get(i).getId());
				if (dir.exists()) {
					FileOperation.DeleteFolder(dir);
				}
				XmlTool.delNode(list.get(i).getMail(), list.get(i).getId());
				deleteServices.deleteShouJi(list.get(i).getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
