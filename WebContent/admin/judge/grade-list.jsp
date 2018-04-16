<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>评分</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link href="/WushuManageSystem/css/table-simple.css" rel="stylesheet">

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
	        <li><a href="/WushuManageSystem/admin/competition-arrange.jsp">竞赛编排</a></li>
	        <li class="active"><a href="/WushuManageSystem/admin/judge/grade-list.jsp">成绩处理</a></li>
	        <li><a href="/WushuManageSystem/admin/print-report.jsp">打印报表</a></li>
	      </ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<ol class="breadcrumb">
	  <li><a href="/WushuManageSystem/index.jsp">首页</a></li>
	  <li><a href="#">成绩处理</a></li>
	</ol>
	
	<div class="container content  col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1">
		<form class="form-inline text-center">
			<div class="form-group form-inline">
			    <label for="competition_name" class="control-label">赛事名称</label>
			   	&ensp;
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
			    <label for="competition_stage_name" class="control-label">比赛阶段</label>&ensp;
			   	<select class="form-control" id="competition_stage_name">
		    		<option>初赛</option>
			  		<option>半决赛</option>
			  		<option>决赛</option>
			    </select>
			  </div>
		</form>
		<hr />
		<table class="table table-bordered">
		  <thead>
		    <tr>
		      <th>序号</th>
		      <th>代表团</th>
		      <th>报项名</th>
		      <th>动作质量得分</th>
		      <th>难度得分</th>
		      <th>演练水平得分</th>
		      <th>裁判长</th>
		      <th>总分</th>
		      <th>名次</th>
		      <th>晋级</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		    	<td>1</td>
		    	<td>张三</td>
		      <td>北京代表团</td>
		      <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			    	<input type="number" class="form-control" />
			    </td>
			    <td><button class="btn btn-primary btn-xs" onclick="promote_or_cancle(this)">晋级</button></td>
		    </tr>
		    <tr>
		    	<td>2</td>
		    	<td>张三</td>
		      	<td>北京代表团</td>
		      	<td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			    	<input type="number" class="form-control" />
			    </td>
			    <td><button class="btn btn-primary btn-xs" onclick="promote_or_cancle(this)">晋级</button></td>
		    </tr>
		    <tr>
		    	<td>3</td>
		    	<td>张三</td>
		      	<td>北京代表团</td>
		      	<td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			    	<input type="number" class="form-control" />
			    </td>
			    <td><button class="btn btn-primary btn-xs" onclick="promote_or_cancle(this)">晋级</button></td>
		    </tr>
		    <tr>
		    	<td>4</td>
		    	<td>张三</td>
		      	<td>北京代表团</td>
		      	<td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			    	<input type="number" class="form-control" />
			    </td>
			    <td><button class="btn btn-primary btn-xs" onclick="promote_or_cancle(this)">晋级</button></td>
		    </tr>
		    <tr>
		    	<td>5</td>
		    	<td>张三</td>
		      	<td>北京代表团</td>
		      	<td>
			      	<input type="number" class="form-control" />
				    </td>
				    <td>
				      	<input type="number" class="form-control" />
				    </td>
				    <td>
				      	<input type="number" class="form-control" />
				    </td>
				    <td>
				      	<input type="number" class="form-control" />
				    </td>
				    <td>
				      	<input type="number" class="form-control" />
				    </td>
				    <td>
			    	<input type="number" class="form-control" />
			    </td>
			    <td><button class="btn btn-primary btn-xs" onclick="promote_or_cancle(this)">晋级</button></td>
		    </tr>
		    <tr>
		    	<td>6</td>
		    	<td>张三</td>
		      	<td>北京代表团</td>
		      	<td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			      	<input type="number" class="form-control" />
			    </td>
			    <td>
			    	<input type="number" class="form-control" />
			    </td>
			    <td><button class="btn btn-primary btn-xs" onclick="promote_or_cancle(this)">晋级</button></td>
		    </tr>
		  </tbody>
		</table>
		
		<button class="btn btn-primary">保存</button>
		<button class="btn btn-primary">排名</button>
	</div>
	
	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	
    	$("table input").parent().css("width","120px");
    	
    	function promote_or_cancle(arg){
    		if($(arg).html()=="晋级"){
    			$(arg).html("取消");
    		}else{
    			$(arg).html("晋级");
    		}
    	}
    </script>
  </body>
</html>