package com.pan.competition.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.pan.competition.util.DBUtil;

public class TestAction extends ActionSupport  implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	public String execute() throws Exception {
		//String method = request.getParameter("method");
		//System.out.println("actionSuccess"+method);
		System.out.println("1:");
		 return "success";
	}
	public String execute2() throws Exception {
		//String method = request.getParameter("method");
		//System.out.println("actionSuccess"+method);
		String name = request.getParameter("");
		
		System.out.println("test2");
		 return "failed";
	}
	
}
