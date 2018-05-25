<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册</title>

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
	      <a class="navbar-brand" href="#">武术赛事成绩处理系统</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<!--<li><a href="index.html">首页</a></li>-->
	        <!-- <li><a href="index.html">首页<span class="sr-only">(current)</span></a></li> -->
	      </ul>
	      
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="/WushuManageSystem/login.jsp">登录</a></li>
	        <li class="active"><a href="/WushuManageSystem/register.jsp">注册</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<!--注册表单-->
	<div class="container-fluid col-md-4 col-md-offset-4">
		<form  id="form_register" action="/WushuManageSystem/servlet/LoginServlet?action=register" method="post">
		 <h2 class="text-center" style="margin-bottom: 30px;">用户注册</h2>
		  <div class="form-group">
		    <label for="username" class="control-label">姓名</label>
		    <div>
		    	<input type="text" class="form-control" name="username" placeholder="请输入用户名" required autofocus>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="email" class="control-label">邮箱</label>
		    <div>
		    	<input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱" required>
		    </div>
		  </div>
		  <!-- <div class="form-group">
		    <label for="verification_code" class="control-label">验证码</label>
		    <div class="form-inline">
		    	<input type="number" maxlength="6" class="form-control" id="verification_code" placeholder="请输入验证码" required>
		    	<button class="btn btn-primary" id="send_verification_code">发送验证码</button>
		    </div>
		  </div> -->
		  <div class="form-group">
		    <label for="password" class="control-label">密码</label>
		    <div>
		    	<input type="password" class="form-control" name="password" id="password" placeholder="请输入密码" required>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="confirm_password" class="control-label">确认密码</label>
		    <div>
		   		<input type="password" class="form-control" id="confirm_password" placeholder="请输入确认密码" required>
		   	</div>
		  </div>
		  <div class="div_register_button">
		  	<button type="submit" class="btn btn-primary col-md-12" id="register_btn">注册</button>
		  </div>
		</form>
	</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="/WushuManageSystem/js/jquery-1.11.1.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="/WushuManageSystem/js/bootstrap.min.js"></script>
		<script type="text/javascript">
	    	var msg = "${ register_msg }";
	    	if(msg !=null && msg!=""){
	    		alert(msg);
	    	}
	    	
	    	$("#register_btn").click(function(){
	    		var email = $("#email").val();
	    		if(!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)){
	    			alert("邮箱格式错误");
	    			return false;
	    		}
	    		var password = $("#password").val();
	    		var confirmPassword = $("#confirm_password").val();
	    		if(password != confirmPassword){
	    			alert("密码两次输入不一致");
	    			return false;
	    		}
	    	});
	    </script>
  </body>
</html>