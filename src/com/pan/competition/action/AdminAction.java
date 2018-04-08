package com.pan.competition.action;


import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pan.competition.bean.Admin;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.service.AdminService;

public class AdminAction extends ActionSupport implements ServletRequestAware{
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private String result;

	@JSON(name="result")
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request=arg0;
	}
	
	/**
	 * 登录模块
	 */
	public String login() {
		String code = (String) ActionContext.getContext().getSession().get("sRand");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Admin admin = new Admin(username,password);
		String verificationCode = request.getParameter("verification_code");
		if(code!=null && code.equals(verificationCode)){
			AdminService adminService = new AdminService();
			if(adminService.login(admin)){
				ActionContext.getContext().getSession().put("admin", admin.getUsername());	
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
		/*response.setContentType("text/html");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(result);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		System.out.println(result);
		return SUCCESS;
	}
}
