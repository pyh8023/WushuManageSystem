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
import com.pan.competition.bean.Judge;
import com.pan.competition.config.Constant;
import com.pan.competition.service.JudgeService;

/**
 * Servlet implementation class JudgeServlet
 */
@WebServlet("/JudgeServlet")
public class JudgeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JudgeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String json = request.getParameter("data");
		System.out.println(json);
		Gson gson = new Gson();
		List<Judge> list = gson.fromJson(json, new TypeToken<List<Judge>>(){}.getType());
		String msg = null;
		if(list.size()!=0) {
			String stage_id = list.get(0).getStage_id();
			JudgeService judgeService = new JudgeService();
			judgeService.remove(stage_id);
			for(Judge judge : list) {
				String result = judgeService.addJudge(judge);
				if(!result.equals(Constant.QUERY_SUCCESS_RESPONSE_CODE)) {
					msg = "保存失败";
					break;
				}
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
