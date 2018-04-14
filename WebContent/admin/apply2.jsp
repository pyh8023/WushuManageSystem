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
	String competition_id = (String)session.getAttribute("competition_id");
	Cookie[] cookies = request.getCookies();
	if(competitionNames.size()!=0){
		if(competition_id == null){
			competition_id = competitionNames.get(0).getId();
			session.setAttribute("competition_id", competition_id);
		}
		//获取项目列表
		EventService eventService = new EventService();
		List<Event> events = eventService.getEventList(competition_id).getData();
		request.setAttribute("events", events);
		if(events.size()!=0){
			int event_index;
			if(session.getAttribute("event_index")!=null){
				event_index = (Integer) session.getAttribute("event_index");
			}else{
				event_index = 0;
			}
			session.setAttribute("event_index", event_index);
			//获取报项信息
			ApplyService applyService = new ApplyService();
			List<Apply> applyList = applyService.getApplyList(events.get(event_index).getId());
			request.setAttribute("applyList", applyList);
		}
		//获取代表团列表
		DelegationService delegationService = new DelegationService();
		List<MenuItem> delegationNames = delegationService.getDelegationNameList(competition_id);
		request.setAttribute("delegationNames", delegationNames);
		String delegation_id = (String)session.getAttribute("delegation_id");
		if(delegationNames.size()!=0){
			if(delegation_id ==null){
				delegation_id = delegationNames.get(0).getId();
				session.setAttribute("delegationSelected", delegation_id);
			}
			AthletService athletService = new AthletService();
			List<Athlet> athlets = athletService.getAthletList(delegation_id);
			request.setAttribute("athlets", athlets);
		}
	}
	request.setAttribute("applyIndex", 0);
	request.setAttribute("athletIndex", 0);
