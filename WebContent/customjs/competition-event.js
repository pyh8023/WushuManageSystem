 /* 页面加载完成，绑定事件 */
$(document).ready(function(){ 
	bind_competition_event();
});

function bind_competition_event(){
	$("#add_event_btn").click(function(){
    	var max_athlet_num = $("#max_athlet_num").val();
    	var min_athlet_num = $("#min_athlet_num").val();
    	if(parseInt(max_athlet_num)<0){
    		alert("最大运动员人数不能为负数");
    		return false;
    	}else if(parseInt(min_athlet_num)<0){
    		alert("最小运动员人数不能为负数");
    		return false;
    	}else if(!compare(max_athlet_num,min_athlet_num)){
    		alert("最大运动员人数不能小于最小运动员人数");
    		return false;
    	}
    	var max_male_athlet_num = $("#max_male_athlet_num").val();
    	var min_male_athlet_num = $("#min_male_athlet_num").val();
    	if(max_male_athlet_num != "" && parseInt(max_male_athlet_num)<0){
	    	alert("最大男运动员人数不能为负数");
	    	return false;
    	}
    	if(min_male_athlet_num != "" && parseInt(min_male_athlet_num)<0){
	    	alert("最小男运动员人数不能为负数");
	    	return false;
    	}
    	if(max_male_athlet_num != "" && min_male_athlet_num != "" && !compare(max_male_athlet_num,min_male_athlet_num)){
    		alert("最大男运动员人数不能小于最小男运动员人数");
    		return false;
    	}
    	var max_female_athlet_num = $("#max_female_athlet_num").val();
    	var min_female_athlet_num = $("#min_female_athlet_num").val();
    	if(max_female_athlet_num != "" && parseInt(max_female_athlet_num)<0){
	    	alert("最大男运动员人数不能为负数");
	    	return false;
    	}
    	if(min_female_athlet_num != "" && parseInt(min_female_athlet_num)<0){
	    	alert("最小男运动员人数不能为负数");
	    	return false;
    	}
    	if(max_female_athlet_num != "" && min_female_athlet_num != "" && !compare(max_female_athlet_num,min_female_athlet_num)){
    		alert("最大女运动员人数不能小于最小女运动员人数");
    		return false;
    	}
    });
	$("#update_event_btn").click(function(){
    	var max_athlet_num = $("#max_athlet_num").val();
    	var min_athlet_num = $("#min_athlet_num").val();
    	if(parseInt(max_athlet_num)<0){
    		alert("最大运动员人数不能为负数");
    		return false;
    	}else if(parseInt(min_athlet_num)<0){
    		alert("最小运动员人数不能为负数");
    		return false;
    	}else if(!compare(max_athlet_num,min_athlet_num)){
    		alert("最大运动员人数不能小于最小运动员人数");
    		return false;
    	}
    	var max_male_athlet_num = $("#max_male_athlet_num").val();
    	var min_male_athlet_num = $("#min_male_athlet_num").val();
    	if(max_male_athlet_num != "" && parseInt(max_male_athlet_num)<0){
	    	alert("最大男运动员人数不能为负数");
	    	return false;
    	}
    	if(min_male_athlet_num != "" && parseInt(min_male_athlet_num)<0){
	    	alert("最小男运动员人数不能为负数");
	    	return false;
    	}
    	if(max_male_athlet_num != "" && min_male_athlet_num != "" && !compare(max_male_athlet_num,min_male_athlet_num)){
    		alert("最大男运动员人数不能小于最小男运动员人数");
    		return false;
    	}
    	var max_female_athlet_num = $("#max_female_athlet_num").val();
    	var min_female_athlet_num = $("#min_female_athlet_num").val();
    	if(max_female_athlet_num != "" && parseInt(max_female_athlet_num)<0){
	    	alert("最大男运动员人数不能为负数");
	    	return false;
    	}
    	if(min_female_athlet_num != "" && parseInt(min_female_athlet_num)<0){
	    	alert("最小男运动员人数不能为负数");
	    	return false;
    	}
    	if(max_female_athlet_num != "" && min_female_athlet_num != "" && !compare(max_female_athlet_num,min_female_athlet_num)){
    		alert("最大女运动员人数不能小于最小女运动员人数");
    		return false;
    	}
    });
}

function compare(str1,str2){
	var num1 =  parseInt(str1);
	var num2 =  parseInt(str2);
	return num1>=num2;
}