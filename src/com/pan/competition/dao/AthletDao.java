package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Athlet;
import com.pan.competition.util.DBUtil;

	
public class AthletDao {
	
	public List<Athlet> getAthletList(String delegation_id){
		List<Athlet> list = new ArrayList<Athlet>();
		Connection con = null;
		try {
			String sql = "select * from athlet where delegation_id=?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(delegation_id));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Athlet athlet = new Athlet();
				athlet.setId(rs.getString("athlet_id"));
				athlet.setName(rs.getString("name"));
				athlet.setSex(rs.getString("sex"));
				athlet.setDelegation_id(delegation_id);
				athlet.setAge(rs.getString("age"));
				list.add(athlet);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	public Athlet getAthletById(String athlet_id) {
		Connection con = null;
		Athlet athlet = null;
		try {
			String sql = "select * from athlet where athlet_id = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(athlet_id));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				athlet = new Athlet();
				athlet.setId(rs.getString("athlet_id"));
				athlet.setName(rs.getString("name"));
				athlet.setSex(rs.getString("sex"));
				athlet.setDelegation_id(rs.getString("delegation_id"));
				athlet.setAge(rs.getString("age"));
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return athlet;
	}
	
	/*public boolean isExistAthletName(String name,String delegation_id) {
		boolean result = false;
		Connection con = null;
		try {
			String sql = "select athlet_id from athlet where name = ? and delegation_id = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.parseInt(delegation_id));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
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
	
	public boolean isExistAthletName(String name,String delegation_id,String athlet_id) {
		boolean result = false;
		Connection con = null;
		try {
			String sql = "select athlet_id from athlet where name = ? and delegation_id = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.parseInt(delegation_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(!athlet_id.equals(rs.getInt("athlet_id")))
					result = true;
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}*/
	
	public int updateAthlet(Athlet athlet) {
		Connection con = null;
		int result = 0;
		try {
			String sql = "update athlet set name=?,sex = ?,age=?  where athlet_id = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, athlet.getName());
			pstmt.setString(2, athlet.getSex());
			pstmt.setInt(3, Integer.parseInt(athlet.getAge()));
			pstmt.setInt(4, Integer.parseInt(athlet.getId()));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int removeAthlet(String athlet_id) {
		Connection con = null;
		int result = 0;
		try {
			String sql = "delete from athlet where athlet_id = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(athlet_id));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int addAthlet(Athlet athlet) {
		Connection con = null;
		int result = 0;
		try {
			String sql = "insert into athlet (name,sex,age,delegation_id) values(?,?,?,?)";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, athlet.getName());
			pstmt.setString(2, athlet.getSex());
			pstmt.setInt(3, Integer.parseInt(athlet.getAge()));
			pstmt.setInt(4, Integer.parseInt(athlet.getDelegation_id()));
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
