package com.pan.competition.bean;

/**
 * 比赛阶段
 * @author pyh
 *
 */
public class Stage {
	private String id;
	private String name;
	private String stage_num;
	private String attribute;
	private String event_id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStage_num() {
		return stage_num;
	}
	public void setStage_num(String stage_num) {
		this.stage_num = stage_num;
	}
	public String getAttribute() {
		return attribute;
	}
	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
	public String getEvent_id() {
		return event_id;
	}
	public void setEvent_id(String event_id) {
		this.event_id = event_id;
	}
}
