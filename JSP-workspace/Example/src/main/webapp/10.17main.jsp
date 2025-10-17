<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        String id = (String)session.getAttribute("id");
        if(id == null) { // 세션에 id 라는 이름으로 저장된 값이 없으면
            //response.sendRedirect("10.17login.jsp"); // iogin.jsp 로 이동
            response.sendRedirect("10.17about.jsp"); // about.jsp 로 이동
        }
    %>


    <h1>메인페이지. 로그인 한 사용자만 볼 수 있습니다.</h1>

</body>
</html>