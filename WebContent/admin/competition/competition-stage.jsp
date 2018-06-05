<%@page import="com.pan.competition.dao.CompetitionDao"%>
<%@page import="com.pan.competition.bean.Stage"%>
<%@page import="java.util.List"%>
<%@page import="com.pan.competition.bean.Message"%>
<%@page import="com.pan.competition.service.StageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<%
	String event_id = request.getParameter("event_id");
	String competition_id = request.getParameter("competition_id");
	StageService stageService = new StageService();
	Message<List<Stage>> message = stageService.getStageList(event_id);
	CompetitionDao competitionDao = new CompetitionDao();
	int status = competitionDao.getCompetitionStatus(competition_id);
	request.setAttribute("list", message.getData());
	request.setAttribute("status", status);
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>比赛阶段信息</title>

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
	        <li><a href="/WushuManageSystem/admin/index.jsp">首页<span class="sr-only">(current)</span></a></li>
	        <li class="dropdown active">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">赛事准备 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
		            <li class="active"><a href="/WushuManageSystem/admin/competition/competition-manage.jsp" target="_self">赛事管理</a></li>
		            <li><a href="/WushuManageSystem/admin/apply.jsp">报名报项</a></li>
		            <li><a href="/WushuManageSystem/admin/delegation/delegation-manage.jsp">代表团管理</a></li>
		            <li><a href="/WushuManageSystem/admin/judge/judge-manage.jsp">裁判员管理</a></li>
	          	</ul>
        	</li>
	        <li><a href="/WushuManageSystem/admin/competition-arrange.jsp">竞赛编排</a></li>
	        <li><a href="/WushuManageSystem/admin/judge/grade-list.jsp">成绩处理</a></li>
	        <li><a href="/WushuManageSystem/admin/print-report.jsp">报表生成</a></li>
	      </ul>	 
	      <ul class="nav navbar-nav navbar-right">
	         <li><a href="/WushuManageSystem/servlet/LoginServlet?action=logout" onclick="logout()">注销</a></li>
	      </ul>    
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<ol class="breadcrumb">
	  <li><a href="/WushuManageSystem/admin/index.jsp">首页</a></li>
	  <li><a href="#">赛事准备</a></li>
	  <li><a href="/WushuManageSystem/admin/competition/competition-manage.jsp">赛事管理</a></li>
	  <li><a href="/WushuManageSystem/admin/competition/competition-msg.jsp?competition_id=<%= competition_id%>">赛事项目信息</a></li>
	  <li><a href="#">比赛阶段信息</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4><b>比赛阶段信息</b></h4>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th></th>
					<th>编号</th>
					<th>阶段名称</th>
					<th>属性</th>
				</tr>
			</thead>
			<tbody id="stage_tbody">
				<c:if test="${list.size()==0}">
					<tr>
						<td>
							<a onclick="add_stage(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>
							<a onclick="remove_stage(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a>
						</td>
						<td><input type="text" class="form-control" name="stage_number" placeholder="请输入编号" required></td>
						<td><input type="text" class="form-control" name="stage_name" placeholder="请输入阶段名称" required></td>
						<td>
							<select class="form-control" name="stage_type">
								<option value="1">第一轮</option>
								<option value="2">第二轮</option>
								<option value="3">第三轮</option>
								<option value="4">第四轮</option>
								<option value="5">第五轮</option>
								<option value="9">决赛</option>
							</select>
						</td>
					</tr>
				</c:if>
				<c:if test="${list.size()!=0}">
					<c:forEach var="stage" items="${list }">
						<tr>
							<td>
								<a onclick="add_stage(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>
								<a onclick="remove_stage(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a>
							</td>
							<td><input type="text" class="form-control" name="stage_number" placeholder="请输入阶段编号" value="${stage.stage_num }" required></td>
							<td><input type="text" class="form-control" name="stage_name" placeholder="请输入阶段名称" value="${stage.name }" required></td>
							<td>
								<select class="form-control" name="stage_type">
									<option value="1" <c:if test="${stage.attribute eq '1'}">selected</c:if>>第一轮</option>
									<option value="2" <c:if test="${stage.attribute eq '2'}">selected</c:if>>第二轮</option>
									<option value="3" <c:if test="${stage.attribute eq '3'}">selected</c:if>>第三轮</option>
									<option value="4" <c:if test="${stage.attribute eq '4'}">selected</c:if>>第四轮</option>
									<option value="5" <c:if test="${stage.attribute eq '5'}">selected</c:if>>第五轮</option>
									<option value="9" <c:if test="${stage.attribute eq '9'}">selected</c:if>>决赛</option>
								</select>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<button type="submit" class="btn btn-primary <c:if test="${status !=0}">disabled</c:if>" id="save_stage_btn">保存</button>
	</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	/*添加比赛阶段*/
    	function add_stage(arg){
    		$(arg).parent().parent().after('<tr>'
    		+'<td><a onclick="add_stage(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a> '
    		+'<a onclick="remove_stage(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a></td>'
    		+'<td><input type="text" class="form-control" name="stage_number" placeholder="请输入编号" required></td>'
    		+'<td><input type="text" class="form-control" name="stage_name" placeholder="请输入阶段名称" required></td>'
    		+'<td><select class="form-control" name="stage_type"><option value="1">第一轮</option><option value="2">第二轮</option><option value="3">第三轮</option><option value="4">第四轮</option><option value="5">第五轮</option><option value="9">决赛</option></select></td>'
    		+'</tr>');
    	}
    	
    	function remove_stage(arg){
    		$(arg).parent().parent().remove();
    	}
    	
    	$("#save_stage_btn").click(function(){
    		if (checkEmpty() == 1)
    			return false;
    		if($("#stage_tbody").children().length==0)
    			return false;
    		var json = "[";
    		$("#stage_tbody").children().each(function(){
    			var stage_number = $(this).find("[name='stage_number']").val();
    			var stage_name = $(this).find("[name='stage_name']").val();
    			var stage_type = $(this).find("[name='stage_type']").val(); 
    			json += "{\"stage_num\":\""+stage_number+"\","+"\"name\":\""+stage_name+"\","+"\"attribute\":\""+stage_type+"\","+"\"event_id\":\""+"<%=event_id %>"+"\"},";
    		});
    		json = json.substring(0,json.length-1) +"]";
    		$.post("/WushuManageSystem/servlet/StageServlet",{data:json},function(data){
    			alert(data);
    		}); 
    	});
    	
    	function checkEmpty(){
    		var i = 0;
			$("#stage_tbody").children().each(function(){
    			if($(this).find("[name='stage_number']").val()==""){
    				alert("阶段编号不能为空！");
    				i = 1;
    				return false;
    			}
    			if($(this).find("[name='stage_name']").val()==""){
    				alert("阶段名称不能为空！");
    				i=1;
    				return false;
    			}
    		});
			return i;
    	}
    </script>
 </body>
</html>