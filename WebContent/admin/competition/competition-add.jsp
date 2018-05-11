<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加赛事</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WushuManageSystem/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="/WushuManageSystem/css/competition-add.css" />
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
	        <li><a href="/WushuManageSystem/admin/judge/grade-list.jsp">成绩处理</a></li>
	        <li><a href="/WushuManageSystem/admin/print-report.jsp">报表生成</a></li>
	      </ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	
	<ol class="breadcrumb">
	  <li><a href="/WushuManageSystem/index.jsp">首页</a></li>
	  <li><a href="#">赛事准备</a></li>
	  <li><a href="/WushuManageSystem/admin/competition/competition-manage.jsp">赛事管理</a></li>
	  <li><a href="#">添加赛事</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4 class="text-center"><b>添加赛事</b></h4>
		<div class="col-md-6 col-md-offset-3">
	    	<form class="form" action="/WushuManageSystem/servlet/CompetitionServlet?action=add" method="post">
				  <div class="form-group">
				    <label for="competition_name" class="control-label">赛事名称</label>
				    <div>
				    	<input type="text" class="form-control" name="competition_name" placeholder="请输入赛事名称" required autofocus>
				    </div>
				  </div>
				  <div class="form-group form-inline">
				    <label for="competition_date" class="control-label">时间</label>
				    <div id="competition_date_div">
				    		<input name="competition_start_date" type="text" class="form-control date" required>
				    	          <div>至</div>
				    		<input name="competition_end_date" type="text" class="form-control date" required>
				    </div>
				  </div>
				  <div class="form-group form-inline" id="distpicker">
				    <label for="competition_location" class="control-label">地点</label>
				    <div>
				    	<select class="form-control" id="province" name="province"></select>
				    	<select class="form-control" id="city" name="city"></select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="competition_stadium" class="control-label">场馆</label>
				    <div>
				    	<input type="text" class="form-control" name="competition_stadium" placeholder="请输入场馆" required>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="competition_mascot" class="control-label">吉祥物</label>
				    <div>
				    	<input type="text" class="form-control" name="competition_mascot" placeholder="请输入吉祥物">
				    </div>
				  </div>
				  <!--<div class="form-group">
				    <label for="competition_logo" class="control-label">Logo</label>
				    <div>
				    	<input type="text" class="form-control" id="competition_logo" placeholder="请输入赛事名称">
				    </div>
				  </div>-->
				  <div class="form-group">
				    <label for="competition_sponsor" class="control-label">赞助商</label>
				    <div>
				    	<input type="text" class="form-control" name="competition_sponsor" placeholder="请输入赞助商">
				    </div>
				  </div>
				  <div>
				  	<button type="submit" id="add_competition_btn" class="btn btn-primary col-md-12">添加</button>
				  </div>
				</form>
	    </div>
	</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.8.2.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script src="/WushuManageSystem/js/distpicker.data.js"></script>
	<script src="/WushuManageSystem/js/distpicker.js"></script>
	<script src="/WushuManageSystem/js/main.js"></script>
	<script src="/WushuManageSystem/js/bootstrap-datepicker.js"></script>
    <script src="/WushuManageSystem/js/bootstrap-datepicker.zh-CN.js" ></script>
    <%-- <script src="/WushuManageSystem/customjs/competition-add.js"></script> --%>
    <script type="text/javascript">
    			
			 $(".date").datepicker({
			 	format:"yyyy-mm-dd",
			 	language: "zh-CN",
			 	autoclose:true
			 });
			
			 /*省份城市选择器设置*/
			 $('#distpicker').distpicker();
			 
			 var msg = "${ add_competition_msg }";
			 if(msg !=null && msg!=""){
				 alert(msg);
			 }
			 
			 $("#add_competition_btn").click(function(){
				 var startDate=$("input[name='competition_start_date']").val();  
				 var endDate=$("input[name='competition_end_date']").val();  
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
				var province = $("#province").val();
				var city = $("#city").val();
				if(province=="" || city==""){
					alert("请选择地点！");
					return false;
				}
			 });
		</script>
 </body>
</html>