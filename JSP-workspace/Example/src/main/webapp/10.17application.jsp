<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. application 범위에서 "counter" 속성 확인
    Integer counter = (Integer) application.getAttribute("counter");

    // 2. 값이 없으면 0으로 초기화
    if (counter == null) {
        counter = 0;
    }

    // 3. 1 증가
    counter++;

    // 4. 다시 application 범위에 저장
    application.setAttribute("counter", counter);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>접속자 카운터</title>
</head>
<body>
    <h2>총 접속자 수: <%= counter %>명</h2>
</body>
</html>
