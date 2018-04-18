<%@page import="java.util.ArrayList"%>
<%@page import="com.pan.competition.service.*"%>
<%@page import="com.pan.competition.bean.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<% 
	CompetitionService competitionService = new CompetitionService();
	List<MenuItem> competitionNames = competitionService.getCompetitionName();
	String competition_id = null,event_id=null,stage_id=null;
	List<MenuItem> eventNames=null,stageNames=null,groupNums=null;
	List<Judge> judgeList = null;
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies ){
		if(cookie.getName().equals("competition_id")){
			competition_id = cookie.getValue();
		}else if(cookie.getName().equals("event_id")){
			event_id = cookie.getValue();
		}else if(cookie.getName().equals("stage_id")){
			stage_id = cookie.getValue();
		}
	}
	if(competitionNames.size()!=0){
		if(competition_id == null||"null".equals(competition_id)){
			competition_id = competitionNames.get(0).getId();
		}
		//获取项目列表
		EventService eventService = new EventService();
		eventNames = eventService.getEventNameList(competition_id).getData();
		if(eventNames.size()!=0){
			if(event_id == null||"null".equals(event_id)){
				event_id = eventNames.get(0).getId();
			}
			StageService stageService = new StageService();
			stageNames = stageService.getStageNameList(event_id).getData();
			if(stageNames.size()!=0){
				if(stage_id == null||"null".equals(stage_id) ){
					stage_id = stageNames.get(0).getId();
				}
				JudgeService judgeService = new JudgeService();
				judgeList = judgeService.getJudgeList(stage_id);
				GroupService groupService = new GroupService();
				groupNums = groupService.getGroupNumList(stage_id);
			}
		}
	}
	request.setAttribute("competition_id", competition_id);
	request.setAttribute("event_id", event_id);
	request.setAttribute("stage_id", stage_id);
	if(eventNames == null)
		eventNames = new ArrayList<>();
	if(stageNames == null)
		stageNames = new ArrayList<>();
	if(judgeList == null)
		judgeList = new ArrayList<>();
	if(groupNums == null)
		groupNums = new ArrayList<>();
	request.setAttribute("judgeList", judgeList);
	request.setAttribute("groupNums", groupNums);
