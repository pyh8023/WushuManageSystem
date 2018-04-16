package com.pan.competition.bean;

public class Match {
	private int match_id;
	private int apply_event_id;
	private int stage_id;
	private int ranking;
	private int gradeA;
	private int gradeB;
	private int gradeC;
	private int coach_grade;
	private int total_points;
	private boolean is_promoted;
	private int group_id;
	private int order;
	public int getMatch_id() {
		return match_id;
	}
	public void setMatch_id(int match_id) {
		this.match_id = match_id;
	}
	public int getApply_event_id() {
		return apply_event_id;
	}
	public void setApply_event_id(int apply_event_id) {
		this.apply_event_id = apply_event_id;
	}
	public int getStage_id() {
		return stage_id;
	}
	public void setStage_id(int stage_id) {
		this.stage_id = stage_id;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public int getGradeA() {
		return gradeA;
	}
	public void setGradeA(int gradeA) {
		this.gradeA = gradeA;
	}
	public int getGradeB() {
		return gradeB;
	}
	public void setGradeB(int gradeB) {
		this.gradeB = gradeB;
	}
	public int getGradeC() {
		return gradeC;
	}
	public void setGradeC(int gradeC) {
		this.gradeC = gradeC;
	}
	public int getCoach_grade() {
		return coach_grade;
	}
	public void setCoach_grade(int coach_grade) {
		this.coach_grade = coach_grade;
	}
	public int getTotal_points() {
		return total_points;
	}
	public void setTotal_points(int total_points) {
		this.total_points = total_points;
	}
	public boolean isIs_promoted() {
		return is_promoted;
	}
	public void setIs_promoted(boolean is_promoted) {
		this.is_promoted = is_promoted;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
}
