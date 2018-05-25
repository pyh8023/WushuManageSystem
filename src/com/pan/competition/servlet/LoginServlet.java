package com.pan.competition.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String action = request.getParameter("action");
		if("login".equals(action))
			login(request,response);
		else if("register".equals(action))
			register(request, response);
		else if("logout".equals(action))
			logout(request, response);
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("username");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		admin.setEmail(email);
		
		AdminService adminService = new AdminService();
		String result = adminService.register(admin);
		request.setAttribute("register_msg", result);
		request.getRequestDispatcher("/register.jsp").forward(request, response);
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String code = (String) request.getSession().getAttribute("sRand");
		Admin admin = new Admin();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verificationCode = request.getParameter("verification_code");
		admin.setUsername(username);
		admin.setPassword(password);
		
		if(code!=null && code.equals(verificationCode)){
			AdminService adminService = new AdminService();
			Message<String> message = adminService.login(admin);
			if(message.getCode().equals(Constant.QUERY_SUCCESS_RESPONSE_CODE)){
				request.getSession().setAttribute("username", username);
				response.sendRedirect( request.getContextPath()+"/admin/index.jsp"); 
			}else{
				request.setAttribute("login_msg", message.getMsg());
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("login_msg", "验证码错误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
