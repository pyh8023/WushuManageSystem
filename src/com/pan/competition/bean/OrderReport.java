package com.pan.competition.bean;

public class OrderReport implements IReport{
	private String order;
	private String apply_name;
	private String delegation_name;
	private String group_num;
	private String event_name;
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getApply_name() {
		return apply_name;
	}
	public void setApply_name(String apply_name) {
		this.apply_name = apply_name;
	}
	public String getDelegation_name() {
		return delegation_name;
	}
	public void setDelegation_name(String delegation_name) {
		this.delegation_name = delegation_name;
	}
	public String getGroup_num() {
		return group_num;
	}
	public void setGroup_num(String group_num) {
		this.group_num = group_num;
	}
}
