package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.ApplyReport;
import com.pan.competition.bean.OrderReport;
import com.pan.competition.util.DBUtil;

public class ReportDao {
	
	public static void main(String[] args) {
		ReportDao reportDao = new ReportDao();
		List<OrderReport> applyReports = reportDao.getOrderReport("1");
		System.out.println(applyReports);
	}
	
	public List<OrderReport> getOrderReport(String stage_id){
		List<OrderReport> list = new ArrayList<>();
		
		return list;		
	}
	
	public List<ApplyReport> getDelegationApplyReport(String delegation_id) {
		List<ApplyReport> list = new ArrayList<>();
		Connection con = null;
		try {
			String sql = "select name from delegation where delegation_id = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(delegation_id));
			ResultSet rs = pstmt.executeQuery();
			String delegation_name = null;
			if(rs.next()) {
				delegation_name = rs.getString("name");
			}
			rs.close();
			pstmt.close();
			
			sql = "select `apply_name`,`remark`,`athlets`,event_id FROM `apply` WHERE `delegation_id`=? order by event_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(delegation_id));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ApplyReport applyReport = new ApplyReport();
				applyReport.setDelegation_name(delegation_name);
				applyReport.setAthlets(getAthletNames(rs.getString("athlets")));
				applyReport.setRemark(rs.getString("remark"));
				applyReport.setApply_name(rs.getString("apply_name"));
				int event_id = rs.getInt("event_id");
				
				sql = "select name from event where event_id = ?";
				PreparedStatement pStatement = con.prepareStatement(sql);
				pStatement.setInt(1, event_id);
				ResultSet resultSet = pStatement.executeQuery();
				if(resultSet.next()) {
					applyReport.setEvent_name(resultSet.getString("name"));
				}
				list.add(applyReport);
				resultSet.close();
				pStatement.close();
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	public List<ApplyReport> getEventApplyReport(String event_id) {
		List<ApplyReport> list = new ArrayList<>();
		Connection con = null;
		try {
			String sql = "select name from event where event_id = ?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			ResultSet rs = pstmt.executeQuery();
			String event_name=null;
			if(rs.next()) {
				event_name = rs.getString("name");
			}
			rs.close();
			sql = "SELECT `apply_name`,`remark`,`athlets`,delegation_id FROM `apply` WHERE `event_id`=? order by delegation_id";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ApplyReport applyReport = new ApplyReport();
				applyReport.setApply_name(rs.getString("apply_name"));
				applyReport.setRemark(rs.getString("remark"));
				String athlets = rs.getString("athlets");
				applyReport.setEvent_name(event_name);
				int delegation_id = rs.getInt("delegation_id");
				//设置参赛运动员姓名
				applyReport.setAthlets(getAthletNames(athlets));
				
				//查询代表团名称
				sql = "select name from delegation where delegation_id = ?";
				PreparedStatement pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, delegation_id);
				ResultSet resultSet = pstmt2.executeQuery();
				if(resultSet.next()){
					applyReport.setDelegation_name(resultSet.getString("name"));
				}
				resultSet.close();
				pstmt2.close();

				list.add(applyReport);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	private String getAthletNames(String athletIds) {
		Connection con = null;
		StringBuilder athletNames = new StringBuilder();
		try {
			StringBuilder stringBuilder = new StringBuilder();
			for(String athlet_id : athletIds.split(",")) {
				stringBuilder.append("`athlet_id`="+athlet_id+" or ");
			}
			stringBuilder.delete(stringBuilder.length()-3, stringBuilder.length());
			String sql = "SELECT `name` FROM athlet where "+stringBuilder.toString();
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				athletNames.append(rs.getString("name")+",");
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		athletNames.delete(athletNames.length()-1, athletNames.length());
		return athletNames.toString();
	}
	
}