%>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>报名报项</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WushuManageSystem/Font-Awesome/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="/WushuManageSystem/css/build.css" />
	<link rel="stylesheet" href="/WushuManageSystem/css/apply.css" />

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
	          	<ul class="dropdown-menu active">
		            <li><a href="/WushuManageSystem/admin/competition/competition-manage.jsp" target="_self">赛事管理</a></li>
		            <li class="active"><a href="/WushuManageSystem/admin/apply.jsp">报名报项</a></li>
		            <li><a href="/WushuManageSystem/admin/delegation/delegation-manage.jsp">代表团管理</a></li>
		            <li><a href="/WushuManageSystem/admin/judge/judge-manage.html">裁判员管理</a></li>
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
	  <li><a href="#">赛前准备</a></li>
	  <li><a href="/WushuManageSystem/admin/apply.jsp">报名报项</a></li>
	</ol>
	
	<div id="content" class="col-md-offset-1 col-md-10"> 
			<div class="container col-md-7 col-sm-12" id="applied_event_div">
			<div>
				<form class="form form-inline">
					<label for="competition_name_select" class="control-label">赛事名称</label>
				   	<select class="form-control" id="competition_name_select">
			    		<c:forEach var="competition" items="<%=competitionNames %>">
			    			<option value="${competition.id }">${competition.name }</option>>
			    		</c:forEach>
				    </select>&ensp;&ensp;
					<label for="event_name_select" class="control-label">比赛项目</label>
				   	<select class="form-control" id="event_name_select">
			    		<c:forEach var="event" items="${events }">
			    			<option value="${event.id }">${event.name }</option>>
			    		</c:forEach>
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
				<tbody id="apply_tb">
					<c:forEach var="apply" items="${applyList }">
						<tr id="${apply.id }">
							<td>${applyIndex= applyIndex+1}</td>
							<td><input type="text" class="form-control" value="${apply.apply_name }"/></td>
							<td><input type="text" class="form-control" value="${apply.remark }"/></td>
							<td>
								<button class="btn btn-primary btn-xs" onclick="remove(this)">删除</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
			<%-- <c:if test="${applyList.size()==0 }">
				<p>该项目报项为空</p>
			</c:if> --%>
			
			<button class="btn btn-primary <c:if test="${events.size()==0 || delegationNames.size()==0} ">disabled</c:if>">提交</button>
		</div>
			
			
			<div id="add_athlet_div" class="container col-md-5 col-sm-12"> 
				<form class="form-inline">
				    <label for="delegation_name_select" class="control-label">代表团</label>&ensp;
				    <select class="form-control" id="delegation_name_select">
				    	<c:forEach var="delegation" items="${delegationNames }">
			    			<option value="${delegation.id }">${delegation.name }</option>>
			    		</c:forEach>
				    </select>		
					     &ensp;&ensp;
				  <div id="sex_div">
				    <label class="control-label">性别</label>&ensp;
				    <div class="btn-group" role="group" id="sex_select">
					  <button id="all_sex_btn" type="button" class="btn btn-default">全部</button>
					  <button id="male_btn" type="button" class="btn btn-default">男</button>
					  <button id="female_btn" type="button" class="btn btn-default">女</button>
					</div>
				  </div>
	    	</form>
	    	
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>年龄</th>
						<th>勾选</th>
					</tr>
				</thead>
				<tbody id="athlet_apply_item_tb">
					<c:forEach var="athlet" items="${athlets }">
						<c:if test="${events[event_index].sex eq '男子' && athlet.sex eq '男'}">
							<tr id="${athlet.id }">
								<td>${athletIndex = athletIndex+1 }</td>
								<td>${athlet.name }</td>
								<td>${athlet.sex }</td>
								<td>${athlet.age }</td>
								<td>
									<div class="checkbox checkbox-primary">
			                			<input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
			                    		<label></label>
			               			</div>
								</td>
							</tr>
						</c:if>
						<c:if test="${events[event_index].sex eq '女子' && athlet.sex eq '女'}">
							<tr id="${athlet.id }">
								<td>${athletIndex = athletIndex+1 }</td>
								<td>${athlet.name }</td>
								<td>${athlet.sex }</td>
								<td>${athlet.age }</td>
								<td>
									<div class="checkbox checkbox-primary">
			                			<input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
			                    		<label></label>
			               			</div>
								</td>
							</tr>
						</c:if>
						<c:if test="${events[event_index].sex != '男子' && events[event_index].sex != '女子'}">
							<tr id="${athlet.id }">
								<td>${athletIndex = athletIndex+1 }</td>
								<td>${athlet.name }</td>
								<td>${athlet.sex }</td>
								<td>${athlet.age }</td>
								<td>
									<div class="checkbox checkbox-primary">
			                			<input type="checkbox" class="styled styled-primary"  aria-label="Single checkbox Two">
			                    		<label></label>
			               			</div>
								</td>
							</tr>
						</c:if> 
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${athlets.size()==0 }">
				<p>代表团运动员为空</p>
			</c:if>
			<button class="btn btn-primary <c:if test="${events.size()==0 || delegationNames.size()==0 ||athlets.size()==0}">disabled</c:if>" id="add_apply_btn">添加</button>
			</div>
		</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script src="/WushuManageSystem/js/jquerysession.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	  init();
    });
     
    function init(){
    	var sex_select =  $("#sex_select");
    	var event_sex = "${events[event_index].sex}";
    	if(event_sex == "男子"){
    		sex_select.children().eq(1).addClass("btn-primary");
    		sex_select.children().eq(0).addClass("disabled");
    		sex_select.children().eq(2).addClass("disabled");
    	}else if(event_sex == "女子"){
    		sex_select.children().eq(2).addClass("btn-primary");
    		sex_select.children().eq(0).addClass("disabled");
    		sex_select.children().eq(1).addClass("disabled");
    	}else{
    		sex_select.children().eq(0).addClass("btn-primary");
    		sex_select.children().click(function(){
      			$(this).parent().children().each(function(){
      				if($(this).hasClass("btn-primary")){
      					$(this).removeClass("btn-primary");
      				}
      			});
      			$(this).addClass("btn-primary");
      		});
    	}
     }
    
    $("#competition_name_select").change(function(){
    	 //$.cookie('competition_id', $(this).val());
    	 $.session.set('competition_id', $(this).val());
    	 alert($.session.get('competition_id'));
    	 window.location.onload();
    });
    
    	$("#add_apply_btn").click(function(){
    		if("${events[event_index].type}" == "单人单项" ||"${events[event_index].type}" == "全能"){
    			$("#athlet_apply_item_tb").children().each(function(){
    				var name = $(this).children().eq(1).html();
    				if($(this).children().eq(4).find("div input").is(':checked')){
    					$(this).remove();
    					$("#apply_tb").after("<tr><td>${applyIndex = applyIndex+1}</td>"+
            					"<td><input type='text' class='form-control' value='"+name+"'/></td>"
            					+"<td><input type='text' class='form-control'/></td>"
            					+"<td><button class='btn btn-primary btn-xs' onclick='remove(this)'>删除</button></td></tr>");
    				}
        			
    			});
			}else{
				
			}
    		/* var json = "" ;
    		$("#athlet_apply_item_tb").children().each(function(){
    			var athlet_id = $(this).attr('id');
    			if("${events[event_index].event_group}" == "成年组"){
    				var age = $(this).children().eq(1).html();
    			}
    			json += athlet_id+",";
    		});
    		json = json.substring(0,json.length-1);
    		alert(json); */
    	});
    	
    	
    
    	function remove(arg){
    		$(arg).parent().parent().remove();
    	}
    	
    	$("#competition_event_name").change(function(){
    		var selected_option_text = $(this).children("option:selected").text();
    		
    	});
    	
    </script>
 </body>
</html>