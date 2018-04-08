package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Competition;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.util.DBUtil;
import com.pan.competition.util.DateUtil;

public class CompetitionDao {
	
	/**
	 * 添加赛事信息
	 * @param competition
	 * @return 返回添加结果
	 */
	public int addCompetition(Competition competition){
		Connection con = null;
	    int result = 0;
		try {
			String sql = "insert into competition (name,location,start_date,end_date,stadium,mascot,sponsor) values(?,?,?,?,?,?,?)";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, competition.getName());
			pstmt.setString(2, competition.getLocation());
			pstmt.setDate(3, DateUtil.stringToDate(competition.getStartDate()));
			pstmt.setDate(4,DateUtil.stringToDate(competition.getEndDate()));
			pstmt.setString(5, competition.getStadium());
			pstmt.setString(6, competition.getMascot());
			pstmt.setString(7, competition.getSponsor());
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	/**
	 * 查询数据库是否存在赛事名称为name
	 * @param name
	 * @return
	 */
	public boolean isExistCompetitionName(String name) {
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select name from competition";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(name.equals(rs.getString("name")))
					return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return false;
	}
	
	/**
	 *  查询数据库是否存在赛事名称为name,但并不是同一赛事
	 * @param name
	 * @param competition_id
	 * @return
	 */
	public boolean isExistCompetitionName(String name,String competition_id) {
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select name,competition_id from competition";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(name.equals(rs.getString("name"))&&!competition_id.equals(rs.getInt("competition_id")+""))
					return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return false;
	}
	
	/**
	 * 获取赛事信息列表
	 * @return
	 */
	public List<Competition> getCompetitionList(){
		List<Competition> list = new ArrayList<>();
		Connection con = null;
		try {
			String sql = "select competition_id,name,location,start_date,end_date,stadium,mascot,sponsor from competition";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Competition competition = new Competition();
				competition.setId(rs.getInt("competition_id")+"");
				competition.setName(rs.getString("name"));
				competition.setLocation(rs.getString("location"));
				competition.setStartDate(rs.getDate("start_date").toString());
				competition.setEndDate(rs.getDate("end_date").toString());
				competition.setStadium(rs.getString("stadium"));
				competition.setMascot(rs.getString("mascot"));
				competition.setSponsor(rs.getString("sponsor"));
				list.add(competition);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	/**
	 * 获取所有赛事的名称和id
	 * @return
	 */
	public List<MenuItem> getCompetitionNameList(){
		List<MenuItem> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select competition_id,name from competition";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuItem item = new MenuItem();
				item.setId(rs.getInt("competition_id")+"");
				item.setName(rs.getString("name"));
				list.add(item);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	/**
	 * 修改赛事信息
	 * @param competition
	 * @return
	 */
	public int updateCompetition(Competition competition) {
		Connection con =null;
		int result = 0;
		try {
			con = DBUtil.getCon();
			String sql = "update competition set name = ?,location =?,start_date=?,end_date=?,stadium=?,mascot=?,sponsor=? where competition_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, competition.getName());
			pstmt.setString(2, competition.getLocation());
			pstmt.setDate(3, DateUtil.stringToDate(competition.getStartDate()));
			pstmt.setDate(4,DateUtil.stringToDate(competition.getEndDate()));
			pstmt.setString(5, competition.getStadium());
			pstmt.setString(6, competition.getMascot());
			pstmt.setString(7, competition.getSponsor());
			pstmt.setInt(8, Integer.parseInt(competition.getId()));
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
}
