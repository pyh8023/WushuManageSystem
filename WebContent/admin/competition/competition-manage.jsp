<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>赛事管理</title>

    <!-- Bootstrap -->
    <link href="${ basePath }/css/bootstrap.min.css" rel="stylesheet">

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
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4><b>赛事列表</b></h4>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>名称</th>
					<th>时间</th>
					<th>地点</th>
					<th>场馆</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="competition-msg.html">第十三届全运会武术套路比赛</a></td>
					<td>2018-02-15 至 2018-03-01</td>
					<td>北京</td>
					<td>北京朝阳区武术场馆</td>
					<td>
						<button class="btn btn-primary btn-xs" id="update_competition_btn">修改</button>
					</td>
				</tr>
				<tr>
					<td><a href="competition-msg.html">第十二届全运会武术套路比赛</a></td>
					<td>2018-02-15 至 2018-03-01</td>
					<td>北京</td>
					<td>北京朝阳区武术场馆</td>
					<td>
						<button class="btn btn-primary btn-xs" id="update_competition_btn">修改</button>
					</td>
				</tr>
				<tr>
					<td><a href="competition-msg.html">第十一届全运会武术套路比赛</a></td>
					<td>2018-02-15 至 2018-03-01</td>
					<td>北京</td>
					<td>北京朝阳区武术场馆</td>
					<td>
						<button class="btn btn-primary btn-xs" id="update_competition_btn">修改</button>
					</td>
				</tr>
				<tr>
					<td><a href="competition-msg.html">第十届全运会武术套路比赛</a></td>
					<td>2018-02-15 至 2018-03-01</td>
					<td>北京</td>
					<td>北京朝阳区武术场馆</td>
					<td>
						<button class="btn btn-primary btn-xs" id="update_competition_btn">修改</button>
					</td>
				</tr>
			</tbody>
		</table>
		<a class="btn btn-primary" href="competition-add.html">添加赛事</a>
	</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ basePath }/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ basePath }/js/bootstrap.min.js"></script>
    
 </body>
</html>