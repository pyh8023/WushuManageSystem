<%@page import="com.pan.competition.service.ReportService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pan.competition.bean.Report"%>
<%@page import="com.pan.competition.bean.MenuItem"%>
<%@page import="java.util.List"%>
<%@page import="com.pan.competition.service.CompetitionService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<%
	CompetitionService competitionService = new CompetitionService();
	List<MenuItem> competitionNames = competitionService.getCompetitionName();
	String competition_id = null,report_type = null;
	Cookie[] cookies = request.getCookies();
	List<Report> reportList = null;
	for(Cookie cookie : cookies ){
		if(cookie.getName().equals("competition_id")){
			competition_id = cookie.getValue();
		}else if(cookie.getName().equals("report_type")){
			report_type = cookie.getValue();
		}
	}
	if(competitionNames.size()>0){
		if(competition_id == null && "null".equals(competition_id)){
			competition_id = competitionNames.get(0).getId();
		}
		if(report_type == null){
			report_type = "1";
		}
		ReportService reportService = new ReportService();
		reportList = reportService.getReportName(competition_id, report_type);
	}
	if(reportList == null)
		reportList = new ArrayList<>();
	request.setAttribute("reportList", reportList);
	request.setAttribute("competition_id", competition_id);
	request.setAttribute("report_type", report_type);
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>打印报表</title>

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
	        <li class="active"><a href="/WushuManageSystem/admin/print-report.jsp">打印报表</a></li>
	      </ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<ol class="breadcrumb">
	  <li><a href="/WushuManageSystem/index.jsp">首页</a></li>
	  <li><a href="#">打印报表</a></li>
	</ol>

	<div class="container content col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		 <form class="form-inline">
		 	<div class="form-group">
		 		<label class="control-label" for="competition_name_select">赛事名称</label>&ensp;
				<select class="form-control" id="competition_name_select">
    				<c:forEach var="competition" items="<%=competitionNames %>">
			   			<option value="${competition.id }">${competition.name }</option>
			   		</c:forEach>
		    	</select>&ensp;&ensp;
		    <label for="report_name" class="control-label">报表类型</label>&ensp;
		    <select class="form-control" id="report_type">
		    	<optgroup label="报名表">
		    		<option value="1">项目报名表</option>
		    		<option value="2">代表团报名表</option>
		    	</optgroup>
		    	<option value="3">秩序单</option>
		    	<option value="4">成绩表</option>
		    	<option value="5">名次表</option>
		    </select>
		  </div>
		 </form>
		 
		 <hr/>
		 
		 <table class="table table-bordered">
    		<thead>
    			<tr>
    				<th>序号</th>
    				<th>报表名称</th>
    				<th>下载</th>
    			</tr>
    		</thead>
    		<tbody>
    			<c:forEach var="report" items="${reportList }" varStatus="status">
    				<tr id="${report.id }">
	    				<td>${status.count }</td>
	    				<td>${report.name }</td>
	    				<td>
	    					<button class="btn btn-primary btn-xs">word格式</button>
	    					<button class="btn btn-primary btn-xs">pdf格式</button>
	    				</td>
	    			</tr>
    			</c:forEach>
    		</tbody>
   </table>
   <c:if test="${reportList.size()==0 }">
   		该赛事暂无报表
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
		
		if("${report_type}" != ""){
			$("#report_type option[value='${report_type}']").attr("selected",true);
		}
		
		$("#competition_name_select").change(function(){
			$.cookie('competition_id', $(this).val());
	    	window.location.reload();
		});
		
		$("#report_type").change(function(){
			$.cookie('report_type', $(this).val());
			window.location.reload();
		});
	</script>
 </body>
</html>
