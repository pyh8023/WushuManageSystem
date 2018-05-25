package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Apply;
import com.pan.competition.bean.Athlet;
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
			String sql = "insert into apply set athlets = ?,event_id=?,apply_name=?,remark=?,delegation_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, apply.getAthlets());
			pstmt.setInt(2, Integer.parseInt(apply.getEvent_id()));
			pstmt.setString(3, apply.getApply_name());
			pstmt.setString(4, apply.getRemark());
			pstmt.setInt(5, Integer.parseInt(apply.getDelegation_id()));
		    result = pstmt.executeUpdate();
			pstmt.close();
			for(String athlet_id : apply.getAthlets().split(",")) {
				sql = "insert into apply_event_athlet set event_id = ?,athlet_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(apply.getEvent_id()));
				pstmt.setInt(2, Integer.parseInt(athlet_id));
			    result = pstmt.executeUpdate();
				pstmt.close();
			}
			int apply_event_id = 0,stage_id=0;
			sql = "select max(apply_event_id) as id from apply";
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				apply_event_id = rs.getInt("id");
			}
			pstmt.close();
			sql = "SELECT stage_id FROM stage WHERE event_id = ? AND attribute = (SELECT MIN(attribute) FROM stage WHERE event_id = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(apply.getEvent_id()));
			pstmt.setInt(2, Integer.parseInt(apply.getEvent_id()));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				stage_id = rs.getInt("stage_id");
			}
			pstmt.close();
			MatchDao matchDao = new MatchDao();
			matchDao.addMatch(apply_event_id, stage_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public boolean removeApply(String apply_id) {
		Connection con = null;
		try {
			String sql = "select athlets,event_id from apply where apply_event_id = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(apply_id));
			ResultSet rs = pstmt.executeQuery();
			String athlets = null,event_id = "-1";
			if (rs.next()) {
				athlets = rs.getString("athlets");
				event_id = rs.getString("event_id");
			}
			pstmt.close();
			int stage_id = 0;
			sql = "SELECT stage_id FROM stage WHERE event_id = ? AND attribute = (SELECT MIN(attribute) FROM stage WHERE event_id = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			pstmt.setInt(2, Integer.parseInt(event_id));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				stage_id = rs.getInt("stage_id");
			}
			pstmt.close();
			MatchDao matchDao = new MatchDao();
			matchDao.removeMatch(Integer.parseInt(apply_id), stage_id);
			sql = "delete from apply where apply_event_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(apply_id));
			int result = pstmt.executeUpdate();
			pstmt.close();
			if(result == 1) {
				for(String athlet_id : athlets.split(",")) {
					sql = "delete from apply_event_athlet where athlet_id = ? and event_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(athlet_id));
					pstmt.setInt(2, Integer.parseInt(event_id));
					int i = pstmt.executeUpdate();
					pstmt.close();
					if(i != 1)
						return false;
				}
				return true;
			}
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return false;
	}
	
	public List<Athlet> getApplyAthletList(String delegation_id,String event_id){
		List<Athlet> list = new ArrayList<Athlet>();
		Connection con = null;
		try {
			String sql = "SELECT * FROM athlet WHERE athlet_id NOT IN (SELECT athlet_id FROM apply_event_athlet WHERE event_id=?) AND delegation_id = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			pstmt.setInt(2, Integer.parseInt(delegation_id));
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
	
	public int updateApply(Apply apply) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "update apply set apply_name = ?,remark = ? where apply_event_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, apply.getApply_name());
			pstmt.setString(2, apply.getRemark());
			pstmt.setInt(3, Integer.parseInt(apply.getId()));
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
