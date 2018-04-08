package com.pan.competition.service;

import java.util.List;

import com.google.gson.Gson;
import com.pan.competition.bean.Event;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.EventDao;

import net.sf.json.JSONObject;

public class EventService {
	
	private EventDao eventDao = new EventDao();
	
	public String getEventList(String competition_id) {
		Message<List<Event>> message = null;
		List<Event> list = eventDao.getEventList(competition_id);
		message = new Message<List<Event>>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", list);
		Gson gson = new Gson();
		return gson.toJson(message, Message.class);
	}
	
	public String addEvent(Event event) {
		Message<String> message = null;
		boolean isExistName = eventDao.isExistEventName(event.getName(), event.getCompetition_id(),event.getId());
		if(isExistName) {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, Constant.EVENT_NAME_IS_EXISTED, "");
		}else {
			int result = eventDao.addEvent(event);
			if(result == 1) {
				message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "项目添加成功", "");
			}else {
				message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "项目添加失败", "");
			}
		}
		return JSONObject.fromObject(message).toString();
	}
	
	public String getEventNameList(String competition_id) {
		Message<List<MenuItem>> message = null;
		Gson gson = new Gson();
		List<MenuItem> list = eventDao.getEventNameList(competition_id);
		message = new Message<List<MenuItem>>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", list); 
		return gson.toJson(message, Message.class);
	}
	
	public String updateEvent(Event event) {
		Message<String> message = null;
		int status = eventDao.updateEvent(event);
		if(status == 1) {
			message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "项目修改成功", "");
		}else {
			message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "项目修改失败", "");
		}
		return JSONObject.fromObject(message).toString();
	}
	
	public String removeEvent(String event_id) {
		Message<String> message = null;
		int status = eventDao.removeEvent(event_id);
		if(status == 1) {
			message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "项目删除成功", "");
		}else {
			message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "项目删除失败", "");
		}
		return JSONObject.fromObject(message).toString();
 	}
}
