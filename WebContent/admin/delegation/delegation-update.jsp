<%@page import="com.pan.competition.bean.Message"%>
<%@page import="com.pan.competition.service.DelegationService"%>
<%@page import="com.pan.competition.bean.Delegation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<%
	String delegation_id = request.getParameter("delegation_id");
	DelegationService delegationService = new DelegationService();
	Message<Delegation> message = delegationService.getDelegationById(delegation_id);
	if(message.getCode().equals("200")){
		Delegation delegation = message.getData();
		request.setAttribute("delegation", delegation);
	}else{
		request.setAttribute("msg",message.getMsg());
	}
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>修改代表团</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link href="/WushuManageSystem/css/delegation-add.css" rel="stylesheet">

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
	        <li><a href="/WushuManageSystem/admin/judge/grade-list.jsp">成绩处理</a></li>
	        <li><a href="/WushuManageSystem/admin/print-report.jsp">报表生成</a></li>
	      </ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<ol class="breadcrumb">
	  <li><a href="/WushuManageSystem/index.jsp">首页</a></li>
	  <li><a href="#">赛事准备</a></li>
	  <li><a href="/WushuManageSystem/admin/delegation/delegation-manage.jsp?selected=${delegation.competition_id }">代表团管理</a></li>
	  <li><a href="#">代表团修改</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4 class="text-center"><b>修改代表团</b></h4>
		<div class="col-md-6 col-md-offset-3">
	    	<form class="form" action="/WushuManageSystem/servlet/DelegationServlet?action=update&delegation_id=${delegation.id }&competition_id=${delegation.competition_id }" method="post">
			  <div class="form-group">
			    <label for="delegation_name" class="control-label">代表团名称</label>
			    <div>
			    	<input type="text" class="form-control" name="delegation_name" value="${delegation.name }" placeholder="请输入代表团名称" required autofocus>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="delegation_athlet_num" class="control-label">运动员人数</label>
			    <div>
			    	<input type="number" class="form-control" name="delegation_athlet_num" value="${delegation.athlet_num }" placeholder="请输入运动员人数" required readonly="readonly">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="delegation_contact" class="control-label">联系方式</label>
			    <div>
			    	<input type="tel" class="form-control" maxlength="11" name="delegation_phone" value="${delegation.phone }" placeholder="请输入联系方式" required>
			    </div>
			  </div>
			  <div class="form-group form-inline" id="distpicker">
			    <label for="delegation_area" class="control-label">所在地区</label>
			    <div>
			    	<select class="form-control" id="province"  name="province" data-province="${delegation.province }"></select>
			    	<select class="form-control" id="city" name="city" data-city="${delegation.city }"></select>
			    	<select class="form-control" id="district" name="district" data-district="${delegation.district }"></select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="delegation_description" class="control-label">代表团介绍</label>
			    <div>
			    	<textarea  class="form-control" name="delegation_description" value="${delegation.introduction }"></textarea>
			    </div>
			  </div>
			  <div class="form-group">
			    <button class="btn btn-primary col-md-12">修改</button>
			  </div>
			</form>
	    </div>
	</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script src="/WushuManageSystem/js/distpicker.data.js"></script>
	<script src="/WushuManageSystem/js/distpicker.js"></script>
	<script src="/WushuManageSystem/js/main.js"></script>
    <script type="text/javascript">
    
     var msg = "${ msg }";
	 if(msg !=null && msg!=""){
		 alert(msg);
	 }
    			
	 /*省份城市选择器设置*/
	 $('#distpicker').distpicker();
	</script>
 </body>
</html>