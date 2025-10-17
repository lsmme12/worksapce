<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // User-Agent 가져오기
    String userAgent = request.getHeader("User-Agent");

    // 모바일 기기 식별 문자열 정의
    boolean isMobile = false;
    if (userAgent != null) {
        String[] mobileAgents = {
            "iPhone", "iPad", "Android", "BlackBerry", "Windows Phone", "Opera Mini", "IEMobile", "Mobile"
        };

        for (String mobile : mobileAgents) {
            if (userAgent.contains(mobile)) {
                isMobile = true;
                break;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>디바이스 확인</title>
</head>
<body>
    <h2>접속한 디바이스는:</h2>
    <p>
        <% if (isMobile) { %>
            <jsp:forward page="10.17mobile.jsp" />
        <% } else { %>
            <jsp:forward page="10.17desktop.jsp" />
        <% } %>
    </p>
</body>
</html>
