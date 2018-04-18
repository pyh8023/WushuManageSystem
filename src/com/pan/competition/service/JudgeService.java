package com.pan.competition.service;

import java.util.List;

import com.pan.competition.bean.Judge;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.JudgeDao;

public class JudgeService {
	
	private JudgeDao judgeDao = new JudgeDao();
	
	public String addJudge(Judge judge) {
		int status = judgeDao.addJudge(judge);
		if(status == 1) 
			return Constant.QUERY_SUCCESS_RESPONSE_CODE;
		else
			return Constant.QUERY_FAILED_RESPONSE_CODE;
	}
	
	public String remove(String stage_id) {
		int status = judgeDao.removeJudge(stage_id);
		if(status != 0)
			return Constant.QUERY_SUCCESS_RESPONSE_CODE;
		else
			return Constant.QUERY_FAILED_RESPONSE_CODE;
	}
	
	public List<Judge> getJudgeList(String stage_id){
		List<Judge> list = judgeDao.getJudgeList(stage_id);
		return list;
	}
}