%>
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
			<form class="form form-inline">
					<label for="competition_name_select" class="control-label">赛事名称</label>&ensp;
				   	<select class="form-control" id="competition_name_select">
				   		<c:forEach var="competition" items="<%=competitionNames %>">
				   			<option value="${competition.id }">${competition.name }</option>
				   		</c:forEach>
				    </select>&ensp;&ensp;
						<label for="event_name_select" class="control-label">比赛项目</label>&ensp;
					   	<select class="form-control" id="event_name_select">
				    		<c:forEach var="event" items="<%=eventNames %>">
					   			<option value="${event.id }">${event.name }</option>
					   		</c:forEach>
					    </select>&ensp;&ensp;
				    <label for="stage_name_select" class="control-label">比赛阶段</label>&ensp;
				   	<select class="form-control" id="stage_name_select">
			    		<c:forEach var="stage" items="<%=stageNames %>">
				   			<option value="${stage.id }">${stage.name }</option>
				   		</c:forEach>
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
		  			<th>分组</th>
		  		</tr>
		  	</thead>
		  	<tbody id="judge_tb">
		  		<c:if test="${judgeList.size()==0 }">
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
				  		<td>
				  			<select class="form-control">
				  				<c:forEach var="group_num" items="${groupNums }">
				  					<option>第${group_num.name }组</option>
				  				</c:forEach>
				  			</select>
				  		</td>
				  	</tr>
		  		</c:if>
		  		<c:if test="${judgeList.size()!=0 }">
		  		<c:forEach var="judge" items="${judgeList }">
		  			<tr>
			  			<td>
				      	<a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>
				      	<a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a>
				     </td>
				  		<td>
				  			<input class="form-control" type="text" placeholder="请输入裁判员姓名" value="${judge.name }"/>
				  		</td>
				  		<td>
				  			<select class="form-control">
				  				<option <c:if test="${judge.sex eq '男' }">selected</c:if>>男</option>
				  				<option <c:if test="${judge.sex eq '女' }">selected</c:if>>女</option>
				  			</select>
				  		</td>
				  		<td>
				  			<select class="form-control">
				  				<option <c:if test="${judge.job eq '裁判长' }">selected</c:if>>裁判长</option>
				  				<option <c:if test="${judge.job eq 'A组裁判员' }">selected</c:if>>A组裁判员</option>
				  				<option <c:if test="${judge.job eq 'B组裁判员' }">selected</c:if>>B组裁判员</option>
				  				<option <c:if test="${judge.job eq 'C组裁判员' }">selected</c:if>>C组裁判员</option>
				  			</select>
				  		</td>
				  		<td>
				  			<select class="form-control">
				  				<c:forEach var="group_num" items="${groupNums }">
				  					<option>第${group_num.name }组</option>
				  				</c:forEach>
				  			</select>
				  		</td>
				  	</tr>
		  		</c:forEach>
		  		</c:if>
		  	</tbody>
		  </table>
		  <button class="btn btn-primary" id="save_judge_btn">保存</button>
		</div>
		
		

  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script src="/WushuManageSystem/js/jquery.cookie.js"></script>
    <script type="text/javascript">
    
	 	 //设置select选中内容
		if("${competition_id}" != ""){
			$("#competition_name_select option[value='${competition_id}']").attr("selected",true);
		}
		if("${event_id}" != ""){
			$("#event_name_select option[value='${event_id}']").attr("selected",true);
		}
		if("${stage_id}" != ""){
			$("#stage_name_select option[value='${stage_id}']").attr("selected",true);
		}
    	/*删除成员*/
    	function remove(arg){
			 $(arg).parent().parent().remove();
		}
			 
		function add(arg){
			$(arg).parent().parent().after('<tr><td><a onclick="add(this)"><span class="div_plus_icon glyphicon glyphicon-plus" aria-hidden="true"></span></a>'
			+' <a onclick="remove(this)"><span class="div_minus_icon glyphicon glyphicon-minus" aria-hidden="true"></span></a></td>'
			+'<td><input class="form-control" type="text" placeholder="请输入裁判员姓名"/></td>'
			+'<td><select class="form-control"><option>男</option><option>女</option></select></td>'
			+'<td><select class="form-control"><option>裁判长</option><option>A组裁判员</option><option>B组裁判员</option><option>C组裁判员</option></select></td>'
			+'<td><select class="form-control"><c:forEach var="group_num" items="${groupNums }"><option>第${group_num.name }组</option></c:forEach></select></td></tr>');
		}
		
		$("#save_judge_btn").click(function(){
			var json = "[";
			var stage_id = "${stage_id}";
			$("#judge_tb").children().each(function(){
				var name = $(this).children().eq(1).children().val();
				var sex = $(this).children().eq(2).children().val();
				var job = $(this).children().eq(3).children().val();
				if(name == ""){
					alert("姓名不能为空");
					return false;
				}
				json = json + '{"name":"'+name+'","sex":"'+sex+'","job":"'+job+'",stage_id:"'+stage_id+'"},';
			});
			if(json == "[")
				return;
			json = json.substring(0,json.length-1)+']';
			$.post("/WushuManageSystem/servlet/JudgeServlet",{data:json},function(data){
    			alert(data);
    		});
		});
		
		$("#competition_name_select").change(function(){
    		$.cookie('competition_id', $(this).val());
        	$.cookie('event_id', null);
        	$.cookie('stage_id', null);
        	window.location.reload();
    	});
    	
		$("#event_name_select").change(function(){
        	$.cookie('event_id', $(this).val());
        	$.cookie('stage_id', null);
        	window.location.reload();
    	});
		
		$("#stage_name_select").change(function(){
        	$.cookie('stage_id', $(this).val());
        	window.location.reload();
    	});
    </script>
 </body>
</html>
	  		