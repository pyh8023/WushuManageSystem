package com.pan.competition.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pan.competition.bean.Admin;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.service.AdminService;

/**
 * Servlet implementation class ServletTest
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
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
		String code = (String) request.getSession().getAttribute("sRand");
		Admin admin = new Admin();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verificationCode = request.getParameter("verification_code");
		admin.setUsername(username);
		admin.setPassword(password);
		
		if(code!=null && code.equals(verificationCode)){
			AdminService loginService = new AdminService();
			System.out.println(loginService.login(admin));
			if(loginService.login(admin)){
				response.sendRedirect( request.getContextPath()+"/index.jsp"); 
			}else{
				request.setAttribute("login_msg", "用户名或密码错误");
				request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("login_msg", "验证码错误");
			request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
		}
	}

}
