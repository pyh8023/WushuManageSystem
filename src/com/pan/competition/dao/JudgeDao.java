package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Judge;
import com.pan.competition.util.DBUtil;

public class JudgeDao {
	
	public int addJudge(Judge judge) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "insert into `judge` set `name`=?,`sex`=?,`job`=?,`stage_id`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, judge.getName());
			pstmt.setString(2, judge.getSex());
			pstmt.setString(3, judge.getJob());
			pstmt.setInt(4, Integer.parseInt(judge.getStage_id()));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int removeJudge(String stage_id) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "delete from `judge` where `stage_id`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public List<Judge> getJudgeList(String stage_id){
		List<Judge> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select * from judge where stage_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Judge judge = new Judge();
				judge.setId(rs.getString("judge_id"));
				judge.setName(rs.getString("name"));
				judge.setSex(rs.getString("sex"));
				judge.setJob(rs.getString("job"));
				judge.setStage_id(rs.getString("stage_id"));
				list.add(judge);
			}
 			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
}
