package com.pan.competition.action;


import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;
import com.pan.competition.bean.Competition;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.service.CompetitionService;
import com.pan.competition.util.DateUtil;

public class CompetitionAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private String result;
	
	@JSON(name="result")
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	
	public String addCompetition(){
		Competition competition = new Competition();
		competition.setName(request.getParameter("name"));
		competition.setLocation(request.getParameter("location"));
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		competition.setStartDate(startDate);
		competition.setEndDate(endDate);
		competition.setStadium(request.getParameter("stadium"));
		competition.setSponsor(request.getParameter("sponsor"));
		competition.setMascot(request.getParameter("mascot"));
		
		CompetitionService competitionService = new CompetitionService();
		result = competitionService.addCompetition(competition); 
		System.out.println(result);
		return SUCCESS;
	}
	
	public String getCompetitionList() {
		//TODO
		return SUCCESS;
	}
	
	public String getCompetitionName() {
		//TODO
		return SUCCESS;
	}
}
