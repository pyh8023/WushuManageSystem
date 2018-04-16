<%@page import="com.pan.competition.service.*"%>
<%@page import="com.pan.competition.bean.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<%
	CompetitionService competitionService = new CompetitionService();
	List<MenuItem> competitionNames = competitionService.getCompetitionName();
	String competition_id = null,delegation_id=null,event_index=null,sex_selected=null;
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies ){
		if(cookie.getName().equals("competition_id")){
			competition_id = cookie.getValue();
		}else if(cookie.getName().equals("delegation_id")){
			delegation_id = cookie.getValue();
		}else if(cookie.getName().equals("event_index")){
			event_index = cookie.getValue();
		}else if(cookie.getName().equals("sex_selected")){
			sex_selected = cookie.getValue();
		}
	}
	if(competitionNames.size()!=0){
		if(competition_id == null||"null".equals(competition_id)){
			competition_id = competitionNames.get(0).getId();
		}
		request.setAttribute("competition_id", competition_id);
		//获取项目列表
		EventService eventService = new EventService();
		List<Event> events = eventService.getEventList(competition_id).getData();
		request.setAttribute("events", events);
		if(events.size()!=0){
			if(event_index == null ||"null".equals(event_index)){
				event_index = "0";
			}
			request.setAttribute("event_index", Integer.parseInt(event_index));
			String event_sex = events.get(Integer.parseInt(event_index)).getSex();
			if("男子".equals(event_sex))
				sex_selected = "male";
			else if("女子".equals(event_sex))
				sex_selected = "female";
			else if(sex_selected == null || "null".equals(sex_selected)){
				sex_selected = "all";
			}
			//获取报项信息
			ApplyService applyService = new ApplyService();
			String event_id = events.get(Integer.parseInt(event_index)).getId();
			List<Apply> applyList = applyService.getApplyList(event_id);
			request.setAttribute("applyList", applyList);
			//获取代表团列表
			DelegationService delegationService = new DelegationService();
			List<MenuItem> delegationNames = delegationService.getDelegationNameList(competition_id);
			request.setAttribute("delegationNames", delegationNames);
			if(delegationNames.size()!=0){
				if(delegation_id == null||"null".equals(delegation_id)){
					delegation_id = delegationNames.get(0).getId();
				}
				request.setAttribute("delegation_id", delegation_id);
				List<Athlet> athlets = applyService.getApplyAthletList(delegation_id, event_id);
				request.setAttribute("athlets", athlets);
			}
		}
	}
	request.setAttribute("sex_selected", sex_selected);
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
		            <li><a href="/WushuManageSystem/admin/judge/judge-manage.jsp">裁判员管理</a></li>
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
			    		<c:forEach var="event" items="${events }" varStatus="status">
			    			<option value="${ status.index}">${event.name }</option>>
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
								<button class="btn btn-primary btn-xs" onclick="remove(${apply.id })">删除</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
			<c:if test="${applyList.size()==0 }">
				<p>该项目报项为空</p>
			</c:if>
	
			<button id="submit_apply_btn" class="btn btn-primary <c:if test="${applyList.size() == 0 || events.size()==0 || delegationNames.size()==0}">disabled</c:if>">提交</button>
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
				<c:set var="event_sex" value="${events[event_index].sex }"></c:set>
				<c:set var="event_group" value="${events[event_index].event_group }"></c:set>
						<c:forEach var="athlet" items="${athlets }">
						<fmt:parseNumber var="age" type="number" value="${athlet.age }" />
						<c:set var="flag" value="${(event_group eq '儿童组' && age < 12) || (event_group eq '青少年组' && age>=12 && age < 18) ||(event_group eq '成年组' && age >= 18)}"></c:set>
						<c:if test="${flag eq 'true' && event_sex eq '男子' && athlet.sex eq '男' }">
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
						<c:if test="${flag eq 'true' && event_sex eq '女子' && athlet.sex eq '女'}">
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
						<c:if test="${flag eq 'true' && event_sex != '男子' && event_sex != '女子' &&  (sex_selected eq 'all' || (sex_selected eq 'female' && athlet.sex eq '女') || (sex_selected eq 'male' && athlet.sex eq '男'))}">
						<%-- <c:if test="${events[event_index].sex != '男子' && events[event_index].sex != '女子' && (sex_selected eq '全部' || athlet.sex eq  sex_selected)}"> --%>
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
			<button class="btn btn-primary <c:if test="${events.size()==0 || delegationNames.size()==0 ||athlets.size()==0}">disabled</c:if>" id="add_apply_btn">添加</button>
			</div>
		</div>
	
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <script src="/WushuManageSystem/js/jquery.cookie.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	  init();
    });
    
    function init(){
    	var sex_select =  $("#sex_select");
    	var event_sex = "${event_sex}";
    	if(event_sex == "男子"){
    		sex_select.children().eq(1).addClass("btn-primary");
    		sex_select.children().eq(0).addClass("disabled");
    		sex_select.children().eq(2).addClass("disabled");
    	}else if(event_sex == "女子"){
    		sex_select.children().eq(2).addClass("btn-primary");
    		sex_select.children().eq(0).addClass("disabled");
    		sex_select.children().eq(1).addClass("disabled");
    	}else{
    		if("${sex_selected}" =="all")
    			sex_select.children().eq(0).addClass("btn-primary");
    		else if("${sex_selected}" =="male")
    			sex_select.children().eq(1).addClass("btn-primary");
    		else 
    			sex_select.children().eq(2).addClass("btn-primary");
    		sex_select.children().click(function(){
      			$(this).parent().children().each(function(){
      				if($(this).hasClass("btn-primary")){
      					$(this).removeClass("btn-primary");
      				}
      			});
      			$(this).addClass("btn-primary");
      			var sex_selected = $(this).html();
      			if(sex_selected == "男")
      				$.cookie('sex_selected', 'male');
      			else if(sex_selected == "女")
      				$.cookie('sex_selected', 'female');
      			else
      				$.cookie('sex_selected', 'all');
      			window.location.reload();
      		});
    	}
    	//设置select选中内容
    	if("${competition_id}" != ""){
    		$("#competition_name_select option[value='${competition_id}']").attr("selected",true);
    	}
    	if("${event_index}" != ""){
    		$("#event_name_select option[value='${event_index}']").attr("selected",true);
    	}
    	if("${delegation_id}" != ""){
    		$("#delegation_name_select option[value='${delegation_id}']").attr("selected",true);
    	}
     }
    
    $("#submit_apply_btn").click(function() {
    	var json = "[]";
    	$("#apply_tb").children().each(function() {
			var id = $(this).attr("id");
			var name = $(this).children().eq(1).children().eq(0).val();
			var remark = $(this).children().eq(2).children().eq(0).val();
			if(json == "[]")
				json = "[{\"id\":\""+id+"\",\"apply_name\":\""+name+"\",\"remark\":\""+remark+"\"}]";
			else
				json = json.substring(0,json.length-1)+ ",{\"id\":\""+id+"\",\"apply_name\":\""+name+"\",\"remark\":\""+remark+"\"}]";
		});
    	 $.post("/WushuManageSystem/servlet/ApplyServlet?action=update",{data:json},function(data){
			if(data == "200")
   				alert("提交成功");
			else{
				alert("提交失败");
				window.location.reload();
			}
		});
	});
    
    $("#competition_name_select").change(function(){
    	$.cookie('competition_id', $(this).val());
    	$.cookie('event_index', null);
    	$.cookie('delegation_id', null);
    	$.cookie('sex_selected', null);
    	window.location.reload();
    });
    
    $("#event_name_select").change(function(){
    	$.cookie('event_index', $(this).val());
    	$.cookie('delegation_id', null);
    	$.cookie('sex_selected', null);
    	window.location.reload();
    });
    
    $("#delegation_name_select").change(function(){
    	$.cookie('delegation_id', $(this).val());
    	window.location.reload();
    });
    
   	/* 点击添加按钮，添加报项 */
   	$("#add_apply_btn").click(function(){
   		var applyIndex = ${applyIndex};
   		var apply_data = $.cookie('apply_data');
   		if(apply_data == null)
   			apply_data = "[]";
   		var json = "[]";
   		var event_type = "${events[event_index].type}";
   		var event_id = "${events[event_index].id}";
   		var delegation_id = "${delegation_id}";
   		if( event_type == "单人单项" || event_type == "全能"){
   			$("#athlet_apply_item_tb").children().each(function(){
   				if($(this).children().eq(4).find("div input").is(':checked')){
   					var name = $(this).children().eq(1).html();
   					var id = $(this).attr("id");
   					if(json == "[]")
   						json = "[{\"athlets\":\""+id+"\",\"event_id\":\""+event_id+"\",\"apply_name\":\""+name+"\",\"remark\":\"\""+",\"delegation_id\":\""+delegation_id+"\"}]";
   					else 
   						json = json.substring(0,json.length-1)+ ",{\"athlets\":\""+id+"\",\"event_id\":\""+event_id+"\",\"apply_name\":\""+name+"\",\"remark\":\"\""+",\"delegation_id\":\""+delegation_id+"\"}]";
   				}
   			});
		}else{
			//检查运动员人数是否符合要求
			if(!checkAthletNum())
				return false;
			var ids = "";
			var names = ""; 
			$("#athlet_apply_item_tb").children().each(function(){
   				if($(this).children().eq(4).find("div input").is(':checked')){
   					var name = $(this).children().eq(1).html();
   					var id = $(this).attr("id");
   					ids += id +",";
   					names += name +",";
   				}
   			});
			ids = ids.substring(0,ids.length-1);
			names = names.substring(0,names.length-1);
			json = "[{\"athlets\":\""+ids+"\",\"event_id\":\""+event_id+"\",\"apply_name\":\""+names+"\",\"remark\":\"\""+",\"delegation_id\":\""+delegation_id+"\"}]";
		}
   		$.post("/WushuManageSystem/servlet/ApplyServlet?action=add",{data:json},function(data){
			if(data != "200")
   				alert("添加报项失败");
			window.location.reload();
		}); 
   	});
   	
   	
   	function checkAthletNum(){
   		//计算选择人数
		var athlet_num = 0;
		var female_num = 0;
		var male_num = 0;
		$("#athlet_apply_item_tb").children().each(function(){
			if($(this).children().eq(4).find("div input").is(':checked')){
				var sex = $(this).children().eq(2).html();
				if(sex == "男"){
					male_num++;
				}else{
					female_num++;
				}
				athlet_num++;
			}
		});
		var event_min_athlet_num = parseInt("${events[event_index].min_athlet_num}");
		var event_max_athlet_num = parseInt("${events[event_index].max_athlet_num}");
		if(athlet_num < event_min_athlet_num || athlet_num > event_max_athlet_num){
			if(event_min_athlet_num != event_max_athlet_num)
				alert("运动员人数不能小于"+event_min_athlet_num+",或者大于"+event_max_athlet_num);
			else
				alert("运动员人数应等于"+event_max_athlet_num);
			return false;
		}else if("${event_sex}" == "男女混合"){
			var event_min_female_num = parseInt("${events[event_index].min_female_num}");
			var event_max_female_num = parseInt("${events[event_index].max_female_num}");
			var event_min_male_num = parseInt("${events[event_index].min_male_num}");
			var event_max_male_num = parseInt("${events[event_index].max_male_num}");
			if(male_num< event_min_male_num ||male_num > event_max_male_num ){
				if(event_min_male_num != event_max_male_num)
					alert("男运动员人数不能小于"+event_min_male_num+",或者大于"+event_max_male_num);
				else
					alert("男运动员人数应等于"+event_max_male_num);
				return false;
			}
			if(female_num< event_min_female_num ||female_num > event_max_female_num ){
				if(event_min_female_num != event_max_female_num)
					alert("女运动员人数不能小于"+event_min_female_num+",或者大于"+event_max_female_num);
				else
					alert("女运动员人数应等于"+event_min_female_num);
				return false;
			}
		}else{
			return true;
		}
   	}
    	
   	/* 删除报项 */
   	function remove(apply_id){
   		$.post("/WushuManageSystem/servlet/ApplyServlet?action=remove",{data:apply_id},function(data){
			if(data != "200")
   				alert("删除失败");
			else
				window.location.reload();
		});
   	}
    	
    </script>
 </body>
</html>