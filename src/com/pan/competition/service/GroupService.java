package com.pan.competition.service;


import java.util.List;

import com.pan.competition.bean.Group;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.GroupDao;

public class GroupService {
	
	private GroupDao groupDao = new GroupDao();
	
	public Message<String> addGroup(Group group){
		Message<String> message = null;
		boolean isExist = groupDao.isExist(group.getStage_id(), group.getGroup_num());
		if(!isExist) {
			int status = groupDao.addGroup(group);
			if(status == 1) {
				message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "分组添加成功", "");
			}else {
				message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "分组添加失败", "");
			}
		}else {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "分组号已存在", "");
		}
		return message;
	}
	
	public List<Group> getGroupList(String stage_id) {
		List<Group> list = groupDao.getGroupList(stage_id);
		return list;
	}
	
	public boolean removeGroup(String stage_id) {
		int status = groupDao.removeGroup(stage_id);
		if(status != 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public List<MenuItem> getGroupNumList(String stage_id){
		return groupDao.getGroupNumList(stage_id);
	}
}
