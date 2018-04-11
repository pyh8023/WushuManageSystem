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
import com.pan.competition.bean.Message;
import com.pan.competition.bean.Stage;
import com.pan.competition.service.StageService;

/**
 * Servlet implementation class StageServlet
 */
@WebServlet("/StageServlet")
public class StageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StageService stageService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StageServlet() {
        super();
        stageService = new StageService();
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
		String json = request.getParameter("data");
		Gson gson = new Gson();
		List<Stage> list = gson.fromJson(json, new TypeToken<List<Stage>>(){}.getType());
		String event_id = list.get(0).getEvent_id();
		stageService.removeStage(event_id);
		String msg = null;
		for (Stage stage : list) {
			Message<String> message = stageService.addStage(stage);
			if(!message.getCode().equals("200")) {
				msg = message.getMsg();
				break;
			}
		}
		if(msg == null) 
			msg = "保存成功";
		System.out.println(msg);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(msg);
		out.flush();
		out.close();
	}

}
