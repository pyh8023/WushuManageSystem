package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Athlet;
import com.pan.competition.util.DBUtil;

	
public class AthletDao {
	
	DBUtil dbcon = new DBUtil();
	
	
	public List<Athlet> queryAthlet(){
		List<Athlet> list = new ArrayList<Athlet>();
		Connection con = null;
		try {
			String sql = "select * from athlet";
			con = dbcon.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Athlet athlet = new Athlet();
				athlet.setId(rs.getInt("id"));
				athlet.setName(rs.getString("name"));
				athlet.setSex(rs.getString("sex"));
				athlet.setDelegation(rs.getInt("delegation"));
				athlet.setAge(rs.getInt("age"));
				list.add(athlet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
}
