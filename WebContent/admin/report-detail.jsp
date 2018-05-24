<%@page import="com.pan.competition.bean.RankingReport"%>
<%@page import="com.pan.competition.bean.GradeReport"%>
<%@page import="com.pan.competition.bean.OrderReport"%>
<%@page import="com.pan.competition.bean.ApplyReport"%>
<%@page import="com.pan.competition.config.Constant"%>
<%@page import="com.pan.competition.service.ReportService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pan.competition.bean.Report"%>
<%@page import="java.util.List"%>
<%@page import="com.pan.competition.service.CompetitionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<%
		String report_type = request.getParameter("type");
		request.setAttribute("report_type", report_type);
		String id =  request.getParameter("id");
		ReportService reportService = new ReportService();
		if(Constant.EVENT_APPLY_REPORT.equals(report_type)) {
			List<ApplyReport> applyReports = reportService.getApplyReportList(id);
			request.setAttribute("reportList", applyReports);
		}else if(Constant.DELEGATION_APPLY_REPORT.equals(report_type)) {
			List<ApplyReport> applyReports = reportService.getDelegationApplyReportList(id);
			request.setAttribute("reportList", applyReports);
		}else if(Constant.ORDER_REPORT.equals(report_type)) {
			List<OrderReport> orderReports = reportService.getOrderReportList(id);
			request.setAttribute("reportList", orderReports);
		}else if(Constant.GRADE_REPORT.equals(report_type)) {
			List<GradeReport> gradeReports = reportService.getGradeReportList(id);
			request.setAttribute("reportList", gradeReports);
		}else if(Constant.RANKING_REPORT.equals(report_type)) {
			List<RankingReport> rankingReports = reportService.getRankingReportList(id);
			request.setAttribute("reportList", rankingReports);
		}
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>报表下载</title>

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
	        <li><a href="/WushuManageSystem/admin/competition-arrange.jsp">竞赛编排</a></li>
	        <li><a href="/WushuManageSystem/admin/judge/grade-list.jsp">成绩处理</a></li>
	        <li class="active"><a href="/WushuManageSystem/admin/print-report.jsp">报表生成</a></li>
	      </ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<ol class="breadcrumb">
	  <li><a href="/WushuManageSystem/index.jsp">首页</a></li>
	  <li><a href="/WushuManageSystem/admin/print-report.jsp">报表生成</a></li>
	  <li><a href="#">报表内容</a></li>
	</ol>

	<div class="container content col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
	<c:if test="${reportList.size()>0 }"><h4><b>${reportList[0].report_name }</b></h4></c:if>
		 <table class="table table-bordered">
		 	<c:if test="${report_type eq '1'}">
		 		<thead>
	    			<tr>
	    				<th>报项名</th>
	    				<th>代表团</th>
	    				<th>运动员</th>
	    				<th>介绍</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<c:forEach var="report" items="${reportList }">
	    				<tr>
		    				<td>${report.apply_name }</td>
		    				<td>${report.delegation_name }</td>
		    				<td>${report.athlets }</td>
		    				<td>${report.remark }</td>
	    				</tr>
	    			</c:forEach>
    			</tbody>
		 	</c:if>
		 	<c:if test="${report_type eq '2'}">
		 		<thead>
	    			<tr>
	    				<th>项目名</th>
	    				<th>报项名</th>
	    				<th>运动员</th>
	    				<th>介绍</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<c:forEach var="report" items="${reportList }">
	    				<tr>
		    				<td>${report.event_name }</td>
		    				<td>${report.apply_name }</td>
		    				<td>${report.athlets }</td>
		    				<td>${report.remark }</td>
	    				</tr>
	    			</c:forEach>
    			</tbody>
		 	</c:if>
		 	<c:if test="${report_type eq '3'}">
		 		<thead>
	    			<tr>
	    				<th>分组</th>
	    				<th>序号</th>
	    				<th>报项名</th>
	    				<th>代表团</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<c:forEach var="report" items="${reportList }">
	    				<tr>
		    				<td>${report.group_num }</td>
		    				<td>${report.order }</td>
		    				<td>${report.apply_name }</td>
		    				<td>${report.delegation_name }</td>
	    				</tr>
	    			</c:forEach>
    			</tbody>
		 	</c:if>
		 	<c:if test="${report_type eq '4'}">
		 		<thead>
	    			<tr>
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
	    		<tbody>
	    			<c:forEach var="report" items="${reportList }">
	    				<tr>
		    				<td>${report.apply_name }</td>
		    				<td>${report.delegation_name }</td>
		    				<td>${report.gradeA }</td>
		    				<td>${report.gradeB }</td>
		    				<td>${report.gradeC }</td>
		    				<td>${report.coach_grade }</td>
		    				<td>${report.total_points }</td>
		    				<td>${report.ranking }</td>
		    				<td>${report.promote }</td>
	    				</tr>
	    			</c:forEach>
    			</tbody>
		 	</c:if>
		 	<c:if test="${report_type eq '5'}">
		 		<thead>
	    			<tr>
	    				<th>报项名</th>
	    				<th>代表团名称</th>
	    				<c:if test="${reportList.size()>0 }">
		    				<c:forEach var="stage" items="${reportList[0].stage_name }">
		    					<th>${stage}</th>
		    				</c:forEach>
	    				</c:if>
	    				<th>名次</th>
	    			</tr>
	    		</thead>
	    		<tbody>
    				<c:forEach var="report" items="${reportList }"  varStatus="status">
	    				<tr>
		    				<td>${report.apply_name }</td>
		    				<td>${report.delegation_name }</td>
		    				<c:forEach var="grade" items="${report.stage_grade }">
		    					<td>${grade }</td>
		    				</c:forEach>
		    				<td>${report.ranking }</td>
	    				</tr>
	    			</c:forEach>
    			</tbody>
		 	</c:if>
   		</table>
   		<c:if test="${reportList.size()==0 }">内容为空</c:if>
	</div>

  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script src="/WushuManageSystem/js/jquery.cookie.js"></script>
 </body>
</html>
