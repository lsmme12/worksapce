<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="10.16error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러발생페이지</title>
</head>
<body>
	<%
		int num1 = 10;
        int num2 = 0;
        int result = num1 / num2; // 에러 발생
	%>
</body>
</html>