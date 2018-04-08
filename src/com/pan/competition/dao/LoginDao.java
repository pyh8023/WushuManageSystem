package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.pan.competition.util.DBUtil;

public class LoginDao {
	
	DBUtil dbcon = new DBUtil();
	
	public static String queryAdmin(String username){
		String password = null;
		Connection con = null;
		try {
			String sql = "select password from admin where username = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				password = rs.getString("password");
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				DBUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return password;
	}
	
	public static void main(String[] args) {
		System.out.println(queryAdmin("213"));
	}
	
}
