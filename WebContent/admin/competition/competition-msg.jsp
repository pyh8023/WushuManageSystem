<%@page import="com.pan.competition.bean.*"%>
<%@page import="java.util.List"%>
<%@page import="com.pan.competition.service.EventService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<%
	String competition_id = request.getParameter("competition_id");
	EventService eventService = new EventService();
	Message<List<Event>> message = eventService.getEventList(competition_id);
	List<Event> list = message.getData();
	request.setAttribute("list", list);
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>赛事项目信息</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link href="/WushuManageSystem/css/competition-manage.css" rel="stylesheet">

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
	        <li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">成绩处理 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
	            <li><a href="/WushuManageSystem/admin/judge/grade-list.jsp">录入成绩</a></li>
	            <li><a href="/WushuManageSystem/admin/stage-msg.jsp">阶段信息</a></li>
	          	</ul>
        	</li>
	        <li><a href="/WushuManageSystem/admin/print-report.jsp">打印报表</a></li>
	      </ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<ol class="breadcrumb">
	  <li><a href="/WushuManageSystem/index.html">首页</a></li>
	  <li><a href="#">赛前准备</a></li>
	  <li><a href="/WushuManageSystem/admin/competition/competition-manage.jsp">赛事管理</a></li>
	  <li><a href="#">赛事项目信息</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4><b>赛事项目列表</b></h4>
		<c:if test="${list.size()==0}">
			<hr>
			<p>赛事项目为空</p>
		</c:if>
		<c:if test="${list.size()!=0}">
			<table class="table table-bordered">
			<thead>
				<tr>
					<th>编号</th>
					<th>名称</th>
					<th>类别</th>
					<th>组别</th>
					<th>性别</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="event" items="${list }">
					<tr>
						<td>${event.event_num }</td>
						<td><a href="competition-stage.jsp?event_id=${event.id }&competition_id=${event.competition_id }">${event.name }</a></td>
						<td>${event.type }</td>
						<td>${event.event_group }</td>
						<td>${event.sex }</td>
						<td>
							<a href="competition-event-change.jsp?event_id=${event.id }" class="btn btn-primary btn-xs">修改</a>
							<a class="btn btn-primary btn-xs remove" onclick="remove(${event.id },${event.competition_id })">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>		
		</c:if>
		<a class="btn btn-primary" href="competition-event-add.jsp?competition_id=<%=competition_id %>">添加项目</a>
	</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	/*删除项目*/
    	function remove(event_id,competition_id){
    		window.location.href="/WushuManageSystem/servlet/EventServlet?action=remove&event_id="+event_id+"&competition_id="+competition_id;
    	}
    	
    	var msg = "${ msg }";
		 if(msg !=null && msg!=""){
			 alert(msg);
		 }
    </script>
 </body>
</html>