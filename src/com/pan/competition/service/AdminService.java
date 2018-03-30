package com.pan.competition.service;

import com.pan.competition.bean.Admin;
import com.pan.competition.dao.AdminDao;

public class AdminService {
	
	public boolean login(Admin admin){
		AdminDao adminDao = new AdminDao();
		String password = adminDao.queryAdmin(admin.getUsername());
		if(password!=null && password.equals(admin.getPassword())){
			return true;
		}else{
			return false;
		}
		
	}
}
