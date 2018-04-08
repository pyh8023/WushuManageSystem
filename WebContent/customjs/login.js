 /* 页面加载完成，绑定事件 */
$(document).ready(function(){          
    btn();//点击提交，执行ajax
});

function reloadImage(){
	  document.getElementById("identity").src = getRealPath()+"/image.jsp?"+Math.random(); //Math.random()方法非常重要，它使每次的请求都不同以便重新发送。如果每次的请求都一样，那么不会重新生成页面 
}	

/*function btn(){
	$("#login_btn").click(function(){
		$.post('adminAction!login.action',
				{
					"username":$("#username").val(),
		            "password":$("#password").val(),
		            "verification_code":$("#verification_code").val()
				},
				function(data, textStatus, xhr) {
					try {
						res = $.parseJSON(data);
						if (res.code == 200) {
							window.location.href = getRealPath()+"/index.jsp";
							return;
						} else if (res.code == -1) {
							alert(res.msg);
						} else{
							alert("系统繁忙，请稍后再试");
						}
					} catch (err) {
						alert(err);
						alert("查询数据出错");
					}
				});
	});
	
}*/
// 提交结果，执行ajax 
function btn(){
    $("#login_btn").click(function(){
    $.ajax({
        type:"post",
        url:"adminAction!login.action",
        data:{//设置数据源
            username:$("#username").val(),
            password:$("#password").val(),
            verification_code:$("#verification_code").val()
        },
        dataType:"json",//设置需要返回的数据类型
        success:function(data){
        	try {
				res = JSON.parse(data);
				if (res.code == "200") {
					window.location.href = getRealPath()+"/index.jsp";
					return;
				} else if (res.code == "-1") {
					alert(res.msg);
					return;
				} else{
					alert("系统繁忙，请稍后再试");
				}
			} catch (err) {
				alert(err);
				alert("查询数据出错");
			}
        },
       error:function(jqXHR, textStatus, errorThrown){
            alert(textStatus);
        }
        });
    });
}

function createXMLHttpRequest(){  
    var xmlrequest;  
    if(window.XMLHttpRequest){  
        xmlrequest=new XMLHttpRequest();  
    }else if(window.ActiveXObject){  
        try{  
            xmlrequest=new ActiveXObject("Msxm12.XMLHTTP");  
        }catch(e){  
            try{  
                xmlrequest=new ActiveXObject("Microsoft.XMLHTTP");  
            }catch(e){  
                xmlrequest="";  
            }  
        }  
    }  
    return xmlrequest;  
}  

/*function btn(){
    $("#login_btn").click(function(){
    	ajax({
            url: "adminAction!login.action",              //请求地址
            type: "POST",                       //请求方式
            data: { 
            	"username":$("#username").val(),
	            "password":$("#password").val(),
	            "verification_code":$("#verification_code").val() 
	        	},        //请求参数
            dataType: "json",
            success: function (response, xml) {
            	try {
    				res = $.parseJSON(response);
    				if (res.code == 200) {
    					alert(msg);
    					window.location.href = getRealPath()+"/index.jsp";
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
            fail: function (status) {
                alert(status);
            }
        });
    });   
}*/
/*//获取数据的函数  
function btn(){  
	$("#login_btn").click(function(){
		var xmlrequest=createXMLHttpRequest();  
	    xmlrequest.open("POST","adminAction!login.action",true);  
	    xmlrequest.onreadystatechange=function(){  
	        if(xmlrequest.readyState==4&&xmlrequest.status==200){  
	            var data=xmlrequest.responseText;  
	            try {
	            	alert(data);
					res = $.parseJSON(data);
					alert(res);
					alert(eval(res.code));
					alert(res.msg);
					if (res.code == "200") {
						window.location.href = getRealPath()+"/index.jsp";
						return;
					} else if (res.code == "-1") {
						alert(res.msg);
						return;
					} 
				} catch (err) {
					alert(err);
					alert("查询数据出错");
				}
	        }  
	    };  
	    data = { 
            	"username":$("#username").val(),
	            "password":$("#password").val(),
	            "verification_code":$("#verification_code").val() 
	        	};
	   // var param = formatParams(data);
	    param = "username="+$("#username").val()+"&"+"password="+$("#password").val()+"&"+"verification_code="+$("#verification_code").val();
	    	//"username="+$("#username").val()+"&"+"password="+$("#password").val()+"&"+"verification_code="+$("#verification_code").val();
	    xmlrequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
	    xmlrequest.send(param);
	});  
}

function ajax(options) {
    options = options || {};
    options.type = (options.type || "GET").toUpperCase();
    options.dataType = options.dataType || "json";
    var params = formatParams(options.data);

    //创建 - 非IE6 - 第一步
    if (window.XMLHttpRequest) {
        var xhr = new XMLHttpRequest();
    } else { //IE6及其以下版本浏览器
        var xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }

    //接收 - 第三步
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            var status = xhr.status;
            if (status >= 200 && status < 300) {
                options.success && options.success(xhr.responseText, xhr.responseXML);
            } else {
                options.fail && options.fail(status);
            }
        }
    }

    //连接 和 发送 - 第二步
    if (options.type == "GET") {
        xhr.open("GET", options.url + "?" + params, true);
        xhr.send(null);
    } else if (options.type == "POST") {
        xhr.open("POST", options.url, true);
        //设置表单提交时的内容类型
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send(params);
    }
}
//格式化参数
function formatParams(data) {
    var arr = [];
    for (var name in data) {
        arr.push(encodeURIComponent(name) + "=" + encodeURIComponent(data[name]));
    }
    arr.push(("v=" + Math.random()).replace(".",""));
    return arr.join("&");
}*/

function getRealPath(){
    var localObj = window.location;
    var contextPath = localObj.pathname.split("/")[1];
    var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
	return basePath ;
}