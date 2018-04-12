<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>代表团成员</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link href="/WushuManageSystem/css/table.css" rel="stylesheet">

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
	  <li><a href="#">赛事准备</a></li>
	  <li><a href="/WushuManageSystem/admin/competition/competition-manage.jsp">赛事管理</a></li>
	  <li><a href="#"></a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
			<h4 class="text-center"><b>成员列表</b></h4>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>年龄</th>
						<th>类别</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>张三</td>
						<td>男</td>
						<td>40</td>
						<td>教练</td>
						<td>
							<a href="delegation-member-change.html"><button class="btn btn-xs btn-primary">修改</button></a>
							<button class="btn btn-xs btn-primary remove_member">删除</button>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>张三</td>
						<td>男</td>
						<td>18</td>
						<td>运动员</td>
						<td>
							<a href="delegation-member-change.html"><button class="btn btn-xs btn-primary">修改</button></a>
							<button class="btn btn-xs btn-primary remove_member">删除</button>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td>张三</td>
						<td>男</td>
						<td>40</td>
						<td>运动员</td>
						<td>
							<a href="delegation-member-change.html"><button class="btn btn-xs btn-primary">修改</button></a>
							<button class="btn btn-xs btn-primary remove_member">删除</button>
						</td>
					</tr>
					<tr>
						<td>4</td>
						<td>张三</td>
						<td>男</td>
						<td>40</td>
						<td>运动员</td>
						<td>
							<a href="delegation-member-change.html"><button class="btn btn-xs btn-primary">修改</button></a>
							<button class="btn btn-xs btn-primary remove_member">删除</button>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td>张三</td>
						<td>男</td>
						<td>40</td>
						<td>教练</td>
						<td>
							<a href="delegation-member-change.html"><button class="btn btn-xs btn-primary">修改</button></a>
							<button class="btn btn-xs btn-primary remove_member">删除</button>
						</td>
					</tr>
				</tbody>
			</table>
			<a href="delegation-member-add.html"><button id="delegation_add_member" class="btn btn-primary">添加成员</button></a>
	</div>

  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	/*删除成员*/
    	$(".remove_member").click(function(){
    		$(this).parent().parent().remove();
    	});
    </script>
 </body>
</html>