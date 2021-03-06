<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="zh-CN">
  <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
        application.setAttribute("basePath", basePath);
    %>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录</title>

    <!-- Bootstrap -->
    <link href="/WushuManageSystem/css/bootstrap.min.css" rel="stylesheet">
    <link href="/WushuManageSystem/css/login.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body>
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
	      <a class="navbar-brand" href="#">武术赛事成绩处理系统</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<!--<li><a href="index.html">首页</a></li>-->
	        <!-- <li><a href="index.html">首页<span class="sr-only">(current)</span></a></li> -->
	      </ul>
	      
	      <ul class="nav navbar-nav navbar-right">
	        <li class="active"><a href="/WushuManageSystem/login.jsp">登录</a></li>
	        <li><a href="/WushuManageSystem/register.jsp">注册</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<!--登录表单-->
	<div class="container-fluid col-md-4 col-md-offset-4">
		<form id="form_login" method="post" action="/WushuManageSystem/servlet/LoginServlet?action=login">
			<h2 class="text-center" style="margin-bottom: 30px;">登录</h2>
		  <div class="form-group">
		    <label for="username" class="control-label">用户名</label>
		    <div>
		    	<input type="text" class="form-control" name="username" placeholder="请输入用户名" required autofocus>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="password" class="control-label">密码</label>
		    <div>
		    	<input type="password" class="form-control" name="password" placeholder="请输入密码" required>
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="verification_code" class="control-label">验证码</label>
		    <div class="form-inline">
		    	<input type="number" class="form-control" name="verification_code" placeholder="请输入验证码" required>
		    	&nbsp;&nbsp;
		    	<img src="/WushuManageSystem/image.jsp" id="identity" onclick="reloadImage()" title="看不清，点击换一张">
		    </div>
		  </div>
		  <div class="div_login_button">
		  	<button id="login_btn" class="btn btn-primary col-md-12">登录</button>
		  </div>
		</form>
	</div>
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/WushuManageSystem/js/jquery-1.8.2.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/WushuManageSystem/js/bootstrap.min.js"></script>
    <%-- <script src="/WushuManageSystem/customjs/login.js"></script> --%>
    <script type="text/javascript">
    	var msg = "${ login_msg }";
    	if(msg !=null && msg!=""){
    		alert(msg);
    	}
    	
    	function reloadImage(){
    		  document.getElementById("identity").src = "/WushuManageSystem/image.jsp?"+Math.random(); //Math.random()方法非常重要，它使每次的请求都不同以便重新发送。如果每次的请求都一样，那么不会重新生成页面 
    	}
    </script>
  </body>
</html>