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
		response.setCharacterEncoding("UTF-8");  
		response.setHeader("Content-type", "text/html;charset=UTF-8");  
		PrintWriter out = response.getWriter();  
		String code = (String) request.getSession().getAttribute("sRand");
		Admin admin = new Admin();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verificationCode = request.getParameter("verification_code");
		admin.setUsername(username);
		admin.setPassword(password);
		
		String result;
		Gson gson = new Gson();
		if(code!=null && code.equals(verificationCode)){
			AdminService loginService = new AdminService();
			System.out.println(loginService.login(admin));
			if(loginService.login(admin)){
				Message<String> message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "登录成功", "");
				result = gson.toJson(message, Message.class);
			}else{
				Message<String> message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "用户名或密码错误", "");
				result = gson.toJson(message, Message.class);
			}
		}else{
			Message<String> message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "验证码错误", "");
			result = gson.toJson(message, Message.class);
		}
		out.write(result);
		out.flush();
		out.close();
	}

}
