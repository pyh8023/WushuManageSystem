package com.pan.competition.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
	}

}
