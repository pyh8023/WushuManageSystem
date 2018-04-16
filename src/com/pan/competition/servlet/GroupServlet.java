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
import com.pan.competition.bean.Group;
import com.pan.competition.bean.Message;
import com.pan.competition.bean.Stage;
import com.pan.competition.service.GroupService;

/**
 * Servlet implementation class GroupServlet
 */
@WebServlet("/GroupServlet")
public class GroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GroupService groupService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupServlet() {
        super();
        groupService = new GroupService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json = request.getParameter("data");
		Gson gson = new Gson();
		List<Group> list = gson.fromJson(json, new TypeToken<List<Group>>(){}.getType());
		String stage_id = list.get(0).getStage_id();
		String msg = null;
		groupService.removeGroup(stage_id);
		for (Group group : list) {
			Message<String> message = groupService.addGroup(group);
			if(!message.getCode().equals("200")) {
				msg = message.getMsg();
				break;
			}
		}
		if(msg == null) 
			msg = "保存成功";
		response.setCharacterEncoding("UTF-8");
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
