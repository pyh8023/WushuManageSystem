package com.pan.competition.bean;

public class Event {	
	private String id;
	private String name;
	private String event_num;  //项目编号
	private String type; //项目类别
	private String event_group; //项目组别,分成年组（大于18），青少年组（12-18）和儿童组（小于12）
	private String sex;
	private String max_athlet_num;
	private String min_athlet_num;
	private String min_female_num;
	private String max_female_num;
	private String min_male_num;
	private String max_male_num;
	private String competition_id;
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
	public String getEvent_num() {
		return event_num;
	}
	public void setEvent_num(String event_num) {
		this.event_num = event_num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEvent_group() {
		return event_group;
	}
	public void setEvent_group(String event_group) {
		this.event_group = event_group;
	}
	public String getMax_athlet_num() {
		return max_athlet_num;
	}
	public void setMax_athlet_num(String max_athlet_num) {
		this.max_athlet_num = max_athlet_num;
	}
	public String getMin_athlet_num() {
		return min_athlet_num;
	}
	public void setMin_athlet_num(String min_athlet_num) {
		this.min_athlet_num = min_athlet_num;
	}
	public String getMin_female_num() {
		return min_female_num;
	}
	public void setMin_female_num(String min_female_num) {
		this.min_female_num = min_female_num;
	}
	public String getMax_female_num() {
		return max_female_num;
	}
	public void setMax_female_num(String max_female_num) {
		this.max_female_num = max_female_num;
	}
	public String getMin_male_num() {
		return min_male_num;
	}
	public void setMin_male_num(String min_male_num) {
		this.min_male_num = min_male_num;
	}
	public String getMax_male_num() {
		return max_male_num;
	}
	public void setMax_male_num(String max_male_num) {
		this.max_male_num = max_male_num;
	}
	public String getCompetition_id() {
		return competition_id;
	}
	public void setCompetition_id(String competition_id) {
		this.competition_id = competition_id;
	}
}
