package com.pan.competition.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.service.AdminService;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class ServletTest
 */
@WebServlet("/ServletTest")
public class ServletTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("2");
		response.setCharacterEncoding("UTF-8");  
		PrintWriter out = response.getWriter();  
		/*String code = (String) request.getSession().getAttribute("sRand");
		Admin admin = new Admin();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verificationCode = request.getParameter("verification_code");
		admin.setUsername(username);
		admin.setPassword(password);
		System.out.println(admin.getPassword());
		
		String result;
		if(code!=null && code.equals(verificationCode)){
			AdminService loginService = new AdminService();
			if(loginService.login(admin)){
				request.getSession().setAttribute("admin", admin.getUsername());
				Message<String> message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, "登录成功", "");
				result = JSONObject.fromObject(message).toString();
			}else{
				Message<String> message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "用户名或密码错误", "");
				result = JSONObject.fromObject(message).toString();
			}
		}else{
			Message<String> message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, "验证码错误", "");
			result = JSONObject.fromObject(message).toString();
		}
		System.out.println(result);*/
		response.setHeader("Content-type", "text/html;charset=UTF-8");  
		out.write("我");
		System.out.println("test");
		out.flush();
		out.close();
	}

}
