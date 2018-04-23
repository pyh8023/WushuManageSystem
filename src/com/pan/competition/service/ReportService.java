package com.pan.competition.service;

import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.MenuItem;
import com.pan.competition.bean.Report;
import com.pan.competition.config.Constant;

public class ReportService {

	public List<Report> getReportName(String competition_id,String report_type) {
		List<Report> list = new ArrayList<>();
		EventService eventService = new EventService();
		List<MenuItem> eventList = eventService.getEventNameList(competition_id).getData();
		if(Constant.EVENT_APPLY_REPORT.equals(report_type)) {
			for(MenuItem event: eventList) {
				Report report = new Report();
				report.setId(event.getId());
				report.setName(event.getName()+"报名表");
				report.setType(report_type);
				list.add(report);
			}
		}else if(Constant.DELEGATION_APPLY_REPORT.equals(report_type)) {
			DelegationService delegationService = new DelegationService();
			List<MenuItem> delegationList = delegationService.getDelegationNameList(competition_id);
			for(MenuItem delegation: delegationList) {
				Report report = new Report();
				report.setId(delegation.getId());
				report.setName(delegation.getName()+"报名表");
				report.setType(report_type);
				list.add(report);
			}
		}else if(Constant.ORDER_REPORT.equals(report_type)) {
			for(MenuItem event: eventList) {
				Report report = new Report();
				report.setId(event.getId());
				report.setName(event.getName()+"秩序单");
				report.setType(report_type);
				list.add(report);
			}
		}else if(Constant.GRADE_REPORT.equals(report_type)) {
			for(MenuItem event: eventList) {
				Report report = new Report();
				report.setId(event.getId());
				report.setName(event.getName()+"成绩表");
				report.setType(report_type);
				list.add(report);
			}
		}else if(Constant.RANKING_REPORT.equals(report_type)) {
			for(MenuItem event: eventList) {
				Report report = new Report();
				report.setId(event.getId());
				report.setName(event.getName()+"名次表");
				report.setType(report_type);
				list.add(report);
			}
		}
		return list;
	}
}
