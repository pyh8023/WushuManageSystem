package com.pan.competition.bean;

public class Group {
	private String id;
	private String group_num;  //组号
	private String location;
	private String start_time;
	private String end_time;
	private String stage_id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGroup_num() {
		return group_num;
	}
	public void setGroup_num(String group_num) {
		this.group_num = group_num;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getStage_id() {
		return stage_id;
	}
	public void setStage_id(String stage_id) {
		this.stage_id = stage_id;
	}
}
