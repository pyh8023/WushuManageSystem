package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Delegation;
import com.pan.competition.bean.MenuItem;
import com.pan.competition.util.DBUtil;

public class DelegationDao {
	
	/**
	 * 添加代表团
	 * @param delegation
	 * @return
	 */
	public int addDelegation(Delegation delegation) {
		Connection con = null;
		int result = 0;
		try {
			con = DBUtil.getCon();
			String sql = "insert into delegation set name = ?,location = ?,athlet_num = ?,phone = ? ,competition_id = ?,introduction=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delegation.getName());
			pstmt.setString(2, delegation.getProvince()+","+delegation.getCity()+","+delegation.getDistrict());
			pstmt.setInt(3, Integer.parseInt(delegation.getAthlet_num()));
			pstmt.setString(4,delegation.getPhone());
			pstmt.setInt(5, Integer.parseInt(delegation.getCompetition_id()));
			pstmt.setString(6, delegation.getIntroduction());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	/**
	 * 查询数据库是否存在代表团名称为name
	 * @param name
	 * @return
	 */
	public boolean isExistDelegationName(String name,String competition_id) {
		Connection con = null;
		boolean result = false;
		try {
			con = DBUtil.getCon();
			String sql = "select name from delegation where name = ? and competition_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.parseInt(competition_id));
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
	
	/**
	 * 查询数据库是否存在代表团名称为name
	 * @param name
	 * @return
	 */
	public boolean isExistDelegationName(String name,String competition_id,String delegation_id) {
		Connection con = null;
		boolean result = false;
		try {
			con = DBUtil.getCon();
			String sql = "select delegation_id from delegation where name = ? and competition_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.parseInt(competition_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(!(Integer.parseInt(delegation_id) == rs.getInt("delegation_id")))
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
	
	/**
	 * 修改代表团信息
	 * @param delegation
	 * @return
	 */
	public int updateDelegation(Delegation delegation) {
		Connection con = null;
		int result = 0;
		try {
			con = DBUtil.getCon();
			String sql = "update delegation set name = ?,location = ?,athlet_num = ?,phone = ? ,competition_id = ?,introduction=? where delegation_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delegation.getName());
			pstmt.setString(2, delegation.getProvince()+","+delegation.getCity()+","+delegation.getDistrict());
			pstmt.setInt(3, Integer.parseInt(delegation.getAthlet_num()));
			pstmt.setString(4,delegation.getPhone());
			pstmt.setInt(5, Integer.parseInt(delegation.getCompetition_id()));
			pstmt.setString(6, delegation.getIntroduction());
			pstmt.setInt(7, Integer.parseInt(delegation.getIntroduction()));
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
	 * 删除代表团
	 * @param id
	 * @return
	 */
	public int removeDelegation(String delegation_id) {
		Connection con = null;
		int result = 0;
		try {
			con = DBUtil.getCon();
			String sql = "delete from delegation where delegation_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delegation_id);
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
	 * 获取所有代表团信息
	 * @param competition_id
	 * @return
	 */
	public List<Delegation> getDelegationList(String competition_id){
		List<Delegation> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select * from delegation where competition_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, competition_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Delegation delegation = new Delegation();
				delegation.setId(rs.getInt("delegation_id")+"");
				delegation.setName(rs.getString("name"));
				String[] location = rs.getString("location").split(",");
				delegation.setProvince(location[0]);
				delegation.setCity(location[1]);
				if(location.length==3) {
					delegation.setDistrict(location[2]);
				}else {
					delegation.setDistrict("");
				}
				delegation.setPhone(rs.getString("phone"));
				delegation.setAthlet_num(rs.getInt("athlet_num")+"");
				delegation.setCompetition_id(competition_id);
				delegation.setIntroduction(rs.getString("introduction"));
				list.add(delegation);
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
	 * 获取所有代表团的名称和id
	 * @param competition_id
	 * @return
	 */
	public List<MenuItem> getDelegationNameList(String competition_id){
		List<MenuItem> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select delegation_id,name from delegation where competition_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, competition_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuItem menuItem = new MenuItem();
				menuItem.setId(rs.getInt("delegation_id")+"");
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
	 * 根据id获取代表团信息
	 * @param id
	 * @return
	 */
	public Delegation getDelegationById(String delegation_id) {
		Delegation delegation = null;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select * from delegation where delegation_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delegation_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				delegation = new Delegation();
				delegation.setId(delegation_id);
				delegation.setName(rs.getString("name"));
				String[] location = rs.getString("location").split(",");
				delegation.setProvince(location[0]);
				delegation.setCity(location[1]);
				if(location.length==3) {
					delegation.setDistrict(location[2]);
				}else {
					delegation.setDistrict("");
				}
				delegation.setPhone(rs.getString("phone"));
				delegation.setAthlet_num(rs.getInt("athlet_num")+"");
				delegation.setCompetition_id(rs.getInt("comepetition_id")+"");
				delegation.setIntroduction(rs.getString("introduction"));
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return delegation;
	}
}
