package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pan.competition.bean.Admin;
import com.pan.competition.util.DBUtil;

public class AdminDao {
	
	public String login(Admin admin){
		Connection con = null;
		String result = null;
		try {
			String sql = "select password,status from admin where username = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, admin.getUsername());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String password = rs.getString("password");
				boolean status = rs.getBoolean("status");
				if(password.equals(admin.getPassword())) {
					if(status)
						result = "登录成功";
					else
						result = "用户未激活，请登录邮箱激活用户";
				}
				else 
					result = "密码错误";
			}else
				result = "用户不存在";
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public boolean isExistUsername(String username) {
		Connection con = null;
		boolean result = false;
		try {
			String sql = "select username from admin where username = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true;
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public boolean register(Admin admin) {
		Connection con = null;
		try {
			String sql = "insert into admin set username=? ,password=?,email=?,code=?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, admin.getUsername());
			pstmt.setString(2, admin.getPassword());
			pstmt.setString(3, admin.getEmail());
			pstmt.setString(4, admin.getCode());
			int i = pstmt.executeUpdate();
			pstmt.close();
			if(i ==1)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
		}
		return false;
	}
	
	public boolean activeUser(String code) {
		Connection con = null;
		try {
			String sql = "update admin set status = true where code=?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			int i = pstmt.executeUpdate();
			pstmt.close();
			if(i ==1)
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
		}
		return false;
	}
	
}
