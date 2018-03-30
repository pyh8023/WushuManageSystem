<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link href="${ basePath }/css/bootstrap.min.css" rel="stylesheet">

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
    	
    	.latest_news, .picture {
    		margin-top: 20px;
    		background: white;
    		border-radius: 5px;
    		padding: 10px 30px;
    	}
    	
    	.latest_news, .picture  h4{
    		padding-bottom: 5px;
    	}
    	
    	.latest_news hr {
    		color: #5CB85C;
    		height: 2px;
    		margin: 5px;
    	}
    	
    	.latest_news table a{
    		color: black;
    	}
    	
    	.news_pagination{
    		margin-top: -30px;
    	}
    	
    	.picture div {
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
	        <li class="active"><a href="${ basePath }/index.jsp">首页<span class="sr-only">(current)</span></a></li>
	        <li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">赛事准备 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
		            <li><a href="${ basePath }/admin/competition/competition-manage.jsp" target="_self">赛事管理</a></li>
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
      <img src="images/img2.jpg">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="images/img1.jpg" >
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="images/img3.jpg" >
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  
  <div class="container latest_news col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2">
  	<h4 class="text-left"><strong>最新动态</strong><span></span></h4>
  	<table class="table table-hover">
  		<tr>
  			<td><a href="visitor/msg-detail.html">关于2017年国家级武术散打比赛的报名通知</a></td>
  			<td>2017-09-12</td>
  		</tr>
  		<tr>
  			<td><a>关于2017年国家级武术散打比赛的报名通知</a></td>
  			<td>2017-09-12</td>
  		</tr>
  		<tr>
  			<td><a>关于2017年国家级武术散打比赛的报名通知</a></td>
  			<td>2017-09-12</td>
  		</tr>
  		<tr>
  			<td><a>关于2017年国家级武术散打比赛的报名通知</a></td>
  			<td>2017-09-12</td>
  		</tr>
  		<tr>
  			<td><a>关于2017年国家级武术散打比赛的报名通知</a></td>
  			<td>2017-09-12</td>
  		</tr>
  		<tr>
  			<td><a>关于2017年国家级武术散打比赛的报名通知</a></td>
  			<td>2017-09-12</td>
  		</tr>
  		<tr>
  			<td><a>关于2017年国家级武术散打比赛的报名通知</a></td>
  			<td>2017-09-12</td>
  		</tr>
  		<tr>
  			<td><a>关于2017年国家级武术散打比赛的报名通知</a></td>
  			<td>2017-09-12</td>
  		</tr>
  	</table>
  	<nav aria-label="Page navigation" class="news_pagination">
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
  </div>
	
	<div class="container picture col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2">
  	<h4 class="text-left"><strong>精彩图片</strong><span></span></h4>
  	<div class="row">
  		<div class="col-md-4 col-sm-12">
		  	<img src="images/img1.JPG" width="100%" height="150px" />
  		</div>
  		<div class="col-md-4 col-sm-12">
  			<img src="images/img2.jpg" width="100%" height="150px" />
  		</div>
  		<div class="col-md-4 col-sm-12">
  			<img src="images/img3.jpg" width="100%" height="150px" />
  		</div>
  	</div>
  	<div class="row ">
  		<div class="col-md-4 col-sm-12">
		  	<img src="images/img1.JPG" width="100%" height="150px" />
  		</div>
  		<div class="col-md-4 col-sm-12">
  			<img src="images/img2.jpg" width="100%" height="150px" />
  		</div>
  		<div class="col-md-4 col-sm-12">
  			<img src="images/img3.jpg" width="100%" height="150px" />
  		</div>
  	</div> 	
  </div>
  	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ basePath }/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ basePath }/js/bootstrap.min.js"></script>
 </body>
</html>