<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加代表团</title>

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
	  <li><a href="#">赛前准备</a></li>
	  <li><a href="/WushuManageSystem/admin/delegation/delegation-manage.jsp">代表团列表</a></li>
	  <li><a href="#">代表团添加</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4 class="text-center"><b>添加代表团</b></h4>
		<div class="col-md-6 col-md-offset-3">
	    	<form class="form">
			  <div class="form-group">
			    <label for="delegation_name" class="control-label">代表团名称</label>
			    <div>
			    	<input type="text" class="form-control" id="delegation_name" placeholder="请输入代表团名称" required autofocus>
			    </div>
			  </div>
			  <!-- <div class="form-group">
			    <label for="delegation_main_coach" class="control-label">领队</label>
			    <div>
			    	<input type="text" class="form-control" id="delegation_main_coach" placeholder="请输入领队姓名" required>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="delegation_leader" class="control-label">主教练</label>
			    <div>
			    	<input type="text" class="form-control" id="delegation_leader" placeholder="请输入主教练姓名" required>
			    </div>
			  </div> -->
			  <!-- <div class="form-group">
			    <label for="delegation_athlet_num" class="control-label">运动员人数</label>
			    <div>
			    	<input type="number" class="form-control" id="delegation_athlet_num" placeholder="请输入运动员人数" required readonly="readonly">
			    </div>
			  </div> -->
			  <div class="form-group">
			    <label for="delegation_contact" class="control-label">联系方式</label>
			    <div>
			    	<input type="tel" class="form-control" maxlength="11" id="delegation_contact" placeholder="请输入联系方式" required>
			    </div>
			  </div>
			  <div class="form-group form-inline" id="distpicker">
			    <label for="delegation_area" class="control-label">所在地区</label>
			    <div>
			    	<select class="form-control" id="province"></select>
			    	<select class="form-control" id="city"></select>
			    	<select class="form-control" id="district"></select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="delegation_description" class="control-label">代表团介绍</label>
			    <div>
			    	<textarea  class="form-control" id="delegation_description"></textarea>
			    </div>
			  </div>
			  <div class="form-group">
			    <button class="btn btn-primary col-md-12" id="add_delegation_btn">添加</button>
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
    			
		 /*省份城市选择器设置*/
		 $('#distpicker').distpicker();
		 
		 $("#add_delegation_btn").click(function(){
			 if(province=="" || city==""){
				alert("请选择地点！");
				return false;
			}
		 });
	</script>
 </body>
</html>