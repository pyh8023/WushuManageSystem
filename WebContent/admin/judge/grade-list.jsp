<%@page import="java.util.ArrayList"%>
<%@page import="com.pan.competition.bean.*"%>
<%@page import="java.util.List"%>
<%@page import="com.pan.competition.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<%
	CompetitionService competitionService = new CompetitionService();
	List<MenuItem> competitionNames = competitionService.getCompetitionName();
	int isFinalStage = 0;
	String competition_id = null, event_id = null, stage_id = null,group_num = null;
	List<MenuItem> eventNames = null, stageNames = null,groupNames = null;
	List<Grade> gradeList = null;
	Cookie[] cookies = request.getCookies();
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("competition_id")) {
			competition_id = cookie.getValue();
		} else if (cookie.getName().equals("event_id")) {
			event_id = cookie.getValue();
		} else if (cookie.getName().equals("stage_id")) {
			stage_id = cookie.getValue();
		}else if (cookie.getName().equals("group_num")) {
			group_num = cookie.getValue();
		}
	}
	if (competitionNames.size() != 0) {
		if (competition_id == null || "null".equals(competition_id)) {
			competition_id = competitionNames.get(0).getId();
		}
		//获取项目列表
		EventService eventService = new EventService();
		eventNames = eventService.getEventNameList(competition_id).getData();
		if (eventNames.size() != 0) {
			if (event_id == null || "null".equals(event_id)) {
				event_id = eventNames.get(0).getId();
			}
			StageService stageService = new StageService();
			stageNames = stageService.getStageNameList(event_id).getData();
			if (stageNames.size() != 0) {
				if (stage_id == null || "null".equals(stage_id)) {
					stage_id = stageNames.get(0).getId();
				}
				MatchService matchService = new MatchService();
				groupNames = matchService.getGroupNameList(stage_id);
				if(groupNames.size() !=0){
					if (group_num == null || "null".equals(group_num)) {
						group_num = groupNames.get(0).getName();
					}
					String action = request.getParameter("action");
					if("ranking".equals(action))
						gradeList = matchService.getGradeListOrderByRanking(stage_id,group_num);
					else
						gradeList = matchService.getGradeList(stage_id,group_num);
					isFinalStage = stageService.isFinalStage(stage_id);
				}
			}
		}
	}
	request.setAttribute("competition_id", competition_id);
	request.setAttribute("event_id", event_id);
	request.setAttribute("stage_id", stage_id);
	request.setAttribute("group_num", group_num);
	request.setAttribute("isFinalStage", isFinalStage);
	if (eventNames == null)
		eventNames = new ArrayList<>();
	if (stageNames == null)
		stageNames = new ArrayList<>();
	if(gradeList == null)
		gradeList = new ArrayList<>();
	if(groupNames == null)
		groupNames = new ArrayList<>();
	request.setAttribute("gradeList", gradeList);
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>评分</title>

