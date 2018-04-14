package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Apply;
import com.pan.competition.util.DBUtil;

public class ApplyDao {
	
	public List<Apply> getApplyList(String event_id){
		List<Apply> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select * from apply where event_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()) {
				Apply apply = new Apply();
				apply.setId(rs.getString("apply_event_id"));
				apply.setAthlets(rs.getString("athlets"));
				apply.setApply_name(rs.getString("apply_name"));
				apply.setEvent_id(event_id);
				apply.setRemark(rs.getString("remark"));
				list.add(apply);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	public int addApply(Apply apply){
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "insert into apply set athlets = ?,event_id=?,apply_name=?,remark=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, apply.getAthlets());
			pstmt.setInt(2, Integer.parseInt(apply.getEvent_id()));
			pstmt.setString(3, apply.getApply_name());
			pstmt.setString(4, apply.getRemark());
		    result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
}
