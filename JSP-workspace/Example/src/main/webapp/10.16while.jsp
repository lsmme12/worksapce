<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>while example</title>
</head>
<body>
    <h1>while example</h1>
    <%
        String mas = request.getParameter("msg");
        int number = Integer.parseInt(request.getParameter("number"));
        int count = 0;
        while(number > count){    
    %>
        <b><%=mas%></b><br>
        <%
            count++;
        }
        %>
        
</body>
</html>