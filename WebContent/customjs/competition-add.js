 /* 页面加载完成，绑定事件 */
$(document).ready(function(){ 
	bind_add_competition_event();
});

/**
 * 给按钮绑定点击事件,提交表单，添加赛事
 */
function bind_add_competition_event(){
	/*$("#add_competition_btn").click(function(){
		$.post('competitionAction!addCompetition.action',
				{
					"name":$("#competition_name").val(),
		            "start_date":$("#competition_start_date").val(),
		            "end_date":$("#competition_end_date").val(),
		            "location":$("#province").val()+","+$("#city").val(),
		            "stadium":$("#competition_stadium").val(),
		            "mascot":$("#competition_mascot").val(),
		            "sponsor":$("#competition_sponsor").val()
				},
				function(data, textStatus, xhr) {
					try {
						res = JSON.parse(data);
						alert(res);
						if (res.code == 200) {
							alert(res.msg);
							//window.location.href = "/wushu/admin/competition/competition-manage.jsp";
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
				},"json");
	});*/
	var $btn = $("#add_competition_btn").click(function(){
    $.ajax({
        type:'post',
        url:'competitionAction!addCompetition.action',
        data:{//设置数据源
            name:$("#competition_name").val(),
            start_date:$("#competition_start_date").val(),
            end_date:$("#competition_end_date").val(),
            location:$("#province").val()+","+$("#city").val(),
            stadium:$("#competition_stadium").val(),
            mascot:$("#competition_mascot").val(),
            sponsor:$("#competition_sponsor").val()
        },
        dataType:'json',//设置需要返回的数据类型
        success:function(data){
        	try {
        		alert(2);
				res = JSON.parse(data);
				if (res.code == "200") {
					alert(res.msg);
					//window.location.href = "/wushu/admin/competition/competition-manage.jsp";
					return;
				} else if (res.code == "-1") {
					alert(res.msg);
					return;
				} 
			} catch (err) {
				alert(err);
				alert("查询数据出错");
			}
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("error");
        }
        });
    });
}

