package com.pan.competition.bean;

public class GradeReport implements IReport{
	private String apply_name;
	private String gradeA;
	private String gradeB;
	private String gradeC;
	private String coach_grade;
	private String total_points;
	private String promote;
	private String ranking;
	private String delegation_name;
	private String event_name;
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
	public String getGradeA() {
		return gradeA;
	}
	public void setGradeA(String gradeA) {
		this.gradeA = gradeA;
	}
	public String getGradeB() {
		return gradeB;
	}
	public void setGradeB(String gradeB) {
		this.gradeB = gradeB;
	}
	public String getGradeC() {
		return gradeC;
	}
	public void setGradeC(String gradeC) {
		this.gradeC = gradeC;
	}
	public String getCoach_grade() {
		return coach_grade;
	}
	public void setCoach_grade(String coach_grade) {
		this.coach_grade = coach_grade;
	}
	public String getTotal_points() {
		return total_points;
	}
	public void setTotal_points(String total_points) {
		this.total_points = total_points;
	}
	public String getPromote() {
		return promote;
	}
	public void setPromote(String promote) {
		this.promote = promote;
	}
	public String getRanking() {
		return ranking;
	}
	public void setRanking(String ranking) {
		this.ranking = ranking;
	}
	public String getDelegation_name() {
		return delegation_name;
	}
	public void setDelegation_name(String delegation_name) {
		this.delegation_name = delegation_name;
	}
}
