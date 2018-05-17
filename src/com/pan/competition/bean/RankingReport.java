package com.pan.competition.bean;

import java.util.List;
import java.util.Map;

public class RankingReport implements IReport{
	private String apply_name;
	private String delegation_name;
	private String event_name;
	private String ranking;
	private List<Map<String,String>> stage_grade;
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
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
	public String getRanking() {
		return ranking;
	}
	public void setRanking(String ranking) {
		this.ranking = ranking;
	}
	public List<Map<String,String>> getStage_grade() {
		return stage_grade;
	}
	public void setStage_grade(List<Map<String,String>> stage_grade) {
		this.stage_grade = stage_grade;
	}
	
}
