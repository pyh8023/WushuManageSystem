package com.pan.competition.service;

import java.util.List;

import com.pan.competition.bean.Apply;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.ApplyDao;

public class ApplyService {

	private ApplyDao applyDao = new ApplyDao();
	
	public List<Apply> getApplyList(String event_id){
		List<Apply> list = applyDao.getApplyList(event_id);
		return list;
	}
	
	public String addApply(Apply apply) {
		int status = applyDao.addApply(apply);
		if(status == 1) {
			return Constant.QUERY_SUCCESS_RESPONSE_CODE;
		}else {
			return Constant.QUERY_FAILED_RESPONSE_CODE;
		}
	}
}
