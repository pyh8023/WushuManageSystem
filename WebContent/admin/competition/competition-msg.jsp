<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>赛事项目信息</title>

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
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<!--<li><a href="index.html">首页</a></li>-->
	        <li><a href="${ basePath }/index.html">首页<span class="sr-only">(current)</span></a></li>
	        <li class="dropdown active">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">赛事准备 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
	            <li class="active"><a href="${ basePath }/admin/competition-manage.html">赛事管理</a></li>
	            <li><a href="${ basePath }/admin/apply.jsp">报名报项</a></li>
	            <li><a href="${ basePath }/delegation/delegation-manage.html">代表团管理</a></li>
	            <li><a href="${ basePath }/judge/judge-manage.html">裁判员管理</a></li>
	          	</ul>
        	</li>
	        <li><a href="${ basePath }/admin/competition-arrange-list.html">竞赛编排</a></li>
	        <li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">成绩处理 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
	             <li><a href="${ basePath }/judge/grade-list.html">录入成绩</a></li>
	            <li><a href="${ basePath }/admin/stage-msg.html">晋级信息</a></li>
	           </ul>
        	</li>
					<li><a href="${ basePath }/admin/print-report.html">打印报表</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<ol class="breadcrumb">
	  <li><a href="${ basePath }/index.html">首页</a></li>
	  <li><a href="#">赛前准备</a></li>
	  <li><a href="competition-manage.jsp">赛事管理</a></li>
	  <li><a href="competition-msg.jsp">赛事项目信息</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4><b>赛事项目列表</b></h4>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>编号</th>
					<th>名称</th>
					<th>类别</th>
					<th>组别</th>
					<th>性别</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>td123</td>
					<td><a href="competition-stage.html">长拳青年女子单项</a></td>
					<td>单人单项</td>
					<td>青年组</td>
					<td>女子组</td>
					<td>
						<a href="competition-event-change.html" class="btn btn-primary btn-xs">修改</a>
						<a class="btn btn-primary btn-xs remove">删除</a>
					</td>
				</tr>
				<tr>
					<td>td124</td>
					<td><a href="competition-stage.html">长拳青年女子单项</a></td>
					<td>单人单项</td>
					<td>青年组</td>
					<td>女子组</td>
					<td>
						<a href="competition-event-change.html" class="btn btn-primary btn-xs">修改</a>
						<a class="btn btn-primary btn-xs remove">删除</a>
					</td>
				</tr>
				<tr>
					<td>td125</td>
					<td><a href="competition-stage.html">长拳青年女子单项</a></td>
					<td>单人单项</td>
					<td>青年组</td>
					<td>女子组</td>
					<td>
						<a href="competition-event-change.html" class="btn btn-primary btn-xs">修改</a>
						<a class="btn btn-primary btn-xs remove">删除</a>
					</td>
				</tr>
				<tr>
					<td>td126</td>
					<td><a href="competition-stage.html">长拳青年女子单项</a></td>
					<td>单人单项</td>
					<td>青年组</td>
					<td>女子组</td>
					<td>
						<a href="competition-event-change.html" class="btn btn-primary btn-xs">修改</a>
						<a class="btn btn-primary btn-xs remove">删除</a>
					</td>
				</tr>
				<tr>
					<td>td127</td>
					<td><a href="competition-stage.html">长拳青年女子单项</a></td>
					<td>单人单项</td>
					<td>青年组</td>
					<td>女子组</td>
					<td>
						<a href="competition-event-change.html" class="btn btn-primary btn-xs">修改</a>
						<a class="btn btn-primary btn-xs remove">删除</a>
					</td>
				</tr>
				<tr>
					<td>td128</td>
					<td><a href="competition-stage.html">长拳青年女子单项</a></td>
					<td>单人单项</td>
					<td>青年组</td>
					<td>女子组</td>
					<td>
						<a href="competition-event-change.html" class="btn btn-primary btn-xs">修改</a>
						<a class="btn btn-primary btn-xs remove">删除</a>
					</td>
				</tr>
				<tr>
					<td>td129</td>
					<td><a href="competition-stage.html">长拳青年女子单项</a></td>
					<td>单人单项</td>
					<td>青年组</td>
					<td>女子组</td>
					<td>
						<a href="competition-event-change.html" class="btn btn-primary btn-xs">修改</a>
						<a class="btn btn-primary btn-xs remove">删除</a>
					</td>
				</tr>
			</tbody>
		</table>
		<a class="btn btn-primary" href="competition-event-add.html">添加项目</a>
	</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ basePath }/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ basePath }/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	/*删除项目*/
    	$(".remove").click(function(){
    		$(this).parent().parent().remove();
    	});
    </script>
 </body>
</html>