package com.pan.competition.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport  implements ServletRequestAware{
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request=arg0;
		
	}

	public String execute() throws Exception {
		
		System.out.println("user1");
		 return "success";
	}
	public String execute2() throws Exception {
		//String method = request.getParameter("method");
		//System.out.println("actionSuccess"+method);
		//String name = request.getParameter("");
		
		System.out.println("user2");
		 return "failed";
	}
}
