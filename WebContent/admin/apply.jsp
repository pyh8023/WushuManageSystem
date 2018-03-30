<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>报名报项</title>

    <!-- Bootstrap -->
    <link href="${ basePath }/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ basePath }/Font-Awesome/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="${ basePath }/css/build.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
    	body{
    		margin-bottom: 70px;
    		background: #EBEBEB;
    		margin-top: 50px;
    	}
    	
    	#content{
    		 text-align: center;
    		 border-radius: 5px;
    		 background: white;
    		 margin-bottom: 50px;
    	}
    
    	
    	#competition_name,#competition_event_name{
    		max-width: 230px;
    	}
    	
    	#applied_event_div,#add_athlet_div{
    	  text-align: center;
    	  padding-top: 20px;
    	  padding-bottom: 20px;
    	} 
    	
    	#add_athlet_div{
    		padding-right: 10px;
    		padding-left: 25px;
    	}
    
    	#applied_event_div{
    		border-right: solid 2px #EBEBEB;
    		padding-left: 10px;
    		padding-right: 25px;
    	}
    	
      table  {
    		background: white;
    		text-align: center;
    		margin-top: 20px;
    	}
    	
    	table thead{
    		background: #337AB7;
    		color: white;
    	}
    	
    	table th,td{
    		text-align: center;
    		vertical-align: middle!important;
    	}

    	#sex_div ,#sex_select{
    		display: inline-block;
    	}
    	
    	.checkbox {
    		margin: 0px;
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
	        <li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">赛事准备 <span class="caret"></span></a>
	          	<ul class="dropdown-menu active">
		            <li><a href="${ basePath }/admin/competition/competition-manage.jsp" target="_self">赛事管理</a></li>
		            <li class="active"><a href="${ basePath }/admin/apply.jsp">报名报项</a></li>
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
	  <li><a href="../index.html">首页</a></li>
	  <li><a href="#">赛前准备</a></li>
	  <li><a href="apply.html">报名报项</a></li>
	</ol>
	
	<div id="content" class="col-md-offset-1 col-md-10"> 
			<div class="container col-md-7 col-sm-12" id="applied_event_div">
			<div>
				<form class="form form-inline">
						<label for="competition_name" class="control-label">赛事名称</label>
				   	<select class="form-control" id="competition_name">
			    		<option>第十三届全运会武术套路比赛</option>
				  		<option>第十二届全运会武术套路比赛</option>
				  		<option>第十一届全运会武术套路比赛</option>
				  		<option>第十届全运会武术套路比赛</option>
				  		<option>第九届全运会武术套路比赛</option>
				  		<option>第八届全运会武术套路比赛</option>
				  		<option>第七届全运会武术套路比赛</option>
				    </select>&ensp;&ensp;
						<label for="competition_event_name" class="control-label">比赛项目</label>
				   	<select class="form-control" id="competition_event_name">
			    		<option>长拳青少年组女子单项</option>
				  		<option>长拳青少年组男子单项</option>
				  		<option>长拳成年组集体项目</option>
				  		<option>太极拳成年组集体项目</option>
				  		<option>南拳成年组集体项目</option>
				  		<option>太极剑成年组集体项目</option>
				  		<option>太极剑成年组男女混合集体项目</option>
				    </select>
				    
	    	</form>
			</div>
			
				<table class="table table-bordered" id="apply_competition">
					<thead>
						<tr>
							<th>编号</th>
							<th>名称</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>上海队</td>
							<td><input type="text" class="form-control" /></td>
							<td>
								<button class="btn btn-primary btn-xs" onclick="remove(this)">删除</button>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>上海队</td>
							<td><input type="text" class="form-control" /></td>
							<td>
								<button class="btn btn-primary btn-xs" onclick="remove(this)">删除</button>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>上海队</td>
							<td><input type="text" class="form-control" /></td>
							<td>
								<button class="btn btn-primary btn-xs" onclick="remove(this)">删除</button>
							</td>
						</tr>
						<tr>
							<td>4</td>
							<td>北京队</td>
							<td><input type="text" class="form-control" /></td>
							<td>
								<button class="btn btn-primary btn-xs" onclick="remove(this)">删除</button>
							</td>
						</tr>
						<tr>
							<td>5</td>
							<td>重庆队</td>
							<td><input type="text" class="form-control" /></td>
							<td>
								<button class="btn btn-primary btn-xs" onclick="remove(this)">删除</button>
							</td>
						</tr>
						<tr>
							<td>6</td>
							<td>上海队</td>
							<td><input type="text" class="form-control" /></td>
							<td>
								<button class="btn btn-primary btn-xs" onclick="remove(this)">删除</button>
							</td>
						</tr>
						<tr>
							<td>7</td>
							<td>上海队</td>
							<td><input type="text" class="form-control" /></td>
							<td>
								<button class="btn btn-primary btn-xs" onclick="remove(this)">删除</button>
							</td>
						</tr>
						<tr>
							<td>8</td>
							<td>上海队</td>
							<td><input type="text" class="form-control" /></td>
							<td>
								<button class="btn btn-primary btn-xs" onclick="remove(this)">删除</button>
							</td>
						</tr>
					</tbody>
				</table>
				<button class="btn btn-primary">提交</button>
			</div>
			
			<div id="add_athlet_div" class="container col-md-5 col-sm-12"> 
				<form class="form-inline">
				    <label for="delegation_name" class="control-label">代表团</label>&ensp;
				    <select class="form-control" id="delegation_name">
				    	<option>上海代表团</option>
				    	<option>北京代表团</option>
				    	<option>南京代表团</option>
				    	<option>武汉代表团</option>
				    	<option>广州代表团</option>
				    	<option>南昌代表团</option>
				    </select>		
					     &ensp;&ensp;
					  <div id="sex_div">
					    <label class="control-label">性别</label>&ensp;
					    <div class="btn-group" role="group" id="sex_select">
						  <button type="button" class="btn btn-default btn-primary">全部</button>
						  <button type="button" class="btn btn-default">男</button>
						  <button type="button" class="btn btn-default">女</button>
							</div>
					  </div>
					  
					  
	    	</form>
	        	
	    	<!--<div class="form-group form-inline" id="apply_event_name_div">
	    		 <label class="control-label" for="apply_event_name">报项名称</label>&ensp;
	    		 <input id="apply_event_name" type="text" class="form-control" placeholder="请输入报项名称" />
	    	</div>-->
	    	
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>编号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>勾选</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>张三</td>
							<td>男</td>
							<td>
								 <div class="checkbox checkbox-primary">
	                    <input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
	                    <label></label>
	                </div>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>女</td>
							<td>
								 <div class="checkbox checkbox-primary">
	                    <input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
	                    <label></label>
	                </div>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>王五</td>
							<td>女</td>
							<td>
								 <div class="checkbox checkbox-primary">
	                    <input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
	                    <label></label>
	                </div>
							</td>
						</tr>
						<tr>
							<td>4</td>
							<td>王五</td>
							<td>女</td>
							<td>
								 <div class="checkbox checkbox-primary">
	                    <input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
	                    <label></label>
	                </div>
							</td>
						</tr>
						<tr>
							<td>5</td>
							<td>王五</td>
							<td>女</td>
							<td>
								 <div class="checkbox checkbox-primary">
	                    <input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
	                    <label></label>
	                </div>
							</td>
						</tr>
						<tr>
							<td>6</td>
							<td>王五</td>
							<td>女</td>
							<td>
								 <div class="checkbox checkbox-primary">
	                    <input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
	                    <label></label>
	                </div>
							</td>
						</tr>
						<tr>
							<td>7</td>
							<td>王五</td>
							<td>女</td>
							<td>
								<div class="checkbox checkbox-primary">
	                    <input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
	                    <label></label>
	                </div>
							</td>
						</tr>
						<tr>
							<td>8</td>
							<td>王五</td>
							<td>男</td>
							<td>
								 <div class="checkbox checkbox-primary">
	                <input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
	                <label></label>
	            	</div>
							</td>
						</tr>
					</tbody>
				</table>
				<button class="btn btn-primary">添加</button>
			</div>
		</div>
	</div>
	
			

  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${ basePath }/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${ basePath }/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	
    	function remove(arg){
    		$(arg).parent().parent().remove();
    	}
    	
    	$("#competition_event_name").change(function(){
    		var selected_option_text = $(this).children("option:selected").text();
    		if(selected_option_text.match("(.)+集体项目") || selected_option_text.match("(.)+团体项目")){
    		   
    		}else{
    			 
    		}
    	});
    	 	
  		$("#sex_select").children().click(function(){
  			$(this).parent().children().each(function(){
  				if($(this).hasClass("btn-primary")){
  					$(this).removeClass("btn-primary");
  				}
  			});
  			$(this).addClass("btn-primary");
  		});
    </script>
 </body>
</html>