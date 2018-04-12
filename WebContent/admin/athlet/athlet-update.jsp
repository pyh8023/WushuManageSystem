<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>代表团成员修改</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
    	body{
    		margin-bottom: 70px;
    	}
    	
    	#delegation_manage{
    		margin-top: 80px;
    	}
    	
    	.sidebar nav{
    		position: fixed;
    	}
    	
    	#delegation_manage .sidebar #active_li {
    		background: #337AB7;
    	}
    	
    	#delegation_manage .sidebar #active_li a {
    		color: white;
    	}
    	
    	#delegation_manage .sidebar #active_li a:hover{
    		background: #337AB7;
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
	        <li><a href="../index.html">首页<span class="sr-only">(current)</span></a></li>
	        <li class="dropdown active">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">赛事准备 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
	            <li><a href="../admin/competition-manage.html">赛事管理</a></li>
	            <li><a href="../admin/apply.html">报名报项</a></li>
	            <li class="active"><a href="../delegation/delegation-manage.html">代表团管理</a></li>
	            <li><a href="../judge/judge-manage.html">裁判员管理</a></li>
	          	</ul>
        	</li>
	        <li><a href="../admin/competition-arrange-list.html">竞赛编排</a></li>
	        <li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">成绩处理 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
	             <li><a href="../judge/grade-list.html">录入成绩</a></li>
	            <li><a href="../admin/stage-msg.html">晋级信息</a></li>
	           </ul>
        	</li>
					<li><a href="../admin/print-report.html">打印报表</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<div class="container bs-docs-container" id="delegation_manage">

    <div class="row">
	
		<div class="col-md-2 col-md-offset-1 sidebar" role="complementary">
	    <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm">
	      <ul class="nav bs-docs-sidenav sidebar_ul">
	      	<li><a href="delegation-manage.html">代表团信息</a></li>
	      	<li id="active_li"><a href="delegation-member.html">代表团成员</a></li>
	      	<li><a href="delegation-competition-info.html">参赛项目</a></li>
	      </ul>
	    </nav>
	 	</div>
			
		<div class="col-md-offset-1 col-md-5" role="main" id="content">
			<h4 class="text-center"><b>修改成员信息</b></h4>
			<form class="form">
				<div class="form-group">
					   <label for="delegation_member_name" class="control-label">姓名</label>
					    <div>
					    	<input type="text" class="form-control" id="delegation_member_name" placeholder="请输入成员姓名" value="张三" required autofocus>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="delegation_member_sex" class="control-label">性别</label>
					    <div>
					    	<select class="form-control" id="delegation_member_sex">
					    		<option>男</option>
					    		<option>女</option>
					    	</select>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="delegation_contact" class="control-label">年龄</label>
					    <div>
					    	<input type="number" class="form-control" id="delegation_contact" placeholder="请输入年龄" value="40" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="delegation_member_type" class="control-label">成员类型</label>
					    <div>
					    	<select class="form-control">
					    		<option>运动员</option>
					    		<option selected="selected">教练</option>
					    		<option>领队</option>
					    	</select>
					    </div>
					  </div>
					  <div class="form-group">
					    <button class="btn btn-primary col-md-12">修改</button>
					  </div>
			</form>
		</div>
			

		</div>
	</div>

  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
 </body>
</html>