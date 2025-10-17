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
    // out 객체 : 자바 코드를 통해서 클라이언트에게 데이터를 출력할 때 사용하는 객체
    // out 객체의 print(), println() 메서드는 client쪽으로 데이터를 출력하는 역할을 한다.
    out.print("안녕하세요. JSP 페이지입니다.<br>");
    out.print("안녕하세요. JSP 페이지입니다.");
    out.println("안녕하세요. JSP 페이지입니다.<br>");
    out.println("안녕하세요. JSP 페이지입니다.");
%>
<%="안녕하세요?<br>" %>
<%="안녕하세요?<br>" %> <%="안녕하세요?<br>" %>

</body>
</html>