package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.MenuItem;
import com.pan.competition.bean.Stage;
import com.pan.competition.config.Constant;
import com.pan.competition.util.DBUtil;

public class StageDao {
	
	/**
	 * 获取指定项目的所有阶段
	 * @param event_id
	 * @return
	 */
	public List<Stage> getStageList(String event_id) {
		List<Stage> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select stage_id,name,stage_num,attribute from stage where event_id = ? order by attribute";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Stage stage = new Stage();
				stage.setId(rs.getInt("stage_id")+"");
				stage.setName(rs.getString("name"));
				stage.setStage_num(rs.getString("stage_num"));
				stage.setAttribute(rs.getString("attribute"));
				stage.setEvent_id(event_id);
				list.add(stage);
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
	 * 添加阶段信息
	 * @param stage
	 * @return
	 */
	public int addStage(Stage stage) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "insert into stage (name,stage_num,attribute,event_id) values(?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, stage.getName());
			pstmt.setString(2, stage.getStage_num());
			pstmt.setInt(3, Integer.parseInt(stage.getAttribute()));
			pstmt.setInt(4, Integer.parseInt(stage.getEvent_id()));
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
	 * 获取指定项目的所有阶段名称和ID
	 * @param event_id
	 * @return
	 */
	public List<MenuItem> getStageNameList(String event_id){
		List<MenuItem> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select stage_id,name from stage where event_id = ? order by attribute";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuItem item = new MenuItem();
				item.setId(rs.getInt("stage_id")+"");
				item.setName(rs.getString("name"));
				list.add(item);
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
	 * 删除指定比赛阶段
	 * @param stage_id
	 * @return
	 */
	public int removeStage(String event_id) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "delete from stage where event_id = ?";
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
	
	/**
	 * 查询阶段信息是否存在
	 * @param stage
	 * @return
	 */
	public String isExist(Stage stage) {
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "select name,stage_num,attribute from stage where event_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage.getEvent_id()));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("name").equals(stage.getName())) {
					return Constant.STAGE_NAME_IS_EXISTED;
				}else if(rs.getString("stage_num").equals(stage.getStage_num())) {
					return Constant.STAGE_NUM_IS_EXISTED;
				}else if(rs.getString("attribute").equals(stage.getAttribute())) {
					return Constant.STAGE_ATTRIBUTE_IS_EXISTED;
				}
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return Constant.NOT_EXISTED;
	}
	
	public boolean isFinalStage(String stage_id) {
		Connection con = null;
		boolean result = false;
		try {
			con = DBUtil.getCon();
			String sql = "select attribute from stage where stage_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt("attribute") == 9)
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
}
