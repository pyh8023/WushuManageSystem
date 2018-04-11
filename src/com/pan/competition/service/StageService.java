package com.pan.competition.service;

import java.util.List;

import com.pan.competition.bean.MenuItem;
import com.pan.competition.bean.Message;
import com.pan.competition.bean.Stage;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.StageDao;

public class StageService {
	
	private StageDao stageDao = new StageDao();
	
	public Message<List<Stage>> getStageList(String event_id) {
		Message<List<Stage>> message = null;
		List<Stage> list = stageDao.getStageList(event_id);
		message = new Message<List<Stage>>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", list);
		return message;
	}
	
	public Message<List<MenuItem>> getStageNameList(String event_id) {
		Message<List<MenuItem>> message = null;
		List<MenuItem> list = stageDao.getStageNameList(event_id);
		message = new Message<List<MenuItem>>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", list);
		return message;
	}
	
	public Message<String> addStage(Stage stage) {
		Message<String> message = null;
		String msg = stageDao.isExist(stage);
		if(msg.equals(Constant.NOT_EXISTED)) {
			int status = stageDao.addStage(stage);
			if(status == 1) {
				message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "比赛阶段添加成功", "");
			}else {
				message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "比赛阶段添加失败", "");
			}
		}else {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, msg, "");
		}
		return message;
	}
	
	public boolean removeStage(String event_id) {
		int status = stageDao.removeStage(event_id);
		if(status != 0) {
			return true;
		}else {
			return false;
		}
		
	}
}
