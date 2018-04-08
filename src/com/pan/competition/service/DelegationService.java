package com.pan.competition.service;

import com.pan.competition.bean.Delegation;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.DelegationDao;

import net.sf.json.JSONObject;

public class DelegationService {
	
	private DelegationDao delegationDao = new DelegationDao();
	
	/**
	 * 添加代表团
	 * @param delegation
	 * @return
	 */
	public String addDelegation(Delegation delegation) {
		Message<String> message = null;
		boolean isExist = delegationDao.isExistDelegationName(delegation.getName(),delegation.getCompetition_id());
		if(isExist) {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, Constant.DELEGATION_NAME_IS_EXISTED, "");
		}else {
			int status = delegationDao.addDelegation(delegation);
			if(status == 1) {
				message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "代表团添加成功", "");
			}else {
				message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "代表团添加失败", "");
			}
		}
		return JSONObject.fromObject(message).toString();
	}
	
	public String updateDelegation(Delegation delegation) {
		Message<String> message = null;
		boolean isExist = delegationDao.isExistDelegationName(delegation.getName(), delegation.getId(),delegation.getCompetition_id());
		if(isExist) {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, Constant.DELEGATION_NAME_IS_EXISTED, "");
		}else {
			int status = delegationDao.updateDelegation(delegation);
			if(status ==1)
				message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "修改代表团成功", "");
			else
				message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "修改代表团失败", "");
		}
		return JSONObject.fromObject(message).toString();
	}
}
