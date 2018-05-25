package com.pan.competition.bean;

import java.util.List;

public class RankingReport{
	private String apply_name;
	private String delegation_name;
	private String report_name;
	private String ranking;
	private List<String> stage_name;
	private List<String> stage_grade;
	public String getReport_name() {
		return report_name;
	}
	public void setReport_name(String report_name) {
		this.report_name = report_name;
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
	public List<String> getStage_name() {
		return stage_name;
	}
	public void setStage_name(List<String> stage_name) {
		this.stage_name = stage_name;
	}
	public List<String> getStage_grade() {
		return stage_grade;
	}
	public void setStage_grade(List<String> stage_grade) {
		this.stage_grade = stage_grade;
	}
}
