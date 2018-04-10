 /* 页面加载完成，绑定事件 */
$(document).ready(function(){          
    //btn();//点击提交，执行ajax
});

function reloadImage(){
	  document.getElementById("identity").src = getRealPath()+"/image.jsp?"+Math.random(); //Math.random()方法非常重要，它使每次的请求都不同以便重新发送。如果每次的请求都一样，那么不会重新生成页面 
}	

function getRealPath(){
    var localObj = window.location;
    var contextPath = localObj.pathname.split("/")[1];
    var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
	return basePath ;
}