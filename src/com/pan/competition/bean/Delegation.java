package com.pan.competition.bean;

public class Delegation {
	private String id;
	private String name;
	private String location;
	private String athlet_num;
	private String phone;
	private String competition_id;
	private String introduction;
	public String getCompetition_id() {
		return competition_id;
	}
	public void setCompetition_id(String competition_id) {
		this.competition_id = competition_id;
	}
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAthlet_num() {
		return athlet_num;
	}
	public void setAthlet_num(String athlet_num) {
		this.athlet_num = athlet_num;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
}
