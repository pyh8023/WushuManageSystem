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
import com.pan.competition.bean.Arrange;
import com.pan.competition.bean.Grade;
import com.pan.competition.config.Constant;
import com.pan.competition.service.MatchService;

/**
 * Servlet implementation class MatchServlet
 */
@WebServlet("/MatchServlet")
public class MatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MatchService matchService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatchServlet() {
        super();
        matchService = new MatchService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if("saveArrange".equals(action)) {
			saveMatchArrange(request,response);
		}else if("saveGrade".equals(action)){
			saveMatchGrade(request,response);
		}else if("promote".equals(action)) {
			changeMatchPromote(request,response);
		}
		else if("autoArrange".equals(action)){
			autoMatchArrange(request,response);
		}
	}

	private void changeMatchPromote(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String match_id = request.getParameter("match_id");
		String isPromoted = request.getParameter("isPromoted");
		String event_id = request.getParameter("event_id");
		String msg = matchService.updatePromote(match_id, event_id, isPromoted);
		PrintWriter out = response.getWriter();
		out.write(msg);
		out.flush();
		out.close();
	}

	private void saveMatchGrade(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String json = request.getParameter("data");
		Gson gson= new Gson();
		List<Grade> list = gson.fromJson(json, new TypeToken<List<Grade>>(){}.getType());
		String msg = null;
		for (Grade grade : list) {
			String result = matchService.updateMatchGrade(grade);
			if(!result.equals(Constant.QUERY_SUCCESS_RESPONSE_CODE)) {
				msg = "保存失败";
				break;
			}
		}
		if(msg == null) 
			msg = "保存成功";
		PrintWriter out = response.getWriter();
		out.write(msg);
		out.flush();
		out.close();
	}

	private void autoMatchArrange(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String json = request.getParameter("data");
		Gson gson = new Gson();
		List<Arrange> list = gson.fromJson(json, new TypeToken<List<Arrange>>(){}.getType());
		String msg = matchService.autoUpdateMatchOrder(list);
		PrintWriter out = response.getWriter();
		out.write(msg);
		out.flush();
		out.close();
	}

	private void saveMatchArrange(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String json = request.getParameter("data");
		Gson gson = new Gson();
		List<Arrange> list = gson.fromJson(json, new TypeToken<List<Arrange>>(){}.getType());
		String msg = null;
		for (Arrange arrange : list) {
			String result = matchService.updateMatchArrange(arrange);
			if(!result.equals(Constant.QUERY_SUCCESS_RESPONSE_CODE)) {
				msg = "保存失败";
				break;
			}
		}
		if(msg == null) 
			msg = "保存成功";
		PrintWriter out = response.getWriter();
		out.write(msg);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