<!-- Bootstrap -->
<link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
<link href="/WushuManageSystem/css/table-simple.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!--导航条-->
	<nav class="navbar navbar-fixed-top navbar-inverse">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!--<a class="navbar-brand" href="#">武术赛事系统</a>-->
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="navbar-collapse collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!--<li><a href="index.html">首页</a></li>-->
				<li><a href="/WushuManageSystem/admin/index.jsp">首页<span
						class="sr-only">(current)</span></a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">赛事准备 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="/WushuManageSystem/admin/competition/competition-manage.jsp"
							target="_self">赛事管理</a></li>
						<li><a href="/WushuManageSystem/admin/apply.jsp">报名报项</a></li>
						<li><a
							href="/WushuManageSystem/admin/delegation/delegation-manage.jsp">代表团管理</a></li>
						<li><a href="/WushuManageSystem/admin/judge/judge-manage.jsp">裁判员管理</a></li>
					</ul></li>
				<li><a href="/WushuManageSystem/admin/competition-arrange.jsp">竞赛编排</a></li>
				<li class="active"><a
					href="/WushuManageSystem/admin/judge/grade-list.jsp">成绩处理</a></li>
				<li><a href="/WushuManageSystem/admin/print-report.jsp">报表生成</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
	         <li><a href="/WushuManageSystem/servlet/LoginServlet?action=logout" onclick="logout()">注销</a></li>
	      </ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<ol class="breadcrumb">
		<li><a href="/WushuManageSystem/admin/index.jsp">首页</a></li>
		<li><a href="#">成绩处理</a></li>
	</ol>

	<div
		class="container content  col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1">
		<form class="form-inline text-center">
			<div class="form-group form-inline">
				<label for="competition_name_select" class="control-label">赛事名称</label>
				&ensp; <select class="form-control" id="competition_name_select">
					<c:forEach var="competition" items="<%=competitionNames %>">
						<option value="${competition.id }">${competition.name }</option>
					</c:forEach>
				</select> &ensp;&ensp; <label for="event_name_select" class="control-label">比赛项目</label>&ensp;
				<select class="form-control" id="event_name_select">
					<c:forEach var="event" items="<%=eventNames %>">
						<option value="${event.id }">${event.name }</option>
					</c:forEach>
				</select>&ensp;&ensp; <label for="stage_name_select" class="control-label">比赛阶段</label>&ensp;
				<select class="form-control" id="stage_name_select">
					<c:forEach var="stage" items="<%=stageNames %>">
						<option value="${stage.id }">${stage.name }</option>
					</c:forEach>
				</select>
				&ensp;&ensp; <label for="group_name_select" class="control-label">比赛分组</label>&ensp;
				<select class="form-control" id="group_name_select">
					<c:forEach var="group" items="<%=groupNames %>">
						<option value="${group.name }">第${group.name }组</option>
					</c:forEach>
					<option value="0">所有组</option>
				</select>
			</div>
		</form>
		<hr />
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>序号</th>
					<!-- <th>分组</th> -->
					<th>报项名</th>
					<th>代表团</th>
					<th>动作质量得分</th>
					<th>难度得分</th>
					<th>演练水平得分</th>
					<th>裁判长</th>
					<th>总分</th>
					<th>名次</th>
					<th>晋级</th>
				</tr>
			</thead>
			<tbody id="grade_tb">
				<c:forEach var="grade" items="${gradeList }" varStatus="status">
					<tr id="${grade.match_id }">
						<%-- <td>${status.count }</td> --%>
						<%-- <td>${grade.group_num }</td> --%>
						 <td>${grade.order }</td>
						<td>${grade.apply_name }</td>
						<td>${grade.delegation_name }</td>
						<td><input type="number" class="form-control" value="${grade.gradeA }"/></td>
						<td><input type="number" class="form-control" value="${grade.gradeB }"/></td>
						<td><input type="number" class="form-control" value="${grade.gradeC }"/></td>
						<td><input type="number" class="form-control" value="${grade.coach_grade }"/></td>
						<td><input type="number" class="form-control" value="${grade.total_points }"/></td>
						<td><input type="number" class="form-control" value="${grade.ranking }"/></td>
						<td>
							<button class="btn btn-primary btn-xs <c:if test="${isFinalStage == 1 }">disabled</c:if>" onclick="promote_or_cancle(this)">
								<c:if test="${grade.is_promoted eq '0' }">未晋级</c:if>
								<c:if test="${grade.is_promoted != '0' }">晋级</c:if>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${gradeList.size()==0 }">
			<button class="btn btn-primary disabled">保存</button>
			<button class="btn btn-primary disabled">计算总分</button>
			<button class="btn btn-primary disabled">排名</button>
		</c:if>
		<c:if test="${gradeList.size()!=0 }">
			<button class="btn btn-primary" id="save_grade_btn">保存</button>
			<button class="btn btn-primary" id="count_total_points_btn">计算总分</button>
			<button class="btn btn-primary" id="ranking_btn">排名</button>
		</c:if>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/WushuManageSystem/js/bootstrap.min.js"></script>
	<script src="/WushuManageSystem/js/jquery.cookie.js"></script>
	<script type="text/javascript">
    
	   //设置select选中内容
		if("${competition_id}" != ""){
			$("#competition_name_select option[value='${competition_id}']").attr("selected",true);
		}
		if("${event_id}" != ""){
			$("#event_name_select option[value='${event_id}']").attr("selected",true);
		}
		if("${stage_id}" != ""){
			$("#stage_name_select option[value='${stage_id}']").attr("selected",true);
		}
		if("${group_num}" != ""){
			$("#group_name_select option[value='${group_num}']").attr("selected",true);
		}
    	
    	$("table input").parent().css("width","120px");
    	
    	$("#competition_name_select").change(function(){
    		$.cookie('competition_id', $(this).val());
        	$.cookie('event_id', null);
        	$.cookie('stage_id', null);
        	$.cookie('group_num', null);
        	window.location.reload();
    	});
    	
		$("#event_name_select").change(function(){
        	$.cookie('event_id', $(this).val());
        	$.cookie('stage_id', null);
        	$.cookie('group_num', null);
        	window.location.reload();
    	});
		
		$("#stage_name_select").change(function(){
        	$.cookie('stage_id', $(this).val());
        	$.cookie('group_num', null);
        	window.location.reload();
    	});
		
		$("#group_name_select").change(function(){
        	$.cookie('group_num', $(this).val());
        	window.location.reload();
    	});
		
		/* 保存成绩 */
		$("#save_grade_btn").click(function(){
			var json = "[";
			$("#grade_tb").children().each(function(){
				var id = $(this).attr("id");
				var gradeA = $(this).children().eq(3).children().eq(0).val();
				var gradeB = $(this).children().eq(4).children().eq(0).val();
				var gradeC = $(this).children().eq(5).children().eq(0).val();
				var coach_grade = $(this).children().eq(6).children().eq(0).val();
				var total_points = $(this).children().eq(7).children().eq(0).val();
				var ranking = $(this).children().eq(8).children().eq(0).val();
				json += '{"match_id":"'+id+'","gradeA":"'+gradeA+'","gradeB":"'+gradeB+'","gradeC":"'+gradeC
				+'","coach_grade":"'+coach_grade+'","total_points":"'+total_points+'","ranking":"'+ranking+'"},';
			});
			if(json == "[")
				json = "[]";
			else
				json = json.substring(0,json.length-1)+']';
			$.post("/WushuManageSystem/servlet/MatchServlet?action=saveGrade",{data:json},function(data){
				alert(data);
			});
		});
		
		/* 计算总分 */
		$("#count_total_points_btn").click(function(){
			$("#grade_tb").children().each(function(){
				var gradeA = $(this).children().eq(3).children().eq(0).val();
				var gradeB = $(this).children().eq(4).children().eq(0).val();
				var gradeC = $(this).children().eq(5).children().eq(0).val();
				var coach_grade = $(this).children().eq(6).children().eq(0).val();
				if(gradeA != "" && gradeB !="" && gradeC!="" && coach_grade!=""){
					var total_points = parseFloat(gradeA)+parseFloat(gradeB)+parseFloat(gradeC)+parseFloat(coach_grade);
					$(this).children().eq(7).children().eq(0).val(total_points.toFixed(2));
				}
			});
		});
		
		/* 排名 */
		$("#ranking_btn").click(function(){
			window.location.href = "/WushuManageSystem/admin/judge/grade-list.jsp?action=ranking";
		});
    	
    	function promote_or_cancle(arg){
    		var isPromoted;
    		var tr = $(arg).parent().parent();
    		var match_id = tr.attr("id");
       		var gradeA = tr.children().eq(3).children().eq(0).val();
   			var gradeB = tr.children().eq(4).children().eq(0).val();
   			var gradeC = tr.children().eq(5).children().eq(0).val();
   			var coach_grade =tr.children().eq(6).children().eq(0).val();
   			var total_points = tr.children().eq(7).children().eq(0).val();
   			var ranking = tr.children().eq(8).children().eq(0).val();
   			if(gradeA == "" || gradeB =="" || gradeC=="" || coach_grade==""||total_points==""||ranking==""){
   				alert("请将分数信息填写完整");
				return;
   			}
    		var btn_content = $.trim($(arg).html());
    		if(btn_content == "晋级")
    			isPromoted = "1";
    		else
    			isPromoted = "0";
    		$.post("/WushuManageSystem/servlet/MatchServlet?action=promote",{match_id:match_id,isPromoted:isPromoted,event_id:"${event_id}"},function(data){
    			alert(data);
    			window.location.reload();
			});
    	}
    </script>
</body>
</html>