package com.pan.competition.action;

import javax.servlet.http.HttpServletRequest;

public class AthletAction {
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
}
