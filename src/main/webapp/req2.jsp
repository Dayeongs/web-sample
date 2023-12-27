<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>요청파라미터 연습</h1>
	
<%
	// 쿼리스트링으로 전달된 요청파라미터값 조회하기
	/*
		요청URL: http://localhost/sample/req2.jsp?keyword=java&sort=date&page=1
		쿼리스트링 : keyword=java&sort=date&page=1
	*/
	String value1 = request.getParameter("keyword");
	String value2 = request.getParameter("sort");
	String value3 = request.getParameter("page");
%>
	<h3>요청파라미터 정보</h3>
	<dl>
		<dt>검색어</dt><dd><%=value1 %></dd>
		<dt>정렬기준</dt><dd><%=value2 %></dd>
		<dt>페이지번호</dt><dd><%=value3 %></dd>		
	</dl>
</body>
</html>
