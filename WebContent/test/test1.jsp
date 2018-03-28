<%@page import="com.pan.competition.bean.Athlet"%>
<%@page import="java.util.List"%>
<%@page import="com.pan.competition.service.AthletService"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	AthletService  athletService = new AthletService();
	List<Athlet> list = athletService.querAthlet();
%>
<body>
	<c:forEach  items="<%=list %>" var="athlet">
		${athlet.name }
	</c:forEach>
</body>
</html>