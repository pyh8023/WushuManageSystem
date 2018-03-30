 /* 页面加载完成，绑定事件 */
$(document).ready(function(){          
    btn();//点击提交，执行ajax
});

function reloadImage(){
	  document.getElementById("identity").src = "/wushu/image.jsp?"+Math.random(); //Math.random()方法非常重要，它使每次的请求都不同以便重新发送。如果每次的请求都一样，那么不会重新生成页面 
}	    
/* 提交结果，执行ajax */
function btn(){
    var $btn = $("#login_btn");//获取按钮元素
    //给按钮绑定点击事件
    $btn.bind("click",function(){
    $.ajax({
        type:"post",
        url:"admin.action",
        data:{//设置数据源
            username:$("#username").val(),
            password:$("#password").val(),
            verification_code:$("#verification_code").val()
        },
        dataType:"json",//设置需要返回的数据类型
        success:function(data){
        	try {
				res = $.parseJSON(data);
				if (res.code == 200) {
					window.location.href = "/wushu/index.jsp";
					return;
				} else if (res.code == -1) {
					alert(res.msg);
					return;
				} 
			} catch (err) {
				alert(err);
				alert("查询数据出错");
			}
        },
        error:function(){
            alert("系统异常，请稍后重试！");
        }
        });
    });
}

/*function getRealPath(){
    var localObj = window.location;
    var contextPath = localObj.pathname.split("/")[1];
    var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
	return basePath ;
}*/