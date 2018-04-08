package com.pan.competition.service;

import java.util.List;

import com.google.gson.Gson;
import com.pan.competition.bean.Competition;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.CompetitionDao;

import net.sf.json.JSONObject;

public class CompetitionService {
	
	private CompetitionDao competitionDao = new CompetitionDao();
	
	public String addCompetition(Competition competition){
		Message<String> message;
		boolean isExist = competitionDao.isExistCompetitionName(competition.getName()); //是否存在该赛事名称
		if(isExist) {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, Constant.COMPETITION_NAME_IS_EXISTED, "");
		}else {
			int status = competitionDao.addCompetition(competition);
			if(status == 1){
				message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "添加赛事成功", "");
			}else{
				message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "添加赛事失败", "");
			}
		}
		return JSONObject.fromObject(message).toString();
	}
	
	public String getCompetitionList() {
		List<Competition> list = competitionDao.getCompetitionList();
		Gson gson = new Gson();
		Message<List<Competition>> message = new Message<List<Competition>>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", list);
		return gson.toJson(message, Message.class);
	}
	
	public String getCompetitionName() {
		Gson gson = new Gson();
		List<MenuItem> list = competitionDao.getCompetitionNameList();
		Message<List<MenuItem>> message = new Message<List<MenuItem>>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", list);
		return gson.toJson(message, Message.class);
	}
	
	public String updateCompetition(Competition competition) {
		Message<String> message = null;
		boolean isExist = competitionDao.isExistCompetitionName(competition.getName(),competition.getId()); //是否存在该赛事名称
		if(isExist) {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, Constant.COMPETITION_NAME_IS_EXISTED, "");
		}else {
			int status = competitionDao.updateCompetition(competition);
			if(status == 1){
				message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "修改赛事成功", "");
			}else{
				message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "修改赛事失败", "");
			}
		}
		return JSONObject.fromObject(message).toString();
	}
}
