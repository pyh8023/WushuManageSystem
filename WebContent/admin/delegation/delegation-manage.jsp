<%@page import="java.util.ArrayList"%>
<%@page import="com.pan.competition.service.DelegationService"%>
<%@page import="com.pan.competition.bean.Delegation"%>
<%@page import="com.pan.competition.bean.MenuItem"%>
<%@page import="java.util.List"%>
<%@page import="com.pan.competition.service.CompetitionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	CompetitionService competitionService = new CompetitionService();
	List<MenuItem> competitionNameList = competitionService.getCompetitionName();
	request.setAttribute("competitionNameList", competitionNameList);
	String selected = (String)request.getParameter("selected");
	DelegationService delegationService = new DelegationService();
	List<Delegation> delegationList = null;
	if(competitionNameList.size()!=0 && (selected == null||selected.equals(""))){
		selected = competitionNameList.get(0).getId();
	}
	delegationList = delegationService.getDelegationList(selected);
	request.setAttribute("delegationList", delegationList);
	request.setAttribute("index", 0);
%>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>代表团管理</title>

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
	        <li><a href="/WushuManageSystem/admin/index.jsp">首页<span class="sr-only">(current)</span></a></li>
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
	  <li><a href="#">代表团管理</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<form class="form form-inline">
			<label for="competition_name" class="control-label">赛事名称</label>
	   	<select class="form-control" id="competition_name_select">
    		<c:forEach var="competition" items="${competitionNameList }">
    			<option value="${competition.id }">${competition.name }</option>
    		</c:forEach>
	  	</select>
		</form>
		
		<hr />
		
		<c:if test="${competitionNameList.size() ==0 || delegationList.size()==0 }">
			<p>代表团为空</p>
		</c:if>
		
		<c:if test="${delegationList.size()!=0 }">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>序号</th>
						<th>名称</th>
						<th>运动员数量</th>
						<th>所在地</th>
						<th>联系方式</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="delegation" items="${delegationList }">
						<tr>
							<td>${index=index+1 }</td>
							<td><a href="/WushuManageSystem/admin/athlet/athlet-manage.jsp?delegation_id=${delegation.id }&competition_id=<%=selected %>">${delegation.name }</a></td>
							<td>${delegation.athlet_num }</td>
							<td>${delegation.province } ${delegation.city } ${delegation.district }</td>
							<td>${delegation.phone }</td>
							<td>
								<a href="/WushuManageSystem/admin/delegation/delegation-update.jsp?delegation_id=${delegation.id }" class="btn btn-primary btn-xs">修改</a>
								<a class="btn btn-primary btn-xs" onclick="remove(${delegation.id })">删除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<c:if test="${competitionNameList.size()==0 }">
			<a class="btn btn-primary disabled" href="/WushuManageSystem/admin/delegation/delegation-add.jsp">添加代表团</a>
		</c:if>
		<c:if test="${competitionNameList.size()!=0 }">
			<a class="btn btn-primary" href="/WushuManageSystem/admin/delegation/delegation-add.jsp?competition_id=<%=selected %>">添加代表团</a>
		</c:if>
	</div>

  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	
    	if("<%=selected%>" != ""){
        	$("#competition_name_select option[value='<%=selected%>']").attr("selected",true);
    	}
    	
    	function remove(arg){
    		$.post("/WushuManageSystem/servlet/DelegationServlet?action=remove",{delegation_id:arg},function(data){
    			alert(data);
    			window.location.reload();
    		});
    	}
    	
    	$("#competition_name_select").change(function(){
    		window.location.href = "/WushuManageSystem/admin/delegation/delegation-manage.jsp?selected="+$(this).val();
    	});
    </script>
 </body>
</html>