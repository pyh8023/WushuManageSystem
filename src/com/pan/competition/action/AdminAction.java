package com.pan.competition.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.pan.competition.bean.Admin;
import com.pan.competition.service.AdminService;

public class AdminAction extends ActionSupport implements ServletRequestAware{
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request=arg0;
	}
	
	@Override
	public String execute() throws Exception {
		String code = (String) ActionContext.getContext().getSession().get("sRand");
		Admin admin = new Admin();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verificationCode = request.getParameter("verification_code");
		admin.setUsername(username);
		admin.setPassword(password);
		if(code!=null && code.equals(verificationCode)){
			AdminService loginService = new AdminService();
			if(loginService.login(admin)){
				//TODO 登录成功处理
				ActionContext.getContext().getSession().put("admin", admin.getUsername());
				System.out.println("登录成功");
				return "success";
			}
			else{
				return "failed";
			}
		}else{
			return "failed";
		}
	}
}
