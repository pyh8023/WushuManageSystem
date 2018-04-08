package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.pan.competition.bean.Admin;
import com.pan.competition.util.DBUtil;

public class AdminDao {
	
	public boolean login(Admin admin){
		Connection con = null;
		try {
			String sql = "select username,password from admin";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String username = rs.getString("username");
				String password = rs.getString("password");
				if(username.equals(admin.getUsername())&& password.equals(admin.getPassword()))
					return true;
				else if(username.equals(admin.getUsername()))
					return false;
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
		}
		return false;
	}
}
