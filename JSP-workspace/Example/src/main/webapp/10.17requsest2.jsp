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
		String protocol = request.getProtocol();
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		String remoteAddr = request.getRemoteAddr();
		String remoteHost = request.getRemoteHost();
		String method = request.getMethod();
		StringBuffer requestURL = request.getRequestURL();
		String requestURI = request.getRequestURI();
		String useBrowser = request.getHeader("User-Agent"); //교재 p172 별★★★
		String fileType = request.getHeader("Accept");
%>
	<h1>Request Example2</h1>
	프로토콜 : <%=protocol%><p/>
	서버의 이름 : <%=serverName%><p/>
	서버의 포트 번호 :<%=serverPort%><p/>
	사용자 컴퓨터의 주소 : <%=remoteAddr%><p/>
	사용자 컴퓨터의 이름 : <%=remoteHost%><p/>
	사용 method : <%=method%><p/>
	요청 경로(URL) : <%=requestURL%><p/>
	요청 경로(URI) : <%=requestURI%><p/>
	사용자의 접속환경 : <%=useBrowser%><p/>
	브라우저가 지원하는 file의 type : <%=fileType%><p/>
</body>
</html>