package com.pan.competition.service;

import java.util.List;

import com.pan.competition.bean.Arrange;
import com.pan.competition.bean.Grade;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.MatchDao;

public class MatchService {
	
	private MatchDao matchDao = new MatchDao();
	
	public List<Arrange> getMatchArrangeList(String stage_id){
		List<Arrange> list = matchDao.getMatchArrangeList(Integer.parseInt(stage_id));
		return list;
	}
	
	public List<Grade> getGradeList(String stage_id){
		List<Grade> list = matchDao.getGradeList(Integer.parseInt(stage_id));
		return list;
	}
	
	public List<Grade> getGradeListOrderByRanking(String stage_id){
		List<Grade> list = matchDao.getGradeListOrderByRanking(Integer.parseInt(stage_id));
		return list;
	}
	
	public String updatePromote(String match_id,String event_id,String isPromoted) {
		if("0".equals(isPromoted)){
			int status = matchDao.setPromoted(match_id, event_id);
			if(status == 1) 
				return "晋级成功";
			else
				return "晋级失败";
		}else {
			int status = matchDao.canclePromoted(match_id, event_id);
			if(status == 1) 
				return "取消晋级成功";
			else
				return "取消晋级失败";
		}
	}
	
	/*public String updateMatchArrange(Arrange arrange) {
		int add_order_result = matchDao.addMatchOrder(arrange.getMatch_id(), arrange.getOrder());
		if(add_order_result != 1) {
			int result;
			if(matchDao.isExistMatchGroup(arrange.getMatch_id())) {
				result = matchDao.updateMatchGroup(arrange.getMatch_id(), arrange.getGroup_num());
			}else {
				result = matchDao.addMatchGroup(arrange.getMatch_id(), arrange.getGroup_num());
			}
			if(result == 1)
				return Constant.QUERY_SUCCESS_RESPONSE_CODE;
			else
				return Constant.QUERY_FAILED_RESPONSE_CODE;
		}
		else {
			return Constant.QUERY_FAILED_RESPONSE_CODE;
		}
	}*/
	
	public String updateMatchArrange(Arrange arrange) {
		int status = matchDao.updateMatchArrange(arrange);
		if(status == 1) 
			return Constant.QUERY_SUCCESS_RESPONSE_CODE;
		else 
			return Constant.QUERY_FAILED_RESPONSE_CODE;
	}
	
	public String updateMatchGrade(Grade grade) {
		int status = matchDao.updateGrade(grade);
		if(status == 1)
			return Constant.QUERY_SUCCESS_RESPONSE_CODE;
		else 
			return Constant.QUERY_FAILED_RESPONSE_CODE;
	}
	
	/*public String autoUpdateMatchOrder() {
		return null;
	}*/
}
