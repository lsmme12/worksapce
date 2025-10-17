<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>Hobbby Page</h1>
    <%
        String[] hobby = request.getParameterValues("hobby");
        if(hobby != null) {
            for(String h : hobby) {
                 out.println("<p>선택한 취미: " + h + "</p>");
            }
        }
    %>

</body>
</html>