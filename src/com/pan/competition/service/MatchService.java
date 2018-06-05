package com.pan.competition.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import com.pan.competition.bean.Arrange;
import com.pan.competition.bean.Grade;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.GroupDao;
import com.pan.competition.dao.MatchDao;

public class MatchService {
	
	private MatchDao matchDao = new MatchDao();
	
	public List<Arrange> getMatchArrangeList(String stage_id){
		List<Arrange> list = matchDao.getMatchArrangeList(Integer.parseInt(stage_id));
		return list;
	}
	
	public List<Grade> getGradeList(String stage_id,String group_num){
		List<Grade> list = matchDao.getGradeList(stage_id,Integer.parseInt(group_num));
		return list;
	}
	
	public List<Grade> getGradeListOrderByRanking(String stage_id,String group_num){
		List<Grade> list = matchDao.getGradeListOrderByRanking(stage_id,Integer.parseInt(group_num));
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
	
	public int updateMatchArrange(Arrange arrange) {
		return matchDao.updateMatchArrange(arrange);
	}
	
	public String updateMatchGrade(Grade grade) {
		int status = matchDao.updateGrade(grade);
		if(status == 1)
			return Constant.QUERY_SUCCESS_RESPONSE_CODE;
		else 
			return Constant.QUERY_FAILED_RESPONSE_CODE;
	}
	
	public String autoUpdateMatchOrder(List<Arrange> list) {
		for(Arrange arrange :list)
			matchDao.updateMatchArrange(arrange);
		String msg = "抽签成功";
		String stage_id = list.get(0).getStage_id();
		List<MenuItem> groups = new GroupDao().getGroupNumList(list.get(0).getStage_id()); 
		for(MenuItem group :groups) {
			List<String> groupArranges = new LinkedList<>(matchDao.getMatchIdList(stage_id, group.getName()));
			Random random = new Random();
			for(int i=1;groupArranges.size()>0;i++){
				int index = random.nextInt(groupArranges.size());
				String match_id = groupArranges.remove(index);
				int status = matchDao.updateMatchOrder(match_id, i);
				if(status!=1) {
					msg = "抽签失败";
					break;
				}
			}
		}
		return msg;
	}
	
	public List<MenuItem> getGroupNameList(String stage_id){
		return new GroupDao().getGroupNumList(stage_id);
	}
}
