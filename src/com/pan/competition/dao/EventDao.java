package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Event;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.config.Constant;
import com.pan.competition.util.DBUtil;

public class EventDao {
	
	/**
	 * 获取所有比赛项目
	 * @param competition_id
	 * @return
	 */
	public List<Event> getEventList(String competition_id){
		List<Event> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select event_id,name,event_num,event_type,event_group,event_sex,max_athlet_num,min_athlet_num,min_female_num,max_female_num,min_male_num,max_male_num from event where competition_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(competition_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Event event = new Event();
				event.setId(rs.getString("event_id"));
				event.setName(rs.getString("name"));
				event.setEvent_num(rs.getString("event_num"));
				event.setType(rs.getString("event_type"));
				event.setEvent_group(rs.getString("event_group"));
				event.setSex(rs.getString("event_sex"));
				event.setMax_athlet_num(rs.getString("max_athlet_num"));
				event.setMin_athlet_num(rs.getString("min_athlet_num"));
				event.setMax_female_num(rs.getString("max_female_num"));
				event.setMin_female_num(rs.getString("min_female_num"));
				event.setMax_male_num(rs.getString("max_male_num"));
				event.setMin_male_num(rs.getString("min_male_num"));
				event.setCompetition_id(competition_id);
				list.add(event);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	/**
	 * 添加比赛项目
	 * @param event
	 * @return
	 */
	public int addEvent(Event event) {
		Connection con = null;
		int result = 0;
		try {
			con = DBUtil.getCon();
			String sql = "insert into event (name,event_num,event_type,event_group,event_sex,max_athlet_num,min_athlet_num,min_female_num,max_female_num,min_male_num,max_male_num,competition_id) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, event.getName());
			pstmt.setString(2, event.getEvent_num());
			pstmt.setString(3, event.getType());
			pstmt.setString(4, event.getEvent_group());
			pstmt.setString(5, event.getSex());
			pstmt.setInt(6, Integer.parseInt(event.getMax_athlet_num()));
			pstmt.setInt(7, Integer.parseInt(event.getMin_athlet_num()));
			pstmt.setInt(8, Integer.parseInt(event.getMin_female_num()));
			pstmt.setInt(9, Integer.parseInt(event.getMax_female_num()));
			pstmt.setInt(10, Integer.parseInt(event.getMin_male_num()));
			pstmt.setInt(11, Integer.parseInt(event.getMax_male_num()));
			pstmt.setInt(12, Integer.parseInt(event.getCompetition_id()));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	

	/**
	 * 查询是否存在另一个项目名称或者项目编号相同
	 * @param name
	 * @param competition_id
	 * @param event_id
	 * @return
	 */
	public String isExistEvent(String name,String num,String competition_id,String event_id) {
		Connection con = null;
		String result = Constant.NOT_EXISTED;
		try {
			con = DBUtil.getCon();
			String sql = "select event_id,name,event_num from event where competition_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(competition_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(name.equals(rs.getString("name")) && !event_id.equals(rs.getInt("event_id")+""))
					result = Constant.EVENT_NAME_IS_EXISTED;
				else if(num.equals(rs.getString("event_num")) && !event_id.equals(rs.getInt("event_id")+""))
					result = Constant.EVENT_NUM_IS_EXISTED;
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	/**
	 * 查询是否存在另一个项目名称或者项目编号相同
	 * @param num
	 * @return
	 */
	public String isExistEvent(String name,String num,String competition_id) {
		Connection con = null;
		String result = Constant.NOT_EXISTED;
		try {
			con = DBUtil.getCon();
			String sql = "select event_num,name from event where competition_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, competition_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(name.equals(rs.getString("name")))
					result = Constant.EVENT_NAME_IS_EXISTED;
				else if(num.equals(rs.getString("event_num")))
					result = Constant.EVENT_NUM_IS_EXISTED;
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	/**
	 * 获取指定赛事下所有项目的名称和id
	 * @param competition_id
	 * @return
	 */
	public List<MenuItem> getEventNameList(String competition_id){
		List<MenuItem> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select event_id,name from event where competition_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(competition_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuItem menuItem = new MenuItem();
				menuItem.setId(rs.getInt("event_id")+"");
				menuItem.setName(rs.getString("name"));
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
	
	/**
	 * 修改项目信息
	 * @param event
	 * @return
	 */
	public int updateEvent(Event event) {
		Connection con = null;
		int result = 0;
		try {
			con = DBUtil.getCon();
			String sql = "update event set name = ?,event_type=?,event_group=?,event_sex=?,max_athlet_num=?,min_athlet_num=?,min_female_num=?,max_female_num=?,min_male_num=?,max_male_num=? where event_id = ? ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, event.getName());
			pstmt.setString(2, event.getType());
			pstmt.setString(3, event.getEvent_group());
			pstmt.setString(4, event.getSex());
			pstmt.setInt(5, Integer.parseInt(event.getMax_athlet_num()));
			pstmt.setInt(6, Integer.parseInt(event.getMin_athlet_num()));
			pstmt.setInt(7, Integer.parseInt(event.getMin_female_num()));
			pstmt.setInt(8, Integer.parseInt(event.getMax_female_num()));
			pstmt.setInt(9, Integer.parseInt(event.getMin_male_num()));
			pstmt.setInt(10, Integer.parseInt(event.getMax_male_num()));
			pstmt.setInt(11, Integer.parseInt(event.getId()));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	/**
	 * 删除项目
	 * @param event_id
	 * @return
	 */
	public int removeEvent(String event_id) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "delete from event where event_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public Event getEventById(String event_id) {
		Event event = null;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select * from event where event_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				event = new Event();
				event.setId(event_id);
				event.setName(rs.getString("name"));
				event.setEvent_num(rs.getString("event_num"));
				event.setType(rs.getString("event_type"));
				event.setEvent_group(rs.getString("event_group"));
				event.setSex(rs.getString("event_sex"));
				event.setMax_athlet_num(rs.getString("max_athlet_num"));
				event.setMin_athlet_num(rs.getString("min_athlet_num"));
				event.setMax_female_num(rs.getString("max_female_num"));
				event.setMin_female_num(rs.getString("min_female_num"));
				event.setMax_male_num(rs.getString("max_male_num"));
				event.setMin_male_num(rs.getString("min_male_num"));
				event.setCompetition_id(rs.getInt("competition_id")+"");
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return event;
	}
}
