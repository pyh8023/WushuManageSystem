<%@page import="java.util.ArrayList"%>
<%@page import="com.pan.competition.bean.*"%>
<%@page import="java.util.List"%>
<%@page import="com.pan.competition.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<% 
	CompetitionService competitionService = new CompetitionService();
	List<MenuItem> competitionNames = competitionService.getCompetitionName();
	String competition_id = null,event_id=null,stage_id=null;
	List<MenuItem> eventNames=null,stageNames=null;
	List<Group> groupList = null;
	List<Arrange> arrangeList = null;
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies ){
		if(cookie.getName().equals("competition_id")){
			competition_id = cookie.getValue();
		}else if(cookie.getName().equals("event_id")){
			event_id = cookie.getValue();
		}else if(cookie.getName().equals("stage_id")){
			stage_id = cookie.getValue();
		}
	}
	if(competitionNames.size()!=0){
		if(competition_id == null||"null".equals(competition_id)){
			competition_id = competitionNames.get(0).getId();
		}
		//获取项目列表
		EventService eventService = new EventService();
		eventNames = eventService.getEventNameList(competition_id).getData();
		if(eventNames.size()!=0){
			if(event_id == null||"null".equals(event_id)){
				event_id = eventNames.get(0).getId();
			}
			StageService stageService = new StageService();
			stageNames = stageService.getStageNameList(event_id).getData();
			if(stageNames.size()!=0){
				if(stage_id == null||"null".equals(stage_id) ){
					stage_id = stageNames.get(0).getId();
				}
				GroupService groupService = new GroupService();
				groupList = groupService.getGroupList(stage_id);
				MatchService matchService = new MatchService();
				arrangeList = matchService.getMatchArrangeList(stage_id);
			}
		}
	}
	request.setAttribute("competition_id", competition_id);
	request.setAttribute("event_id", event_id);
	request.setAttribute("stage_id", stage_id);
	if(eventNames == null)
		eventNames = new ArrayList<>();
	if(stageNames == null)
		stageNames = new ArrayList<>();
	if(groupList == null)
		groupList = new ArrayList<>();
	if(arrangeList == null)
		arrangeList = new ArrayList<>();
	request.setAttribute("groupList", groupList);
	request.setAttribute("arrangeList", arrangeList);
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>竞赛编排</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WushuManageSystem/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="/WushuManageSystem/css/competition-arrange.css" />
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>

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
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <!--<a class="navbar-brand" href="#">武术赛事系统</a>-->
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<!--<li><a href="index.html">首页</a></li>-->
	        <li><a href="/WushuManageSystem/index.jsp">首页<span class="sr-only">(current)</span></a></li>
	        <li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">赛事准备 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
		            <li><a href="/WushuManageSystem/admin/competition/competition-manage.jsp" target="_self">赛事管理</a></li>
		            <li><a href="/WushuManageSystem/admin/apply.jsp">报名报项</a></li>
		            <li><a href="/WushuManageSystem/admin/delegation/delegation-manage.jsp">代表团管理</a></li>
		            <li><a href="/WushuManageSystem/admin/judge/judge-manage.jsp">裁判员管理</a></li>
	          	</ul>
        	</li>
	        <li class="active"><a href="/WushuManageSystem/admin/competition-arrange.jsp">竞赛编排</a></li>
	        <li><a href="/WushuManageSystem/admin/judge/grade-list.jsp">成绩处理</a></li>
	        <li><a href="/WushuManageSystem/admin/print-report.jsp">打印报表</a></li>
	      </ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<ol class="breadcrumb">
	  <li><a href="/WushuManageSystem/index.jsp">首页</a></li>
	  <li><a href="#">竞赛编排</a></li>
	</ol>
	
	<div class="container competition_arrange_div  col-md-8 col-md-offset-2">
		<form class="form form-inline">
			<label for="competition_name_select" class="control-label">赛事名称</label>&ensp;
		   	<select class="form-control" id="competition_name_select">
		   		<c:forEach var="competition" items="<%=competitionNames %>">
		   			<option value="${competition.id }">${competition.name }</option>
		   		</c:forEach>
		    </select>&ensp;&ensp;
				<label for="event_name_select" class="control-label">比赛项目</label>&ensp;
			   	<select class="form-control" id="event_name_select">
		    		<c:forEach var="event" items="<%=eventNames %>">
			   			<option value="${event.id }">${event.name }</option>
			   		</c:forEach>
			    </select>&ensp;&ensp;
		    <label for="stage_name_select" class="control-label">比赛阶段</label>&ensp;
		   	<select class="form-control" id="stage_name_select">
	    		<c:forEach var="stage" items="<%=stageNames %>">
		   			<option value="${stage.id }">${stage.name }</option>
		   		</c:forEach>
		    </select>
	 </form>
		
	   <hr />
	    	<table class="table table-bordered">
		  	<thead>
		  		<tr>
		  			<th></th>
		  			<th>分组</th>
		  			<th>时间</th>
		  			<th>场地</th>
		  		</tr>
		  	</thead>
		  	<tbody id="group_tb">
		  		<c:if test="${groupList.size()==0 }">
		  			<tr>
			  			<td>
					      	<a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>
					      	<a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a>
				     	</td>
				  		<td><input class="form-control" type="number" value="1" placeholder="请输入第几组" /></td>
				  		<td>
				  			<form class="form-inline">
				  				<input class="form-control datetimepicker" placeholder="起始时间"/>
				  				&ensp;到&ensp;
				  				<input class="form-control datetimepicker" placeholder="结束时间"/>
				  			</form>
				  		</td>
				  		<td><input class="form-control" placeholder="请输入比赛场地"/></td>
				  	</tr>
		  		</c:if>
		  		<c:if test="${groupList.size()!=0 }">
		  		<c:forEach var="group" items="${groupList }">
		  			<tr>
			  			<td>
					      	<a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>
					      	<a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a>
				     	</td>
				  		<td><input class="form-control" type="number" placeholder="请输入第几组" value="${group.group_num }"/></td>
				  		<td>
				  			<form class="form-inline">
				  				<input class="form-control datetimepicker" id="start_time" placeholder="起始时间" value="${group.start_time }"/>
				  				&ensp;到&ensp;
				  				<input class="form-control datetimepicker" id="end_time" placeholder="结束时间" value="${group.end_time }"/>
				  			</form>
				  		</td>
				  		<td><input class="form-control" placeholder="请输入比赛场地" value="${group.location }"/></td>
				  	</tr>
		  		</c:forEach>
		  		</c:if>
		  	</tbody>
		  </table>
		  <button class="btn btn-primary" id="save_group_btn">保存</button>
		  <hr />
		  <h4 class="text-center"><b>出场顺序</b></h4>
	    	<table class="table table-bordered" id="arrange_table">
		  	<thead>
		  		<tr>
		  			<th style="width:30%">序号</th>
		  			<th>代表团</th>
		  			<th>报项名</th>
		  			<th>分组</th>
		  		</tr>
		  	</thead>
		  	<tbody id="arrange_tb">
		  		<c:if test="${arrangeList.size() !=0 }">
		  		<c:forEach var="arrange" items="${arrangeList }">
		  			<tr id="${arrange.match_id }">
			  			<td><input class="form-control" type="number" placeholder="请输入序号" value="${arrange.order }" /></td>
			  			<td>${arrange.delegation_name }</td>
				  		<td>${arrange.apply_name }</td>
				  		<td>
				  			<select class="form-control">
				  				<c:forEach var="group" items="${groupList }">
				  					<option value="${group.group_num}" <c:if test="${arrange.group_num eq group.group_num }">selected</c:if>>第${group.group_num}组</option>
				  				</c:forEach>
				  			</select>
				  		</td>
				  	</tr>
		  		</c:forEach>
		  		</c:if>
		  	</tbody>
		  </table>
		  <c:if test="${arrangeList.size() ==0 }">
		  	<p class="text-center">该项目报项为空</p>
		  </c:if>
		  <button id="save_arrange_btn" class="btn btn-primary <c:if test="${arrangeList.size() ==0 }">disabled</c:if>">保存</button>
		  <%-- <button id="draw_log_btn" class="btn btn-primary <c:if test="${arrangeList.size() ==0 }">disabled</c:if>">抽签</button> --%>
	  </div>
	    
	<script src="/WushuManageSystem/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/WushuManageSystem/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/WushuManageSystem/js/jquery.cookie.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
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
			
			 $(".datetimepicker").datetimepicker({
			 	format:"yyyy-mm-dd hh:ii",
			 	language: "zh-CN",
			 	autoclose:true
			 });
		});
    	
    	function add(arg){
			$(arg).parent().parent().after('<tr><td><a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>'
			+' <a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a></td>'
			+'<td><input class="form-control" type="number" placeholder="请输入第几组" /></td>'
			+'<td><div class="form-inline"><input class="form-control datetimepicker" placeholder="起始时间"/>'
			+' &ensp;到 &ensp;<input class="form-control datetimepicker" placeholder="结束时间"/></div></td>'
			+'<td><input class="form-control" placeholder="请输入比赛场地"/></td></tr>');
			$(".datetimepicker").datetimepicker({
			 	format:"yyyy-mm-dd hh:ii",
			 	language: "zh-CN",
			 	autoclose:true
			 });
		}
    	
    	$("#save_group_btn").click(function(){
    		var startDate=$("#start_time").val();  
			var endDate=$("#end_time").val();  
			var curTime = new Date();
			var startTime = new Date(Date.parse(startDate));
			var endTime = new Date(Date.parse(endDate));
			if(curTime<=startTime || curTime<=endTime){
				alert("填写日期不能大于当前日期！");
				return false;
			}else if(startTime >= endTime){
				alert("开始日期不能大于结束日期！");
				return false;
			}
    		var json = "[";
    		$("#group_tb").children().each(function(){
    			var group_num = $(this).children().eq(1).children().val();
    			var start_time = $(this).children().eq(2).find("input").eq(0).val();
    			var end_time = $(this).children().eq(2).find("input").eq(1).val();
    			var location = $(this).children().eq(3).children().val();
    			json = json + '{"stage_id":"'+"${stage_id}"+'","group_num":"'+group_num+'","start_time":"'+start_time+'","end_time":"'+end_time+'","location":"'+location+'"},';
    		});
    		json = json.substring(0,json.length-1)+']';
    		$.post("/WushuManageSystem/servlet/GroupServlet",{data:json},function(data){
    			alert(data);
    			window.location.reload();
    		});
    	});
    	
    	$("#save_arrange_btn").click(function(){
    		var json="[";
    		var stage_id = "${stage_id}";
    		$("#arrange_tb").children().each(function(){
    			var match_id = $(this).attr("id");
    			var order = $(this).children().eq(0).children().eq(0).val();
    			var group_num = $(this).children().eq(3).children().eq(0).val();
    			if(group_num == ""){
    				alert("分组不能为空");
    				return false;
    			}
    			json = json + '{"match_id":"'+match_id+'","order":"'+order+'","group_num":"'+group_num+'","stage_id":"'+stage_id+'"},';
    		});
    		json = json.substring(0,json.length-1) +']';
    		alert(json)
    		$.post("/WushuManageSystem/servlet/MatchServlet?action=saveArrange",{data:json},function(data){
    			alert(data);
    			window.location.reload();
    		});
    	});
    	
		/* $("#draw_log_btn").click(function(){
			var json="[";
    		var stage_id = "${stage_id}";
    		$("#arrange_tb").children().each(function(){
    			var match_id = $(this).attr("id");
    			var group_num = $(this).children().eq(3).children().eq(0).val();
    			if(group_num == ""){
    				alert("分组不能为空");
    				return false;
    			}
    			json = json + '{"match_id":"'+match_id+'","group_num":"'+group_num+'","stage_id":"'+stage_id+'"},';
    		});
    		json = json.substring(0,json.length-1) +']';
    		$.post("/WushuManageSystem/servlet/MatchServlet?action=autoArrange",{data:json},function(data){
    			alert(data);
    			window.location.reload();
    		});
    	}); */
    	
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
			 
		 function remove(arg){
		 	 $(arg).parent().parent().remove();
		 }
			 
    </script>
 </body>
</html>
