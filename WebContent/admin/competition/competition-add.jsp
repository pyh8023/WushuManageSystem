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
    <link href="${ basePath }/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ basePath }/css/bootstrap-datepicker3.min.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
    	
    	body {
    		margin-top: 50px;
    		margin-bottom: 70px;
    		background: #EBEBEB;
    	}
    	
    	.content {
    		background: white;
    	  padding: 30px 40px;
    	  border-radius: 5px;
    	  margin-bottom: 20px;
    	}
    	    	
    	.content table {
    		background: white;
    		text-align: center; 
    	}
    	
    	.content table thead{
    		background: #337AB7;
    		color: white;
    	}
    	
    	.content table thead tr th,td{
    		text-align: center;
    		vertical-align: middle!important;
    	}
    	
    	#competition_date_div div{
    		width:10%;
    		display: inline;
    		text-align: center;
    	}
    	
    	#competition_date_div input{
    		width:45%;
    	}
    	
    </style>
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
	        <li><a href="${ basePath }/index.jsp">首页<span class="sr-only">(current)</span></a></li>
	        <li class="dropdown active">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">赛事准备 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
		            <li class="active"><a href="${ basePath }/admin/competition/competition-manage.jsp" target="_self">赛事管理</a></li>
		            <li><a href="${ basePath }/admin/apply.jsp">报名报项</a></li>
		            <li><a href="${ basePath }/admin/delegation/delegation-manage.jsp">代表团管理</a></li>
		            <li><a href="${ basePath }/admin/judge/judge-manage.html">裁判员管理</a></li>
	          	</ul>
        	</li>
	        <li><a href="${ basePath }/admin/competition-arrange.jsp">竞赛编排</a></li>
	        <li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">成绩处理 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
	            <li><a href="${ basePath }/admin/judge/grade-list.jsp">录入成绩</a></li>
	            <li><a href="${ basePath }/admin/stage-msg.jsp">阶段信息</a></li>
	          	</ul>
        	</li>
	        <li><a href="${ basePath }/admin/print-report.jsp">打印报表</a></li>
	      </ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	
	<ol class="breadcrumb">
	  <li><a href="${ basePath }/index.html">首页</a></li>
	  <li><a href="#">赛前准备</a></li>
	  <li><a href="${ basePath }/admin/competition/competition-manage.jsp">赛事管理</a></li>
	  <li><a href="${ basePath }/admin/competition/competition-add.jsp">添加赛事</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4 class="text-center"><b>添加赛事</b></h4>
		<div class="col-md-6 col-md-offset-3">
	    	<form class="form">
				  <div class="form-group">
				    <label for="competition_name" class="control-label">赛事名称</label>
				    <div>
				    	<input type="text" class="form-control" id="competition_name" placeholder="请输入赛事名称" required autofocus>
				    </div>
				  </div>
				  <div class="form-group form-inline">
				    <label for="competition_date" class="control-label">时间</label>
				    <div id="competition_date_div">
				    		<input id="competition_start_date" type="text" class="form-control date" required>
				    	          <div>至</div>
				    		<input id="competition_end_date" type="text" class="form-control date">
				    </div>
				  </div>
				  <div class="form-group form-inline" id="distpicker">
				    <label for="competition_location" class="control-label">地点</label>
				    <div>
				    	<select class="form-control" id="province"></select>
				    	<select class="form-control" id="city"></select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="competition_stadium" class="control-label">场馆</label>
				    <div>
				    	<input type="text" class="form-control" id="competition_stadium" placeholder="请输入场馆" required>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="competition_mascot" class="control-label">吉祥物</label>
				    <div>
				    	<input type="text" class="form-control" id="competition_mascot" placeholder="请输入吉祥物">
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
				    	<input type="text" class="form-control" id="competition_sponsor" placeholder="请输入赞助商">
				    </div>
				  </div>
				  <div>
				  	<button type="submit" id="add_competition_btn" class="btn btn-primary col-md-12">添加</button>
				  </div>
				</form>
	    </div>
	</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ basePath }/js/jquery-1.8.2.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ basePath }/js/bootstrap.min.js"></script>
    <script src="${ basePath }/js/distpicker.data.js"></script>
	<script src="${ basePath }/js/distpicker.js"></script>
	<script src="${ basePath }/js/main.js"></script>
	<script src="${ basePath }/js/bootstrap-datepicker.js"></script>
    <script src="${ basePath }/js/bootstrap-datepicker.zh-CN.js" ></script>
    <script src="${ basePath }/customjs/competition-add.js"></script>
    <script type="text/javascript">
    			
			 $(".date").datepicker({
			 	format:"yyyy-mm-dd",
			 	language: "zh-CN",
			 	autoclose:true
			 });
			
			 /*省份城市选择器设置*/
			 $('#distpicker').distpicker();
			 
		</script>
 </body>
</html>