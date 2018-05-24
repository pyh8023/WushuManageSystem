package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.pan.competition.bean.ApplyReport;
import com.pan.competition.bean.GradeReport;
import com.pan.competition.bean.IReport;
import com.pan.competition.bean.OrderReport;
import com.pan.competition.bean.RankingReport;
import com.pan.competition.util.DBUtil;

public class ReportDao {
	
	public List<RankingReport> getRankingReport(String event_id){
		List<RankingReport> list = new ArrayList<>();
		Connection con = null;
		try {
			String sql = "SELECT `ranking`,`apply_name`,`name`,`match`.`apply_event_id` FROM `match`,`apply`,`delegation` WHERE stage_id = (SELECT `stage_id` FROM `stage` WHERE `event_id`=? AND `attribute`= 9) AND `apply`.`delegation_id` = `delegation`.`delegation_id` AND `match`.`apply_event_id` = `apply`.`apply_event_id` ORDER BY ranking";
			con = DBUtil.getCon();
			String event_name = getEventNameByEventId(event_id);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("ranking")==null)
					continue;	
				RankingReport rankingReport = new RankingReport();
				rankingReport.setApply_name(rs.getString("apply_name"));
				rankingReport.setDelegation_name(rs.getString("name"));
				rankingReport.setRanking(rs.getString("ranking"));
				int apply_event_id = rs.getInt("apply_event_id");
				sql = "SELECT `name`,`total_points` FROM `stage`,`match` WHERE `stage`.`stage_id` = `match`.`stage_id` AND `apply_event_id`=? ORDER BY `stage`.`attribute`";
				PreparedStatement pStatement = con.prepareStatement(sql);
				pStatement.setInt(1, apply_event_id);
				ResultSet resultSet = pStatement.executeQuery();
				List<String> stage_name = new ArrayList<>();
				List<String> stage_grade = new ArrayList<>();
				while(resultSet.next()) {
					stage_name.add(resultSet.getString("name"));
					stage_grade.add(resultSet.getString("total_points"));
				}
				rankingReport.setStage_grade(stage_grade);
				rankingReport.setStage_name(stage_name);
				rankingReport.setReport_name(event_name+"名次表");
				list.add(rankingReport);
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
	
	private String getEventNameByEventId(String event_id) {
		String event_name = null;
		Connection con = null;
		try {
			String sql = "select name from event where event_id =?";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(event_id));
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				event_name = rs.getString("name");
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return event_name;		
	}
	
	private String getEventNameByStageId(String stage_id) {
		String event_name = null;
		Connection con = null;
		try {
			String sql = "select name from event where event_id = (select event_id from stage where stage_id =?)";
			con = DBUtil.getCon();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				event_name = rs.getString("name");
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return event_name;		
	}
	
	public List<GradeReport> getGradeReport(String stage_id){
		List<GradeReport> list = new ArrayList<>();
		Connection con = null;
		try {
			String sql = "SELECT `apply`.`apply_name`,`gradeA`,`gradeB`,`gradeC`,`coach_grade`,"
					+ "`total_points`,`is_promoted`,`ranking`,`delegation`.`name` AS delegation_name,`stage`.`name` AS stage_name FROM `match`"
					+ ",`apply`,`delegation`,`stage` WHERE `match`.`stage_id`=? AND `match`.`stage_id`=`stage`.`stage_id` AND `apply`.`apply_event_id` = `match`.`apply_event_id` "
					+ "AND `delegation`.`delegation_id` = `apply`.`delegation_id` order by `ranking`";
			con = DBUtil.getCon();
			String event_name = getEventNameByStageId(stage_id);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				GradeReport gradeReport = new GradeReport();
				gradeReport.setApply_name(rs.getString("apply_name"));
				gradeReport.setGradeA(rs.getString("gradeA"));
				gradeReport.setGradeB(rs.getString("gradeB"));
				gradeReport.setGradeC(rs.getString("gradeC"));
				gradeReport.setCoach_grade(rs.getString("coach_grade"));
				gradeReport.setTotal_points(rs.getString("total_points"));
				int is_promoted = rs.getInt("is_promoted");
				if(is_promoted == 1)
					gradeReport.setPromote("晋级");
				else
					gradeReport.setPromote("未晋级");
				gradeReport.setRanking(rs.getString("ranking"));
				gradeReport.setDelegation_name(rs.getString("delegation_name"));
				gradeReport.setReport_name((event_name+rs.getString("stage_name")+"成绩表"));
				list.add(gradeReport);
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
	
	public List<OrderReport> getOrderReport(String stage_id){
		List<OrderReport> list = new ArrayList<>();
		Connection con = null;
		try {
			String sql = "SELECT `apply`.`apply_name`,`order`,`group_num`"
					+ ",`delegation`.`name` AS delegation_name,`stage`.`name`"
					+ " AS stage_name FROM `match`,`apply`,`delegation`,`stage` "
					+ "WHERE `match`.`stage_id`=? AND `match`.`stage_id`=`stage`.`stage_id` "
					+ "AND `apply`.`apply_event_id` = `match`.`apply_event_id` AND "
					+ "`delegation`.`delegation_id` = `apply`.`delegation_id` ORDER BY `group_num`,`order`";
			con = DBUtil.getCon();
			String event_name = getEventNameByStageId(stage_id);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderReport orderReport = new OrderReport();
				orderReport.setApply_name(rs.getString("apply_name"));
				orderReport.setGroup_num("第"+rs.getInt("group_num")+"组");
				orderReport.setOrder(rs.getString("order"));
				orderReport.setDelegation_name(rs.getString("delegation_name"));
				orderReport.setReport_name(event_name+rs.getString("stage_name")+"秩序单");
				list.add(orderReport);
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
	
	public List<ApplyReport> getDelegationApplyReport(String delegation_id) {
		List<ApplyReport> list = new ArrayList<>();
		Connection con = null;
		try {
			//查询代表团名称
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
				applyReport.setReport_name(delegation_name+"报名表");
				applyReport.setAthlets(getAthletNames(rs.getString("athlets")));
				applyReport.setRemark(rs.getString("remark"));
				applyReport.setApply_name(rs.getString("apply_name"));
				int event_id = rs.getInt("event_id");
				//查询项目名称
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
				applyReport.setReport_name(event_name+"报名表");
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
