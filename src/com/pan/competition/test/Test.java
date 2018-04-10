package com.pan.competition.test;

import java.util.List;

import com.pan.competition.bean.Competition;
import com.pan.competition.bean.Event;
import com.pan.competition.bean.Stage;
import com.pan.competition.dao.CompetitionDao;
import com.pan.competition.service.CompetitionService;
import com.pan.competition.service.EventService;
import com.pan.competition.service.StageService;


public class Test {

	public static void main(String[] args) {
		//competitionServiceTest();
		//getCompetitionNameList();
		//eventServiceTest();
		//addEventTest();
		stageServiceTest();
	}
	
	static void stageServiceTest() {
		StageService service = new StageService();
		/*Stage stage = new Stage();
		stage.setName("初赛");
		stage.setStage_num("f2931");
		stage.setAttribute("1");
		stage.setEvent_id("2");
		System.out.println(service.addStage(stage));*/
		//System.out.println(service.getStageList("1"));
		//System.out.println(service.getStageNameList("1"));
		System.out.println(service.removeStage("5"));
	}
	
	static void competitionServiceTest() {
		CompetitionService service = new CompetitionService();
		System.out.println(service.getCompetitionName());
	}
	
	static void eventServiceTest() {
		EventService service = new EventService();
		System.out.println(service.removeEvent("4"));
	}
	
	static void addEventTest() {
		EventService eventService = new EventService();
		Event event = new Event();
		event.setId("2");
		event.setCompetition_id("1");
		event.setName("太极拳成年组男子集体项目");
		event.setSex("男子");
		event.setType("集体项目");
		event.setEvent_group("成年组");
		event.setEvent_num("td213");
		event.setMax_athlet_num("15");
		event.setMin_athlet_num("10");
		event.setMax_male_num("15");
		event.setMin_male_num("10");
		event.setMin_female_num("0");
		event.setMax_female_num("0");
		System.out.println(eventService.updateEvent(event));
	}
}
