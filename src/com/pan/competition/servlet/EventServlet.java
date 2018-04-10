package com.pan.competition.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pan.competition.bean.Event;
import com.pan.competition.bean.Message;
import com.pan.competition.service.EventService;

/**
 * Servlet implementation class EventServlet
 */
@WebServlet("/EventServlet")
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EventService eventService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventServlet() {
        super();
        eventService = new EventService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if("add".equals(action)) {
			addEvent(request,response);
		}else if("update".equals(action)){
			updateEvent(request,response);
		}else if("remove".equals(action)) {
			removeEvent(request,response);
		}
	}
	
	private void addEvent(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Event event = new Event();
		event.setCompetition_id(request.getParameter("competition_id"));
		event.setName(request.getParameter("event_name"));
		event.setEvent_num(request.getParameter("event_number"));
		event.setType(request.getParameter("event_type"));
		event.setEvent_group(request.getParameter("event_group"));
		event.setSex(request.getParameter("event_sex"));
		event.setMax_athlet_num(request.getParameter("max_athlet_num"));
		event.setMin_athlet_num(request.getParameter("min_athlet_num"));
		String num = request.getParameter("max_male_athlet_num");
		if(num.equals("")) {
			event.setMax_male_num("0");
		}else {
			event.setMax_male_num(num);
		}
		num = request.getParameter("min_male_athlet_num");
		if(num.equals("")) {
			event.setMin_male_num("0");
		}else {
			event.setMin_male_num(num);
		}
		num = request.getParameter("max_female_athlet_num");
		if(num.equals("")) {
			event.setMax_female_num("0");
		}else {
			event.setMax_female_num(num);
		}
		num = request.getParameter("min_female_athlet_num");
		if(num.equals("")) {
			event.setMin_female_num("0");
		}else {
			event.setMin_female_num(num);
		}
		Message<String> message = eventService.addEvent(event);
		if(message.getCode().equals("200")) {
			response.sendRedirect( request.getContextPath()+ "/admin/competition/competition-msg.jsp?competition_id="+event.getCompetition_id());
		}else {
			request.setAttribute("add_event_msg", message.getMsg());
			request.getRequestDispatcher("/admin/competition/competition-event-add.jsp?competition_id="+event.getCompetition_id()).forward(request, response);
		}
	}
	
	private void updateEvent(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Event event = new Event();
		event.setId(request.getParameter("event_id"));
		event.setName(request.getParameter("event_name"));
		event.setEvent_num(request.getParameter("event_number"));
		event.setEvent_group(request.getParameter("event_group"));
		event.setType(request.getParameter("event_type"));
		event.setSex(request.getParameter("event_sex"));
		event.setMax_athlet_num(request.getParameter("max_athlet_num"));
		event.setMin_athlet_num(request.getParameter("min_athlet_num"));
		String num = request.getParameter("max_male_athlet_num");
		if(num.equals("")) {
			event.setMax_male_num("0");
		}else {
			event.setMax_male_num(num);
		}
		num = request.getParameter("min_male_athlet_num");
		if(num.equals("")) {
			event.setMin_male_num("0");
		}else {
			event.setMin_male_num(num);
		}
		num = request.getParameter("max_female_athlet_num");
		if(num.equals("")) {
			event.setMax_female_num("0");
		}else {
			event.setMax_female_num(num);
		}
		num = request.getParameter("min_female_athlet_num");
		if(num.equals("")) {
			event.setMin_female_num("0");
		}else {
			event.setMin_female_num(num);
		}
		Message<String> message = eventService.updateEvent(event);
		String competition_id = request.getParameter("competition_id");
		if(message.getCode().equals("200")) {
			response.sendRedirect( request.getContextPath()+ "/admin/competition/competition-msg.jsp?competition_id="+competition_id);
		}else {
			request.setAttribute("msg", message.getMsg());
			request.getRequestDispatcher("/admin/competition/competition-event-change.jsp?event_id="+event.getId()).forward(request, response);
		}
	}
	
	private void removeEvent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String event_id = request.getParameter("event_id");
		String competition_id = request.getParameter("competition_id");
		Message<String> message = eventService.removeEvent(event_id);
		if(!message.getCode().equals("200")) {
			request.setAttribute("msg",message.getMsg());
		}
		response.sendRedirect( request.getContextPath()+ "/admin/competition/competition-msg.jsp?competition_id="+competition_id);
	}

}
