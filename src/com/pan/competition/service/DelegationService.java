package com.pan.competition.service;

import java.util.List;

import com.pan.competition.bean.Delegation;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.DelegationDao;

public class DelegationService {
	
	private DelegationDao delegationDao = new DelegationDao();
	
	/**
	 * 添加代表团
	 * @param delegation
	 * @return
	 */
	public Message<String> addDelegation(Delegation delegation) {
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
		return message;
	}
	
	public Message<String> updateDelegation(Delegation delegation) {
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
		return message;
	}
	
	public List<Delegation> getDelegationList(String competition_id){
		List<Delegation> list = delegationDao.getDelegationList(competition_id);
		return list;
	}
	
	public List<MenuItem> getDelegationNameList(String competition_id){
		List<MenuItem> list = delegationDao.getDelegationNameList(competition_id);
		return list;
	}
	
	public String removeDelegation(String delegation_id){
		int status = delegationDao.removeDelegation(delegation_id);
		if(status == 1) {
			return "代表团删除成功";
		}else {
			return "代表团删除失败";
		}
	}
	
	public Message<Delegation> getDelegationById(String delegation_id){
		Message<Delegation> message = null;
		Delegation delegation = delegationDao.getDelegationById(delegation_id);
		if(delegation != null) {
			message = new Message<Delegation>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", delegation);
		}else {
			message = new Message<Delegation>(Constant.QUERY_FAILED_RESPONSE_CODE, "不存在该代表团", null);
		}
		return message;
	}
}
