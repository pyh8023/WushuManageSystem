package com.pan.competition.service;

import java.util.List;

import com.pan.competition.bean.Arrange;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.MatchDao;

public class MatchService {
	
	private MatchDao matchDao = new MatchDao();
	
	public List<Arrange> getMatchArrangeList(String stage_id){
		List<Arrange> list = matchDao.getMatchArrangeList(Integer.parseInt(stage_id));
		return list;
	}
	
	public String updateMatchArrange(Arrange arrange) {
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
	}
	
	public String autoUpdateMatchOrder() {
		return null;
	}
}
