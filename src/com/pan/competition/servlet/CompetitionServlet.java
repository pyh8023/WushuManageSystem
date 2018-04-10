package com.pan.competition.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pan.competition.bean.Competition;
import com.pan.competition.bean.Message;
import com.pan.competition.service.CompetitionService;

/**
 * Servlet implementation class CompetitionServlet
 */
@WebServlet("/CompetitionServlet")
public class CompetitionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CompetitionService competitionService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompetitionServlet() {
        super();
        competitionService = new CompetitionService();
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
		response.setCharacterEncoding("UTF-8");
		String action=request.getParameter("action");
		if("add".equals(action)) {
			addCompetition(request,response);
		}else if("update".equals(action)) {
			updateCompetition(request,response);
		}
	}
	
	private void updateCompetition(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Competition competition = new Competition();
		competition.setId(request.getParameter("id"));
		competition.setName(request.getParameter("competition_name"));
		competition.setProvince(request.getParameter("province"));
		competition.setCity(request.getParameter("city"));
		String startDate = request.getParameter("competition_start_date");
		String endDate = request.getParameter("competition_end_date");
		competition.setStartDate(startDate);
		competition.setEndDate(endDate);
		competition.setStadium(request.getParameter("competition_stadium"));
		competition.setSponsor(request.getParameter("competition_mascot"));
		competition.setMascot(request.getParameter("competition_sponsor"));
		Message<String> message= competitionService.updateCompetition(competition);
		if(message.getCode().equals("200")) {
			//跳转到赛事管理页面
			response.sendRedirect( request.getContextPath()+ "/admin/competition/competition-manage.jsp");
		}else {
			request.setAttribute("msg", message.getMsg());
			request.getRequestDispatcher("/admin/competition/competition-change.jsp?id="+competition.getId()).forward(request, response);
		}
	}

	
	private void addCompetition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Competition competition = new Competition();
		competition.setName(request.getParameter("competition_name"));
		competition.setProvince(request.getParameter("province"));
		competition.setCity(request.getParameter("city"));
		String startDate = request.getParameter("competition_start_date");
		String endDate = request.getParameter("competition_end_date");
		competition.setStartDate(startDate);
		competition.setEndDate(endDate);
		competition.setStadium(request.getParameter("competition_stadium"));
		competition.setSponsor(request.getParameter("competition_mascot"));
		competition.setMascot(request.getParameter("competition_sponsor"));
		Message<String> message= competitionService.addCompetition(competition);
		if(message.getCode().equals("200")) {
			//跳转到赛事管理页面
			response.sendRedirect( request.getContextPath()+ "/admin/competition/competition-manage.jsp");
		}else {
			request.setAttribute("add_competition_msg", message.getMsg());
			request.getRequestDispatcher("/admin/competition/competition-add.jsp").forward(request, response);
		}
	}

}
