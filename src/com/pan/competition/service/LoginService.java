package com.pan.competition.service;

import com.pan.competition.bean.Admin;
import com.pan.competition.dao.LoginDao;

public class LoginService {
	
	public boolean login(Admin admin){
		LoginDao loginDao = new LoginDao();
		String password = loginDao.queryAdmin(admin.getUsername());
		if(password!=null && password.equals(admin.getPassword())){
			return true;
		}else{
			return false;
		}
		
	}
	
	public boolean register() {
		return false;
	}
}
