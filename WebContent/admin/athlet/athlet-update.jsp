<%@page import="com.pan.competition.service.AthletService"%>
<%@page import="com.pan.competition.bean.Athlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<%
	String competition_id = request.getParameter("competition_id");
	String athlet_id = request.getParameter("athlet_id");
	AthletService athletService = new AthletService();
	Athlet athlet = athletService.getAthletById(athlet_id);
	request.setAttribute("athlet", athlet);
	request.setAttribute("competition_id", competition_id);
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>运动员修改</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link href="/WushuManageSystem/css/table.css" rel="stylesheet">

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
		            <li><a href="/WushuManageSystem/admin/competition/competition-manage.jsp">赛事管理</a></li>
		            <li><a href="/WushuManageSystem/admin/apply.jsp">报名报项</a></li>
		            <li class="active"><a href="/WushuManageSystem/admin/delegation/delegation-manage.jsp">代表团管理</a></li>
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
	  <li><a href="/WushuManageSystem/index.jsp">首页</a></li>
	  <li><a href="#">赛事准备</a></li>
	  <li><a href="/WushuManageSystem/admin/delegation/delegation-manage.jsp?selected=${competition_id }">代表团管理</a></li>
	  <li><a href="/WushuManageSystem/admin/athlet/athlet-manage.jsp?delegation_id=${athlet.delegation_id }&competition_id=${competition_id}">运动员管理</a></li>
	  <li><a href="#">运动员修改</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4 class="text-center"><b>修改运动员</b></h4>
		<div class="col-md-6 col-md-offset-3">
	    	<form class="form" action="/WushuManageSystem/servlet/AthletServlet?action=update&delegation_id=${athlet.delegation_id }&competition_id=${competition_id}&athlet_id=${athlet.id}" method="post">
				  <div class="form-group">
				    <label for="athlet_name" class="control-label">姓名</label>
				    <div>
				    	<input type="text" class="form-control" name="athlet_name" value="${athlet.name }" placeholder="请输入姓名" required autofocus>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="athlet_sex" class="control-label">性别</label>
				    <div>
				    	<select class="form-control" name="athlet_sex">
				    		<option <c:if test="${athlet.sex eq '男' }">selected</c:if>>男</option>
				    		<option <c:if test="${athlet.sex eq '女' }">selected</c:if>>女</option>
				    	</select>
				    </div>
				  </div>
				  <div class="form-group" id="distpicker">
				    <label for="athlet_age" class="control-label">年龄</label>
				    <div>
				    	<input type="number" class="form-control" name="athlet_age" value="${athlet.age }" placeholder="请输入年龄" required>
				    </div>
				  </div>
				  <div>
				  	<button type="submit" id="update_athlet_btn" class="btn btn-primary col-md-12">修改</button>
				  </div>
				</form>
	    </div>
	</div>

  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script type="text/javascript">
   	 var msg = "${ msg }";
	 if(msg !=null && msg!=""){
		 alert(msg);
	 }
    </script>
 </body>
</html>