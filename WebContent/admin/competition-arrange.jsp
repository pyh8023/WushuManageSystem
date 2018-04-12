<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>竞赛编排</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WushuManageSystem/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="/WushuManageSystem/css/competition-arrange.css" />
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>

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
	        <li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">赛事准备 <span class="caret"></span></a>
	          	<ul class="dropdown-menu">
		            <li><a href="/WushuManageSystem/admin/competition/competition-manage.jsp" target="_self">赛事管理</a></li>
		            <li><a href="/WushuManageSystem/admin/apply.jsp">报名报项</a></li>
		            <li><a href="/WushuManageSystem/admin/delegation/delegation-manage.jsp">代表团管理</a></li>
		            <li><a href="/WushuManageSystem/admin/judge/judge-manage.jsp">裁判员管理</a></li>
	          	</ul>
        	</li>
	        <li class="active"><a href="/WushuManageSystem/admin/competition-arrange.jsp">竞赛编排</a></li>
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
	  <li><a href="#">竞赛编排</a></li>
	</ol>
	
	<div class="container competition_arrange_div  col-md-8 col-md-offset-2">
		
		<form class="form form-inline">
			<label for="competition_name" class="control-label">赛事名称</label>&ensp;
		   	<select class="form-control" id="competition_name">
	    		<option>第十三届全运会武术套路比赛</option>
		  		<option>第十二届全运会武术套路比赛</option>
		  		<option>第十一届全运会武术套路比赛</option>
		  		<option>第十届全运会武术套路比赛</option>
		  		<option>第九届全运会武术套路比赛</option>
		  		<option>第八届全运会武术套路比赛</option>
		  		<option>第七届全运会武术套路比赛</option>
		    </select>&ensp;&ensp;
				<label for="competition_event_name" class="control-label">比赛项目</label>&ensp;
		   	<select class="form-control" id="competition_event_name">
	    		<option>长拳青少年组女子单项</option>
		  		<option>长拳青少年男组子单项</option>
		  		<option>长拳成年组集体项目</option>
		  		<option>太极拳成年组集体项目</option>
		  		<option>南拳成年组集体项目</option>
		  		<option>太极剑成年组集体项目</option>
		  		<option>太极剑成年组男女混合集体项目</option>
		    </select>&ensp;&ensp;
		    <label for="competition_stage" class="control-label">比赛阶段</label>&ensp;
		   	<select class="form-control" id="competition_stage">
	    		<option>初赛</option>
		  		<option>半决赛</option>
		  		<option>决赛</option>
		    </select>
	 </form>
		
	   <hr />
	    	<table class="table table-bordered">
		  	<thead>
		  		<tr>
		  			<th></th>
		  			<th>分组</th>
		  			<th>时间</th>
		  			<th>场地</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		  		<tr>
		  			<td>
			      	<a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>
			      	<a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a>
			     </td>
			  		<td><input class="form-control" type="number" placeholder="请输入第几组" /></td>
			  		<td>
			  			<form class="form-inline">
			  				<input class="form-control datetimepicker" placeholder="起始时间"/>
			  				&ensp;到&ensp;
			  				<input class="form-control datetimepicker" placeholder="结束时间"/>
			  			</form>
			  		</td>
			  		<td><input class="form-control" placeholder="请输入比赛场地"/></td>
			  	</tr>
			  	<tr>
		  			<td>
			      	<a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>
			      	<a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a>
			     </td>
			  		<td><input class="form-control" type="number" placeholder="请输入第几组" /></td>
			  		<td>
			  			<form class="form-inline">
			  				<input class="form-control datetimepicker" placeholder="起始时间"/>
			  				&ensp;到&ensp;
			  				<input class="form-control datetimepicker" placeholder="结束时间"/>
			  			</form>
			  		</td>
			  		<td><input class="form-control" placeholder="请输入比赛场地"/></td>
			  	</tr>
		  	</tbody>
		  </table>
		  <button class="btn btn-primary">保存</button>
		  
		  
		  <hr />
		  <h4 class="text-center"><b>出场顺序</b></h4>
	    	<table class="table table-bordered">
		  	<thead>
		  		<tr>
		  			<th>序号</th>
		  			<th>代表团</th>
		  			<th>报项名</th>
		  			<th>分组</th>
		  		</tr>
		  	</thead>
		  	<tbody>
		  		<tr>
		  			<td><input class="form-control" type="number" placeholder="请输入序号" /></td>
		  			<td>上海代表团</td>
			  		<td>上海队</td>
			  		<td><input class="form-control" type="number" placeholder="请输入第几组" /></td>
			  	</tr>
			  	<tr>
		  			<td><input class="form-control" type="number" placeholder="请输入序号" /></td>
		  			<td>北京代表团</td>
			  		<td>北京队</td>
			  		<td><input class="form-control" type="number" placeholder="请输入第几组" /></td>
			  	</tr>
			  	<tr>
		  			<td><input class="form-control" type="number" placeholder="请输入序号" /></td>
		  			<td>武汉代表团</td>
			  		<td>武汉队</td>
			  		<td><input class="form-control" type="number" placeholder="请输入第几组" /></td>
			  	</tr>
			  	<tr>
		  			<td><input class="form-control" type="number" placeholder="请输入序号" /></td>
		  			<td>南京代表团</td>
			  		<td>南京队</td>
			  		<td><input class="form-control" type="number" placeholder="请输入第几组" /></td>
			  	</tr>
		  	</tbody>
		  </table>
		  <button class="btn btn-primary">保存</button>
		  <button class="btn btn-primary">抽签</button>
	  </div>
	    
	<script src="/WushuManageSystem/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/WushuManageSystem/js/bootstrap-datetimepicker.zh-CN.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		
    	 $("tr").eq(0).css("width","60px");
    	 
    	 $("table tr").each(function(){
    	 		$(this).children().eq(5).css("padding-top","10px");
    	 });
			
			 $(".datetimepicker").datetimepicker({
			 	format:"yyyy-mm-dd hh:ii",
			 	language: "zh-CN",
			 	autoclose:true
			 });
			 
			 });
			 
			 function remove(arg){
			 	 $(arg).parent().parent().remove();
			 }
			 
			function add(arg){
				$(arg).parent().parent().after('<tr><td><a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>'
				+' <a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a></td>'
				+'<td><input class="form-control" type="text" placeholder="请输入项目名称"/></td>'
				+'<td><select class="form-control"><option>上午场</option><option>下午场</option><option>晚上场</option></select></td>'
				+'<td><form class="form-inline"><input class="form-control datetimepicker" placeholder="起始时间"/>&ensp;&ensp;到&ensp;&ensp;<input class="form-control datetimepicker" placeholder="结束时间"/></form></td>'
				+'<td><input class="form-control" placeholder="请输入比赛场地"/></td>'
				+'<td><a class="btn btn-primary btn-sm" href="competition-athlet-order.html">出场顺序</a> <a class="btn btn-primary btn-sm" href="competition-judge-arrange.html">裁判编排</a></td></tr>');
			}
    </script>
 </body>
</html>
