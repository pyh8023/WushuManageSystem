package com.pan.competition.service;

import java.util.List;

import com.pan.competition.bean.Athlet;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.AthletDao;

public class AthletService {

	AthletDao athletDao = new AthletDao();
	
	public List<Athlet> getAthletList(String delegation_id){
		List<Athlet> list = athletDao.getAthletList(delegation_id);
		return list;
	}
	
	public Message<String> addAthlet(Athlet athlet){
		Message<String> message = null;
		int status = athletDao.addAthlet(athlet);
		//boolean isExisted = athletDao.isExistAthletName(athlet.getName(), athlet.getDelegation_id());
		if(status == 1) {
			message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "添加运动员成功", "");
		}else {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "添加运动员失败", "");
		}
		return message;
	}
	
	public Message<String> updateAthlet(Athlet athlet){
		Message<String> message = null;
		int status = athletDao.updateAthlet(athlet);
		if(status == 1) {
			message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "修改运动员信息成功", "");
		}else {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "修改运动员信息失败", "");
		}
		return message;
	}
	
	public String removeAthlet(String athlet_id){
		int status = athletDao.removeAthlet(athlet_id);
		if(status == 1) {
			return "删除运动员成功";
		}else {
			return "删除运动员失败";
		}
	}
	
	public Athlet getAthletById(String athlet_id) {
		Athlet athlet = athletDao.getAthletById(athlet_id);
		return athlet;
	}
}
