package com.pan.competition.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.pan.competition.bean.Apply;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.CompetitionDao;
import com.pan.competition.dao.EventDao;
import com.pan.competition.service.ApplyService;


/**
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplyService applyService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyServlet() {
        super();
        applyService = new ApplyService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if("add".equals(action)) {
			addApply(request,response);
		}else if("remove".equals(action)) {
			removeApply(request,response);
		}else if("update".equals(action)) {
			updateApply(request,response);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

	private void updateApply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String json = request.getParameter("data");
		Gson gson = new Gson();
		List<Apply> list = gson.fromJson(json, new TypeToken<List<Apply>>(){}.getType());
		String result = applyService.updateApply(list);
		PrintWriter out = response.getWriter();
	    out.write(result);
	    out.flush();
	    out.close();
	}

	private void removeApply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String apply_id = request.getParameter("data");
		String result = applyService.removeApply(apply_id);
		PrintWriter out = response.getWriter();
	    out.write(result);
	    out.flush();
	    out.close();
	}

	private void addApply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String json = request.getParameter("data");
		Gson gson = new Gson();
		List<Apply> list = gson.fromJson(json, new TypeToken<List<Apply>>(){}.getType());
		String result = null;
		if(list.size()==0)
			return;
		for(Apply apply:list) {
		   result = applyService.addApply(apply);
		   if(result.equals(Constant.QUERY_FAILED_RESPONSE_CODE)) {
			   break;
		   }
		}
		CompetitionDao competitionDao = new CompetitionDao();
		int competition_id = new EventDao().getCompetitionIdByEventId(list.get(0).getEvent_id());
		competitionDao.setCompetitionStatus(competition_id, "1");
		PrintWriter out = response.getWriter();
	    out.write(result);
	    out.flush();
	    out.close();
	}
}
