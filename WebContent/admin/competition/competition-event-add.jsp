<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<%
	String competition_id = request.getParameter("competition_id");
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加赛事项目</title>

    <!-- Bootstrap -->
    <link href="${ basePath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ basePath }/css/competition-event-add.css" rel="stylesheet">

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
	        <li><a href="${ basePath }/index.jsp">首页<span class="sr-only">(current)</span></a></li>
	        <li class="dropdown active">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">赛事准备 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
		            <li class="active"><a href="${ basePath }/admin/competition/competition-manage.jsp" target="_self">赛事管理</a></li>
		            <li><a href="${ basePath }/admin/apply.jsp">报名报项</a></li>
		            <li><a href="${ basePath }/admin/delegation/delegation-manage.jsp">代表团管理</a></li>
		            <li><a href="${ basePath }/admin/judge/judge-manage.jsp">裁判员管理</a></li>
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
	  <li><a href="../index.html">首页</a></li>
	  <li><a href="#">赛前准备</a></li>
	  <li><a href="${ basePath }/admin/competition/competition-manage.jsp">赛事管理</a></li>
	  <li><a href="${ basePath }/admin/competition/competition-msg.jsp?competition_id=<%=competition_id %>">赛事项目信息</a></li>
	  <li><a href="#">赛事项目添加</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
		<h4 class="text-center"><b>添加赛事项目</b></h4>
		<div class="col-md-6 col-md-offset-3">
	    	<form class="form" action="/WushuManageSystem/servlet/EventServlet?action=add&competition_id=<%=competition_id %>" method="post">
				  <div class="form-group">
				    <label for="event_name" class="control-label">项目名称</label>
				    <div>
				    	<input type="text" class="form-control" id="event_name" name="event_name" placeholder="请输入项目名称" required autofocus>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="event_number" class="control-label">项目编号</label>
				    <div>
				    	<input type="text" class="form-control" id="event_number"  name="event_number" placeholder="请输入项目编号" required>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="event_type" class="control-label">项目类别</label>
				    <div>
				    	<select class="form-control" id="event_type" name="event_type">
				    		<option>单人单项</option>
				    		<option>集体项目</option>
				    		<option>团体项目</option>
				    		<option>全能</option>
				    	</select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="event_group" class="control-label">项目组别</label>
				    <div>
				    	<select class="form-control" id="event_group" name="event_group">
				    		<option>成年组</option>
				    		<option>青少年组</option>
				    		<option>儿童组</option>
				    	</select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="event_sex" class="control-label">性别</label>
				    <div>
				    	<select class="form-control" id="event_sex" name="event_sex">
				    		<option>男子</option>
				    		<option>女子</option>
				    		<option>男女混合</option>
				    		<option>男女不限</option>
			    		</select>
				    </div>
				  </div>
				  <div class="form-group" id="event_max_athlet_num_div">
				    <label for="max_athlet_num" class="control-label">最大运动员人数</label>
				    <div>
				    	<input type="number" class="form-control" id="max_athlet_num" name="max_athlet_num" placeholder="请输入最大运动员人数" required/>
				    </div>
				  </div>
				  <div class="form-group" id="event_min_athlet_num_div">
				    <label for="min_athlet_num" class="control-label">最小运动员人数</label>
				    <div>
				    	<input type="number" class="form-control" id="min_athlet_num" name="min_athlet_num" placeholder="请输入最小运动员人数" required/>
				    </div>
				  </div>
				  <div class="form-group" id="event_max_male_athlet_num_div">
				    <label for="max_male_athlet_num" class="control-label">最大男运动员人数</label>
				    <div>
				    	<input type="number" class="form-control" id="max_male_athlet_num" name="max_male_athlet_num"  placeholder="请输入最大男运动员人数"/>
				    </div>
				  </div>
				  <div class="form-group" id="event_min_male_athlet_num_div">
				    <label for="min_male_athlet_num" class="control-label">最小男运动员人数</label>
				    <div>
				    	<input type="number" class="form-control" id="min_male_athlet_num" name="min_male_athlet_num" placeholder="请输入最小男运动员人数"/>
				    </div>
				  </div>
				  <div class="form-group" id="event_max_female_athlet_num_div">
				    <label for="max_female_athlet_num" class="control-label">最大女运动员人数</label>
				    <div>
				    	<input type="number" class="form-control" id="max_female_athlet_num" name="max_female_athlet_num" placeholder="请输入最大女运动员人数"/>
				    </div>
				  </div>
				  <div class="form-group" id="event_min_female_athlet_num_div">
				    <label for="min_female_athlet_num" class="control-label">最小女运动员人数</label>
				    <div>
				    	<input type="number" class="form-control" id="min_female_athlet_num" name="min_female_athlet_num" placeholder="请输入最小女运动员人数"/>
				    </div>
				  </div>
				  <div>
				  	<button type="submit" class="btn btn-primary col-md-12" id="add_event_btn">添加</button>
				  </div>
				</form>
	    </div>
	</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ basePath }/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ basePath }/js/bootstrap.min.js"></script>
    <script src="${ basePath }/customjs/competition-event.js"></script>
    <script type="text/javascript">
	    var msg = "${ add_competition_msg }";
		 if(msg !=null && msg!=""){
			 alert(msg);
		 }
    </script>
 </body>
</html>