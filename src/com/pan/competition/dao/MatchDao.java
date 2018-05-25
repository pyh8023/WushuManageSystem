package com.pan.competition.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pan.competition.bean.Arrange;
import com.pan.competition.bean.Grade;
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
			String sql = "SELECT `match_id`,`apply_event_id` ,`order`,`group_num` FROM `match` WHERE stage_id = ? order by group_num,`order`";
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
				/*sql = "SELECT `group`.`group_num` FROM `match_group`,`group` WHERE `match_id` = ? AND `match_group`.`group_id` = `group`.`group_id`";
				pStatement = con.prepareStatement(sql);
				pStatement.setInt(1, Integer.parseInt(match_id));
				ewSet = pStatement.executeQuery();
				if(ewSet.next()) {
					arrange.setGroup_num(ewSet.getString("group_num"));
				}*/
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
	
	public List<String> getMatchIdList(String stage_id, String group_num) {
		List<String> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "SELECT `match_id` FROM `match` WHERE stage_id = ? and group_num = ? order by group_num,`order`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id) );
			pstmt.setInt(2, Integer.parseInt(group_num));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("match_id"));
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	public List<Grade> getGradeList(String stage_id,int group_num) {
		List<Grade> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql;
			if(group_num == 0)
				sql = "SELECT * FROM `match` WHERE stage_id = ? order by group_num,`order`";
			else
				sql = "SELECT * FROM `match` WHERE stage_id = ? and group_num = ? order by group_num,`order`";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			if(group_num!=0)
				pstmt.setInt(2, group_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Grade grade = new Grade();
				String match_id = rs.getString("match_id");
				grade.setMatch_id(match_id);
				grade.setGroup_num(rs.getString("group_num"));
				String gradeA = rs.getString("gradeA");
				if(gradeA.equals("-1"))
					grade.setGradeA("");
				else
					grade.setGradeA(gradeA);
				String gradeB = rs.getString("gradeB");
				if(gradeB.equals("-1"))
					grade.setGradeB("");
				else
					grade.setGradeB(gradeB);
				String gradeC = rs.getString("gradeC");
				if(gradeC.equals("-1"))
					grade.setGradeC("");
				else
					grade.setGradeC(gradeC);
				grade.setCoach_grade(rs.getString("coach_grade"));
				String total_points = rs.getString("total_points");
				if(total_points.equals("-1"))
					grade.setTotal_points("");
				else
					grade.setTotal_points(total_points);
				grade.setRanking(rs.getString("ranking"));
				grade.setIs_promoted(rs.getString("is_promoted"));
				grade.setOrder(rs.getString("order"));
				int apply_event_id = rs.getInt("apply_event_id");
				sql = "SELECT apply.`apply_name` as apply_name, delegation.`name` as delegation_name FROM apply,delegation  WHERE delegation.`delegation_id`=apply.`delegation_id` AND apply.`apply_event_id` = ?";
				PreparedStatement pStatement = con.prepareStatement(sql);
				pStatement.setInt(1, apply_event_id);
				ResultSet ewSet = pStatement.executeQuery();
				if(ewSet.next()) {
					grade.setApply_name(ewSet.getString("apply_name"));
					grade.setDelegation_name(ewSet.getString("delegation_name"));
				}
				pStatement.close();
				list.add(grade);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	public List<Grade> getGradeListOrderByRanking(String stage_id,int group_num) {
		List<Grade> list = new ArrayList<>();
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql;
			if(group_num == 0)
				sql = "SELECT * FROM `match` WHERE stage_id = ? order by total_points is null, total_points desc,ranking is null, ranking asc";
			else
				sql = "SELECT * FROM `match` WHERE stage_id = ? and group_num = ? order by total_points is null, total_points desc,ranking is null, ranking asc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stage_id));
			if(group_num != 0)
				pstmt.setInt(2, group_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Grade grade = new Grade();
				String match_id = rs.getString("match_id");
				grade.setMatch_id(match_id);
				grade.setGroup_num(rs.getString("group_num"));
				String gradeA = rs.getString("gradeA");
				if(gradeA.equals("-1"))
					grade.setGradeA("");
				else
					grade.setGradeA(gradeA);
				String gradeB = rs.getString("gradeB");
				if(gradeB.equals("-1"))
					grade.setGradeB("");
				else
					grade.setGradeB(gradeB);
				String gradeC = rs.getString("gradeC");
				if(gradeC.equals("-1"))
					grade.setGradeC("");
				else
					grade.setGradeC(gradeC);
				grade.setCoach_grade(rs.getString("coach_grade"));
				String total_points = rs.getString("total_points");
				if(total_points.equals("-1"))
					grade.setTotal_points("");
				else
					grade.setTotal_points(total_points);
				grade.setOrder(rs.getString("order"));
				grade.setRanking(rs.getString("ranking"));
				grade.setIs_promoted(rs.getString("is_promoted"));
				int apply_event_id = rs.getInt("apply_event_id");
				sql = "SELECT apply.`apply_name` as apply_name, delegation.`name` as delegation_name FROM apply,delegation  WHERE delegation.`delegation_id`=apply.`delegation_id` AND apply.`apply_event_id` = ?";
				PreparedStatement pStatement = con.prepareStatement(sql);
				pStatement.setInt(1, apply_event_id);
				ResultSet ewSet = pStatement.executeQuery();
				if(ewSet.next()) {
					grade.setApply_name(ewSet.getString("apply_name"));
					grade.setDelegation_name(ewSet.getString("delegation_name"));
				}
				pStatement.close();
				list.add(grade);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return list;
	}
	
	public int updateMatchArrange(Arrange arrange) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = null;
			PreparedStatement pstmt = null;
			if(arrange.getOrder() ==null || arrange.getOrder().equals("")) {
				sql = "UPDATE `match` SET group_num = ?,`order`=null WHERE match_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(arrange.getGroup_num()));
				pstmt.setInt(2, Integer.parseInt(arrange.getMatch_id()));
			}else {
				sql = "UPDATE `match` SET `order`= ?, group_num = ? WHERE match_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(arrange.getOrder()));
				pstmt.setInt(2, Integer.parseInt(arrange.getGroup_num()));
				pstmt.setInt(3, Integer.parseInt(arrange.getMatch_id()));
			}
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int updateMatchOrder(String match_id,int order) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "UPDATE `match` SET `order`= ? WHERE match_id = ? ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order);
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
	
	public int updateGrade(Grade grade) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "UPDATE `match` SET `gradeA`=? ,`gradeB`=?,`gradeC`=?,`total_points`=? ,`coach_grade`= ?,`ranking`= ?  WHERE `match_id`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			if(grade.getGradeA().equals(""))
				pstmt.setFloat(1, -1);
			else
				pstmt.setFloat(1, Float.parseFloat(grade.getGradeA()));
			if(grade.getGradeB().equals(""))
				pstmt.setFloat(2, -1);
			else
				pstmt.setFloat(2, Float.parseFloat(grade.getGradeB()));
			if(grade.getGradeC().equals(""))
				pstmt.setFloat(3, -1);
			else
				pstmt.setFloat(3, Float.parseFloat(grade.getGradeC()));
			if(grade.getTotal_points().equals(""))
				pstmt.setFloat(4, -1);
			else
				pstmt.setFloat(4, Float.parseFloat(grade.getTotal_points()));
			if(grade.getCoach_grade().equals(""))
				pstmt.setObject(5, null);
			else
				pstmt.setFloat(5, Float.parseFloat(grade.getCoach_grade()));
			if(grade.getRanking().equals(""))
				pstmt.setObject(6, null);
			else
				pstmt.setFloat(6, Float.parseFloat(grade.getRanking()));
			pstmt.setInt(7, Integer.parseInt(grade.getMatch_id()));
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int setPromoted(String match_id,String event_id) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "UPDATE `match` SET `is_promoted`=true  WHERE `match_id`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(match_id));
			result = pstmt.executeUpdate();
			pstmt.close();
			if(result == 1) {
				sql = "select apply_event_id,stage_id from `match` where `match_id`=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(match_id));
				ResultSet rs = pstmt.executeQuery();
				int apply_event_id = 0,stage_id = 0;
				if(rs.next()) {
					apply_event_id = rs.getInt("apply_event_id");
					stage_id = rs.getInt("stage_id");
				}
				pstmt.close();
				sql = "SELECT stage_id FROM stage WHERE attribute =(SELECT MIN(attribute) FROM stage WHERE event_id = ? AND attribute > (SELECT attribute FROM stage WHERE stage_id = ?)) AND event_id= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(event_id));
				pstmt.setInt(2, stage_id);
				pstmt.setInt(3, Integer.parseInt(event_id));
				rs = pstmt.executeQuery();
				int stage_id2 = 0;
				if(rs.next()) {
					stage_id2 = rs.getInt("stage_id");
				}
				pstmt.close();
				sql = "insert into `match` set apply_event_id=?,stage_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,apply_event_id);
				pstmt.setInt(2, stage_id2);
				result = pstmt.executeUpdate();
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int canclePromoted(String match_id,String event_id) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "UPDATE `match` SET `is_promoted`=false  WHERE `match_id`=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(match_id));
			result = pstmt.executeUpdate();
			pstmt.close();
			if(result == 1) {
				sql = "select apply_event_id,stage_id from `match` where `match_id`=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(match_id));
				ResultSet rs = pstmt.executeQuery();
				int apply_event_id = 0,stage_id = 0;
				if(rs.next()) {
					apply_event_id = rs.getInt("apply_event_id");
					stage_id = rs.getInt("stage_id");
				}
				pstmt.close();
				sql = "SELECT stage_id FROM stage WHERE attribute =(SELECT MIN(attribute) FROM stage WHERE event_id = ? AND attribute > (SELECT attribute FROM stage WHERE stage_id = ?)) AND event_id= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(event_id));
				pstmt.setInt(2, stage_id);
				pstmt.setInt(3, Integer.parseInt(event_id));
				rs = pstmt.executeQuery();
				int stage_id2 = 0;
				if(rs.next()) {
					stage_id2 = rs.getInt("stage_id");
				}
				pstmt.close();
				sql = "delete from `match` where apply_event_id=? and stage_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,apply_event_id);
				pstmt.setInt(2, stage_id2);
				result = pstmt.executeUpdate();
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	/*public List<Arrange> getMatchArrangeOrderList(int stage_id) {
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
	}*/
	
	/*public int addMatchOrder(String match_id,String order) {
		int result = 0;
		Connection con = null;
		try {
			con = DBUtil.getCon();
			String sql = "update match set order=? where match_id = ?";
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
	}*/
	
	/*public int addMatchGroup(String match_id,String group_id) {
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
	}*/
	
	/*public int updateMatchGroup(String match_id,String group_id) {
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
	}*/
	
	/*public boolean isExistMatchGroup(String match_id) {
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
	}*/
}
