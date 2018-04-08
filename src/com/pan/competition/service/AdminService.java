package com.pan.competition.service;

import com.pan.competition.bean.Admin;
import com.pan.competition.dao.AdminDao;

public class AdminService {
	
	public boolean login(Admin admin){
		AdminDao adminDao = new AdminDao();
		return adminDao.login(admin);
	}
}
