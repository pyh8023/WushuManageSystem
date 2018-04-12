package com.pan.competition.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pan.competition.bean.Delegation;
import com.pan.competition.bean.Message;
import com.pan.competition.service.DelegationService;

/**
 * Servlet implementation class DelegationServlet
 */
@WebServlet("/DelegationServlet")
public class DelegationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DelegationService delegationService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelegationServlet() {
        super();
        delegationService = new DelegationService();
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
			addDelegation(request,response);
		}else if("update".equals(action)) {
			updateDelegation(request,response);
		}else if("remove".equals(action)) {
			removeDelegation(request,response);
		}
	}
	
	private void removeDelegation(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String delegation_id = request.getParameter("delegation_id");
		String msg = delegationService.removeDelegation(delegation_id);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(msg);
		out.flush();
		out.close();
	}

	private void addDelegation(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String competition_id = request.getParameter("competition_id");
		Delegation delegation = new Delegation();
		delegation.setCompetition_id(competition_id);
		delegation.setName(request.getParameter("delegation_name"));
		delegation.setPhone(request.getParameter("delegation_phone"));
		delegation.setProvince(request.getParameter("province"));
		delegation.setCity(request.getParameter("city"));
		delegation.setDistrict(request.getParameter("district"));
		delegation.setIntroduction(request.getParameter("delegation_description"));
		Message<String> message = delegationService.addDelegation(delegation);
		if(message.getCode().equals("200")) {
			response.sendRedirect( request.getContextPath()+ "/admin/delegation/delegation-manage.jsp?selected="+competition_id);
		}else {
			request.setAttribute("msg", message.getMsg());
			request.getRequestDispatcher("/admin/delegation/delegation-add.jsp?competition_id="+competition_id).forward(request, response);
		}
	}

	private void updateDelegation(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String delegation_id = request.getParameter("delegation_id");
		String competition_id = request.getParameter("competition_id");
		if(delegation_id==null)
			return;
		Delegation delegation = new Delegation();
		delegation.setId(delegation_id);
		delegation.setCompetition_id(competition_id);
		delegation.setName(request.getParameter("delegation_name"));
		delegation.setPhone(request.getParameter("delegation_phone"));
		delegation.setProvince(request.getParameter("province"));
		delegation.setCity(request.getParameter("city"));
		delegation.setDistrict(request.getParameter("district"));
		delegation.setIntroduction(request.getParameter("delegation_description"));
		Message<String> message = delegationService.updateDelegation(delegation);
		if(message.getCode().equals("200")) {
			response.sendRedirect( request.getContextPath()+ "/admin/delegation/delegation-manage.jsp?selected="+competition_id);
		}else {
			request.setAttribute("msg", message.getMsg());
			request.getRequestDispatcher("/admin/delegation/delegation-update.jsp?delegation_id="+delegation_id).forward(request, response);
		}
	}
}
