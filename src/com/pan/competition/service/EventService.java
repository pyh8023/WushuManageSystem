package com.pan.competition.service;

import java.util.List;

import com.pan.competition.bean.Event;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.EventDao;

public class EventService {
	
	private EventDao eventDao = new EventDao();
	
	public Message<List<Event>> getEventList(String competition_id) {
		Message<List<Event>> message = null;
		List<Event> list = eventDao.getEventList(competition_id);
		message = new Message<List<Event>>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", list);
		return message;
	}
	
	public Message<String> addEvent(Event event) {
		Message<String> message = null;
		String msg = eventDao.isExistEvent(event.getName(), event.getEvent_num(),event.getCompetition_id());
		if(!Constant.NOT_EXISTED.equals(msg)) {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, msg, "");
		}else {
			int result = eventDao.addEvent(event);
			if(result == 1) {
				message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "项目添加成功", "");
			}else {
				message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "项目添加失败", "");
			}
		}
		return message;
	}
	
	public Message<List<MenuItem>> getEventNameList(String competition_id) {
		Message<List<MenuItem>> message = null;
		List<MenuItem> list = eventDao.getEventNameList(competition_id);
		message = new Message<List<MenuItem>>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", list); 
		return message;
	}
	
	public Message<String> updateEvent(Event event) {
		Message<String> message = null;
		String msg = eventDao.isExistEvent(event.getName(), event.getEvent_num(),event.getCompetition_id(),event.getId());
		if(!Constant.NOT_EXISTED.equals(msg)) {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, msg, "");
		}else {
			int result = eventDao.updateEvent(event);
			if(result == 1) {
				message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "项目添加成功", "");
			}else {
				message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "项目添加失败", "");
			}
		}
		return message;
	}
	
	public Message<String> removeEvent(String event_id) {
		Message<String> message = null;
		int status = eventDao.removeEvent(event_id);
		if(status == 1) {
			message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "项目删除成功", "");
		}else {
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "项目删除失败", "");
		}
		return message;
 	}
	
	public Message<Event> getEventById(String event_id){
		Message<Event> message = null;
		Event event = eventDao.getEventById(event_id);
		message = new Message<Event>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "", event);
		return message;
	}
	
}
