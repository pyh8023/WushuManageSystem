<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>裁判员管理</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
     <link href="/WushuManageSystem/css/judge-manage.css" rel="stylesheet">

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
		            <li><a href="/WushuManageSystem/admin/competition/competition-manage.jsp" target="_self">赛事管理</a></li>
		            <li><a href="/WushuManageSystem/admin/apply.jsp">报名报项</a></li>
		            <li><a href="/WushuManageSystem/admin/delegation/delegation-manage.jsp">代表团管理</a></li>
		            <li class="active"><a href="/WushuManageSystem/admin/judge/judge-manage.jsp">裁判员管理</a></li>
	          	</ul>
        	</li>
	        <li><a href="/WushuManageSystem/admin/competition-arrange.jsp">竞赛编排</a></li>
	        <li><a href="/WushuManageSystem/admin/judge/grade-list.jsp">成绩处理</a></li>
	        <li><a href="/WushuManageSystem/admin/print-report.jsp">打印报表</a></li>
	      </ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<ol class="breadcrumb">
	  <li><a href="/WushuManageSystem/index.jsp">首页</a></li>
	  <li><a href="#">赛事准备</a></li>
	  <li><a href="#">裁判员管理</a></li>
	</ol>
	
		<div class="container div_judge_manage  col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
			
			<form class="form-inline">
			    <label for="competition_name" class="control-label">赛事名称</label>&ensp;
			  	<select class="form-control" id="competition_name">
			  		<option>第十三届全运会武术套路比赛</option>
			  		<option>第十二届全运会武术套路比赛</option>
			  		<option>第十一届全运会武术套路比赛</option>
			  		<option>第十届全运会武术套路比赛</option>
			  		<option>第九届全运会武术套路比赛</option>
			  		<option>第八届全运会武术套路比赛</option>
			  		<option>第七届全运会武术套路比赛</option>
			  	</select>
			  	&ensp;&ensp;
						<label for="event_name" class="control-label">比赛项目</label>
				   	<select class="form-control" id="event_name">
			    		<option>长拳青少年组女子单项</option>
				  		<option>长拳青少年组男子单项</option>
				  		<option>长拳成年组集体项目</option>
				  		<option>太极拳成年组集体项目</option>
				  		<option>南拳成年组集体项目</option>
				  		<option>太极剑成年组集体项目</option>
				  		<option>太极剑成年组男女混合集体项目</option>
				    </select>
				    &ensp;&ensp;
		    <label for="competition_stage" class="control-label">比赛阶段</label>&ensp;
		   	<select class="form-control" id="competition_stage">
	    		<option>初赛</option>
		  		<option>半决赛</option>
		  		<option>决赛</option>
		    </select>
    	</form>
    	
    	<hr />
			
			 <h4 class="text-center"><b>裁判员列表</b></h4>
			 <table class="table table-bordered" id="judge_list">
		  	<thead>
		  		<tr>
		  			<th></th>
		  			<th>裁判员</th>
		  			<th>性别</th>
		  			<th>岗位</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		  		<tr>
		  			<td>
			      	<a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>
			      	<a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a>
			     </td>
			  		<td>
			  			<input class="form-control" type="text" placeholder="请输入裁判员姓名" value="张三"/>
			  		</td>
			  		<td>
			  			<select class="form-control">
			  				<option>男</option>
			  				<option>女</option>
			  			</select>
			  		</td>
			  		<td>
			  			<select class="form-control">
			  				<option>裁判长</option>
			  				<option>A组裁判员</option>
			  				<option>B组裁判员</option>
			  				<option>C组裁判员</option>
			  			</select>
			  		</td>
			  	</tr>
			  	<tr>
		  			<td>
			      	<a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>
			      	<a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a>
			     </td>
			  		<td>
			  			<input class="form-control" type="text" placeholder="请输入裁判员姓名"/>
			  		</td>
			  		<td>
			  			<select class="form-control">
			  				<option>男</option>
			  				<option>女</option>
			  			</select>
			  		</td>
			  		<td>
			  			<select class="form-control">
			  				<option>裁判长</option>
			  				<option>A组裁判员</option>
			  				<option>B组裁判员</option>
			  				<option>C组裁判员</option>
			  			</select>
			  		</td>
			  	</tr>
		  	</tbody>
		  </table>
		  <button class="btn btn-primary">保存</button>
			 <!--<table class="table table-bordered" id="judge_list">
				<thead>
					<tr>
						<th>编号</th>
						<th>裁判员</th>
						<th>性别</th>
						<th>岗位</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>张三</td>
						<td>男</td>
						<td>A组评分裁判员</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs remove_judge">删除</a>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td>李四</td>
						<td>男</td>
						<td>A组评分裁判员</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs remove_judge">删除</a>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td>张三</td>
						<td>男</td>
						<td>A组评分裁判员</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs">删除</a>
						</td>
					</tr>
					<tr>
						<td>4</td>
						<td>张三</td>
						<td>男</td>
						<td>B组评分裁判员</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs remove_judge">删除</a>
						</td>
					</tr>
					<tr>
						<td>5</td>
						<td>张三</td>
						<td>男</td>
						<td>B组评分裁判员</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs remove_judge">删除</a>
						</td>
					</tr>
					<tr>
						<td>6</td>
						<td>张三</td>
						<td>男</td>
						<td>B组评分裁判员</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs remove_judge">删除</a>
						</td>
					</tr>
					<tr>
						<td>7</td>
						<td>张三</td>
						<td>男</td>
						<td>C组评分裁判员</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs remove_judge">删除</a>
						</td>
					</tr><tr>
						<td>8</td>
						<td>张三</td>
						<td>男</td>
						<td>C组评分裁判员</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs remove_judge">删除</a>
						</td>
					</tr>
					<tr>
						<td>9</td>
						<td>张三</td>
						<td>男</td>
						<td>C组评分裁判员</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs remove_judge">删除</a>
						</td>
					</tr>
					<tr>
						<td>10</td>
						<td>张三</td>
						<td>男</td>
						<td>裁判长</td>
						<td>
							<a class="btn btn-primary btn-xs" href="judge-msg-change.html">修改</a>
							<a class="btn btn-primary btn-xs remove_judge">删除</a>
						</td>
					</tr>
				</tbody>
			</table>
			<a href="judge-add.html" class="btn btn-primary">添加裁判员</a>-->
		</div>
		
		

  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	/*删除成员*/
    	$(".remove_judge").click(function(){
    		$(this).parent().parent().remove();
    	});
    	
    	function remove(arg){
			 	 $(arg).parent().parent().remove();
			}
			 
			function add(arg){
				$(arg).parent().parent().after('<tr><td><a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>'
				+' <a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a></td>'
				+'<td><input class="form-control" type="text" placeholder="请输入裁判员姓名"/></td>'
				+'<td><select class="form-control"><option>男</option><option>女</option></select></td>'
				+'<td><select class="form-control"><option>裁判长</option><option>A组裁判员</option><option>B组裁判员</option><option>C组裁判员</option></select></td>');
			}
    </script>
 </body>
</html>
	  		