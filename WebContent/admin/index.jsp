<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>    
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
    	body{
    		background: #EBEBEB;
    	}
    	
    	.navbar {
    		margin-bottom: 0px;
    	}
    	
    	.carousel-inner{
    		height:400px;
    	}
    	
    	.carousel-inner div img{
    		width: 100%;
    		min-height: 200px;
    		text-align: center;
    	}
    	
    	.content{
    		margin-top: 20px;
    		background: white;
    		border-radius: 5px;
    		padding: 20px 30px;
    		margin-bottom:30px;
    	}
    	
    	.content  h4{
    		padding-bottom: 5px;
    	}  	
    	
    	.content div {
    		margin-bottom: 13px;
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
	        <li class="active"><a href="/WushuManageSystem/admin/index.jsp">首页<span class="sr-only">(current)</span></a></li>
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
	        <li><a href="/WushuManageSystem/admin/print-report.jsp">打印报表</a></li>
	      </ul>	   
	      <ul class="nav navbar-nav navbar-right">
	         <li><a href="/WushuManageSystem/servlet/LoginServlet?action=logout" onclick="logout()">注销</a></li>
	      </ul>  
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- 轮播图 -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="/WushuManageSystem/images/img2.jpg">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="/WushuManageSystem/images/img4.jpg" >
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="/WushuManageSystem/images/img3.jpg" >
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  
  <div class="container content col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2">
  	<h4 class="text-left"><strong>系统介绍</strong><span></span></h4>
  	<hr/>
  	<p>武术赛事成绩处理系统分赛事管理、代表团管理、裁判员管理、报名报项、竞赛编排、成绩处理、报表打印等模块。</p>
  	<p>1.<b>赛事管理模块</b>：该模块包括武术赛事的添加和修改、比赛项目和比赛阶段的管理维护。</p>
  	<p>2.<b>代表团管理模块</b>：该模块包括代表团的增删改查，以及该代表团下运动员的管理。</p>
  	<p>3.<b>裁判员管理</b>：该模块是对各个武术赛事项目比赛阶段的裁判员进行管理。</p>
  	<p>4.<b>报名报项模块</b>：该模块可对符合报项条件的运动员进行筛选，选择符合条件运动员进行报名。</p>
  	<p>5.<b>竞赛编排模块</b>：该模块包括分组管理，场地时间编排，以及运动员出场顺序编排。</p>
  	<p>6.<b>成绩处理模块</b>：该模块包括成绩录入和比赛晋级。</p>
  	<p>7.<b>报表打印模块</b>：该模块包括报名表、秩序单。成绩单、名次表的下载打印。</p>
  </div>
	
	<!-- <div class="container picture col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2">
  	<h4 class="text-left"><strong>精彩图片</strong><span></span></h4>
  	<div class="row">
  		<div class="col-md-4 col-sm-12">
		  	<img src="/WushuManageSystem/images/img2.jpg" width="100%" height="150px" />
  		</div>
  		<div class="col-md-4 col-sm-12">
  			<img src="/WushuManageSystem/images/img2.jpg" width="100%" height="150px" />
  		</div>
  		<div class="col-md-4 col-sm-12">
  			<img src="/WushuManageSystem/images/img3.jpg" width="100%" height="150px" />
  		</div>
  	</div>
  	<div class="row ">
  		<div class="col-md-4 col-sm-12">
		  	<img src="/WushuManageSystem/images/img2.jpg" width="100%" height="150px" />
  		</div>
  		<div class="col-md-4 col-sm-12">
  			<img src="/WushuManageSystem/images/img2.jpg" width="100%" height="150px" />
  		</div>
  		<div class="col-md-4 col-sm-12">
  			<img src="/WushuManageSystem/images/img3.jpg" width="100%" height="150px" />
  		</div>
  	</div> 	
  </div> -->
  	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
 </body>
</html>