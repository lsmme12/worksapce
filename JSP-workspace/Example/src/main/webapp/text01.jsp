<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="10.16error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.box {
  background: white;
  border: 1px solid #ccc;
  border-radius: 6px;
  padding: 25px;
  width: 400px;
  text-align: center;
}
button {
  margin-top: 15px;
  padding: 8px 16px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
button:hover {
  background-color: #45a049;
}
</style>

</head>
<body>
<div class="box">
<%
    String fname = request.getParameter("firstname");
    String lname = request.getParameter("lastname");
    String country = request.getParameter("country");
    String subject = request.getParameter("subject");
%>

<h2>응답 정상적으로 처리되었습니다.</h2>
<p>성: <%= fname %></p>
<p>이름: <%= lname %></p>
<p>지역: <%= country %></p>
<p>내용: <%= subject %></p>
<p>확인 후 이상이 없으면 ‘확인’ 버튼을 눌러주세요.</p>
<button type="button" onclick="alert('확인되었습니다.'); location.href='text01.html';">
  확인
</button>
</div>
</body>
</html>