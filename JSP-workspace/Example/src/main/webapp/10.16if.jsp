<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if문 테스트</title>
</head>
	<%!
		String msg;
	%>
	<%
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		if(color.equals("blue")){
			msg = "파란색";
		}else if(color.equals("red")){
			msg = "빨간색";
		}else if(color.equals("orange")){
			msg = "오렌지색";
		}else{
			color = "white";
			msg="기타색";
		}
	%>
<body bgcolor="<%=color%>">
	<h1>if문 테스트</h1>
	<b><%=name%></b>님이 좋아하는 색깔은 <b><%=msg%></b>입니다.

</body>
</html>