package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Group;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.util.DBUtil;
import com.pan.competition.util.DateUtil;

public class GroupDao {
	
	public List<Group> getGroupList(String stage_id){
		List<Group> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select * from `group` where stage_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			ResultSet rs= pstmt.executeQuery();
			while(rs.next()) {
				Group group = new Group();
				group.setId(rs.getString("group_id"));
				group.setGroup_num(rs.getString("group_num"));
				group.setLocation(rs.getString("location"));
				String start_time = rs.getString("start_time");
				start_time = start_time.substring(0, start_time.length()-5);
				String end_time = rs.getString("end_time");
				end_time = end_time.substring(0, end_time.length()-5);
				group.setStart_time(start_time);
				group.setEnd_time(end_time);
				group.setStage_id(stage_id);
				list.add(group);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	public int removeGroup(String stage_id) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "delete from `group` where stage_id= ?";
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
	
	public int addGroup(Group group){
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "insert into `group` set group_num =?,location=?,start_time=?,end_time=?,stage_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(group.getGroup_num()));
			pstmt.setString(2, group.getLocation());
			pstmt.setTimestamp(3, DateUtil.stringToTimestamp(group.getStart_time()));
			pstmt.setTimestamp(4, DateUtil.stringToTimestamp(group.getEnd_time()));
			pstmt.setInt(5,Integer.parseInt(group.getStage_id()));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public boolean isExist(String stage_id,String group_num) {
		Connection con = null;
		boolean result = false;
		try {
			con = DBUtil.getCon();
			String sql = "select group_id from `group` where stage_id=? and group_num = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			pstmt.setInt(2,Integer.parseInt(group_num));
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public List<MenuItem> getGroupNumList(String stage_id){
		List<MenuItem> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select group_id,group_num from `group` where stage_id=? order by group_num";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuItem menuItem = new MenuItem();
				menuItem.setId(rs.getString("group_id"));
				menuItem.setName(rs.getString("group_num"));
				list.add(menuItem);
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
