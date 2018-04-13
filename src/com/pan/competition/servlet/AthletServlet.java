package com.pan.competition.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pan.competition.bean.Athlet;
import com.pan.competition.bean.Message;
import com.pan.competition.service.AthletService;

@WebServlet("/AthletServlet")
public class AthletServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AthletService athletService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AthletServlet() {
        super();
        athletService = new AthletService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if("add".equals(action)) {
			addAthlet(request,response);
		}else if("remove".equals(action)) {
			removeAthlet(request,response);
		}else if("update".equals(action)) {
			updateAthlet(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void addAthlet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String competition_id = request.getParameter("competition_id");
		Athlet athlet = new Athlet();
		athlet.setName(request.getParameter("athlet_name"));
		athlet.setSex(request.getParameter("athlet_sex"));
		athlet.setAge(request.getParameter("athlet_age"));
		athlet.setDelegation_id(request.getParameter("delegation_id"));
		Message<String> message = athletService.addAthlet(athlet);
		if(message.getCode().equals("200")) {
			response.sendRedirect( request.getContextPath()+ "/admin/athlet/athlet-manage.jsp?delegation_id="+athlet.getDelegation_id()+"&competition_id="+competition_id);
		}else {
			request.setAttribute("msg", message.getMsg());
			request.getRequestDispatcher("admin/athlet/athlet-add.jsp?").forward(request, response);
		}
	}
	
	private void updateAthlet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String competition_id = request.getParameter("competition_id");
		String delegation_id = request.getParameter("delegation_id");
		Athlet athlet = new Athlet();
		athlet.setId(request.getParameter("athlet_id"));
		athlet.setName(request.getParameter("athlet_name"));
		athlet.setSex(request.getParameter("athlet_sex"));
		athlet.setAge(request.getParameter("athlet_age"));
		Message<String> message = athletService.updateAthlet(athlet);
		if(message.getCode().equals("200")) {
			response.sendRedirect( request.getContextPath()+ "/admin/athlet/athlet-manage.jsp?delegation_id="+delegation_id+"&competition_id="+competition_id);
		}else {
			request.setAttribute("msg", message.getMsg());
			request.getRequestDispatcher("admin/athlet/athlet-update.jsp?athlet_id="+athlet.getId()+"&competition_id="+competition_id).forward(request, response);
		}
	}

	private void removeAthlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String athlet_id = request.getParameter("athlet_id");
		String msg = athletService.removeAthlet(athlet_id);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(msg);
		out.flush();
		out.close();
	}
}
