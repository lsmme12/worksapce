<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=session.getId() %>

<%
    // 로그인 에 성공한 후 ( 과정 )
    session.setAttribute("id", "hkd");
%>

</body>
</html>