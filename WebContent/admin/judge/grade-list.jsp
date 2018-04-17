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
	String competition_id = null, event_id = null, stage_id = null;
	List<MenuItem> eventNames = null, stageNames = null;
	List<Grade> gradeList = null;
	Cookie[] cookies = request.getCookies();
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("competition_id")) {
			competition_id = cookie.getValue();
		} else if (cookie.getName().equals("event_id")) {
			event_id = cookie.getValue();
		} else if (cookie.getName().equals("stage_id")) {
			stage_id = cookie.getValue();
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
				gradeList = matchService.getGradeList(stage_id);
			}
		}
	}
	request.setAttribute("competition_id", competition_id);
	request.setAttribute("event_id", event_id);
	request.setAttribute("stage_id", stage_id);
	if (eventNames == null)
		eventNames = new ArrayList<>();
	if (stageNames == null)
		stageNames = new ArrayList<>();
	if(gradeList == null)
		gradeList = new ArrayList<>();
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
				<li><a href="/WushuManageSystem/index.jsp">首页<span
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
				<li><a href="/WushuManageSystem/admin/print-report.jsp">打印报表</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<ol class="breadcrumb">
		<li><a href="/WushuManageSystem/index.jsp">首页</a></li>
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
			</div>
		</form>
		<hr />
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>序号</th>
					<!-- <th>分组</th> -->
					<th>代表团</th>
					<th>报项名</th>
					<th>动作质量得分</th>
					<th>难度得分</th>
					<th>演练水平得分</th>
					<th>裁判长</th>
					<th>总分</th>
					<th>名次</th>
					<th>晋级</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="grade" items="${gradeList }" varStatus="status">
					<tr id="${grade.match_id }">
						<td>${status.count }</td>
						<%-- <td>${grade.group_num }</td> --%>
						<td>${grade.apply_name }</td>
						<td>${grade.delegation_name }</td>
						<td><input type="number" class="form-control" value="${grade.gradeA }"/></td>
						<td><input type="number" class="form-control" value="${grade.gradeB }"/></td>
						<td><input type="number" class="form-control" value="${grade.gradeC }"/></td>
						<td><input type="number" class="form-control" value="${grade.coach_grade }"/></td>
						<td><input type="number" class="form-control" value="${grade.total_points }"/></td>
						<td><input type="number" class="form-control" value="${grade.ranking }"/></td>
						<td>
							<button class="btn btn-primary btn-xs" onclick="promote_or_cancle(this)">
								<c:if test="${grade.is_promoted eq '0' }">未晋级</c:if>
								<c:if test="${grade.is_promoted != '0' }">晋级</c:if>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<button class="btn btn-primary" id="save_grade_btn">保存</button>
		<button class="btn btn-primary" id="count_total_points_btn">计算总分</button>
		<button class="btn btn-primary" id="ranking_btn">排名</button>
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
    	
    	$("table input").parent().css("width","120px");
    	
    	$("#competition_name_select").change(function(){
    		$.cookie('competition_id', $(this).val());
        	$.cookie('event_id', null);
        	$.cookie('stage_id', null);
        	window.location.reload();
    	});
    	
		$("#event_name_select").change(function(){
        	$.cookie('event_id', $(this).val());
        	$.cookie('stage_id', null);
        	window.location.reload();
    	});
		
		$("#stage_name_select").change(function(){
        	$.cookie('stage_id', $(this).val());
        	window.location.reload();
    	});
    	
    	function promote_or_cancle(arg){
    		if($(arg).html()=="晋级"){
    			$(arg).html("未晋级");
    		}else{
    			$(arg).html("晋级");
    		}
    	}
    </script>
</body>
</html>