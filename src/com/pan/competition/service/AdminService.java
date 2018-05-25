package com.pan.competition.service;

import com.pan.competition.bean.Admin;
import com.pan.competition.bean.Message;
import com.pan.competition.config.Constant;
import com.pan.competition.dao.AdminDao;
import com.pan.competition.util.CodeUtil;
import com.pan.competition.util.MD5Util;
import com.pan.competition.util.MailUtil;

public class AdminService {
	
	private AdminDao adminDao = new AdminDao();
	
	public Message<String> login(Admin admin){
		Message<String> message;
		admin.setPassword(MD5Util.crypt(admin.getPassword()));
		System.out.println(admin.getPassword());
		String msg = adminDao.login(admin);
		if("登录成功".equals(msg)) 
			message = new Message<String>(Constant.QUERY_SUCCESS_RESPONSE_CODE, msg, "");
		else
			message = new Message<String>(Constant.QUERY_FAILED_RESPONSE_CODE, msg, "");
		return message;
	}
	
	public String register(Admin admin) {
		boolean isExisted = adminDao.isExistUsername(admin.getUsername());
		if(isExisted)
			return "用户名已存在";
		else {
			String code = CodeUtil.generateUniqueCode();
			admin.setCode(code);
			admin.setPassword(MD5Util.crypt(admin.getPassword()));
			boolean result = adminDao.register(admin);
			if(result) {
				MailUtil mailUtil = new MailUtil(admin.getEmail(), admin.getCode());
				new Thread(mailUtil).start();
				return "注册成功，请登录邮箱激活用户";
			}
			else
				return "注册失败";
		}
	}
	
	public boolean activeUser(String code) {
		return adminDao.activeUser(code);
	}
}
