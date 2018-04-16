package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Arrange;
import com.pan.competition.bean.Match;
import com.pan.competition.util.DBUtil;

public class MatchDao {
	
	public int addMatch(int apply_event_id,int stage_id){
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "insert into `match` set apply_event_id=?,stage_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, apply_event_id);
			pstmt.setInt(2, stage_id);
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int removeMatch(int apply_event_id,int stage_id) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "delete from `match` where apply_event_id=? and stage_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, apply_event_id);
			pstmt.setInt(2, stage_id);
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public List<Arrange> getMatchArrangeList(int stage_id) {
		List<Arrange> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "SELECT `match_id`,`apply_event_id` ,`order` FROM `match` WHERE stage_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stage_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Arrange arrange = new Arrange();
				String match_id = rs.getString("match_id");
				arrange.setMatch_id(match_id);
				arrange.setOrder(rs.getString("order"));
				int apply_event_id = rs.getInt("apply_event_id");
				sql = "SELECT apply.`apply_name` as apply_name, delegation.`name` as delegation_name FROM apply,delegation  WHERE delegation.`delegation_id`=apply.`delegation_id` AND apply.`apply_event_id` = ?";
				PreparedStatement pStatement = con.prepareStatement(sql);
				pStatement.setInt(1, apply_event_id);
				ResultSet ewSet = pStatement.executeQuery();
				if(ewSet.next()) {
					arrange.setApply_name(ewSet.getString("apply_name"));
					arrange.setDelegation_name(ewSet.getString("delegation_name"));
				}
				pStatement.close();
				sql = "SELECT `group`.`group_num` FROM `match_group`,`group` WHERE `match_id` = ? AND `match_group`.`group_id` = `group`.`group_id`";
				pStatement = con.prepareStatement(sql);
				pStatement.setInt(1, Integer.parseInt(match_id));
				ewSet = pStatement.executeQuery();
				if(ewSet.next()) {
					arrange.setGroup_num(ewSet.getString("group_num"));
				}
				list.add(arrange);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	public List<Arrange> getMatchArrangeOrderList(int stage_id) {
		List<Arrange> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "SELECT `match`.`match_id`,`match`.`apply_event_id` ,`match`.`order` ,`group`.`group_num`as group_num FROM `match`,`match_group`,`group` WHERE `match`.`stage_id`= ?" + 
					" AND `match`.`match_id`= `match_group`.`match_id` AND `match_group`.`group_id`=`group`.`group_id` order by group_num";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stage_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Arrange arrange = new Arrange();
				String match_id = rs.getString("match_id");
				arrange.setMatch_id(match_id);
				arrange.setOrder(rs.getString("order"));
				arrange.setGroup_num(rs.getString("group_num"));
				int apply_event_id = rs.getInt("apply_event_id");
				sql = "SELECT apply.`apply_name` as apply_name, delegation.`name` as delegation_name FROM apply,delegation  WHERE delegation.`delegation_id`=apply.`delegation_id` AND apply.`apply_event_id` = ?";
				PreparedStatement pStatement = con.prepareStatement(sql);
				pStatement.setInt(1, apply_event_id);
				ResultSet ewSet = pStatement.executeQuery();
				if(ewSet.next()) {
					arrange.setApply_name(ewSet.getString("apply_name"));
					arrange.setDelegation_name(ewSet.getString("delegation_name"));
				}
				pStatement.close();
				list.add(arrange);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	public int addMatchOrder(String match_id,String order) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "update match set order=? where match_is = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(order));
			pstmt.setInt(2, Integer.parseInt(match_id));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int addMatchGroup(String match_id,String group_id) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "insert into `match_group` set match_id =? ,group_id =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(match_id));
			pstmt.setInt(2, Integer.parseInt(group_id));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int updateMatchGroup(String match_id,String group_id) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "update `match_group` set group_id =? where match_id =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(group_id));
			pstmt.setInt(2, Integer.parseInt(match_id));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public boolean isExistMatchGroup(String match_id) {
		Connection con = null;
		boolean result = false;
		try {
			con = DBUtil.getCon();
			String sql = "select match_id from `match_group` where match_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(match_id));
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) 
				result = true;
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
}
