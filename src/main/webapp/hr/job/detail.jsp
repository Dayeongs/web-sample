<%@page import="hr.vo.Job"%>
<%@page import="hr.dao.JobDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>직종 상세 정보</h1>
	
<%
	String jobId = request.getParameter("id");

	JobDao dao = new JobDao();
	Job job = dao.getJobDetail(jobId);
%>
	<dl>
		<dt>아이디</dt><dd><%=job.getId() %></dd>
		<dt>제목</dt><dd><%=job.getName() %></dd>
		<dt>최저급여</dt><dd><%=job.getMinSalary() %></dd>
		<dt>최고급여</dt><dd><%=job.getMaxSalary() %></dd>
	</dl>
	
	<div>
		<a href="list.jsp">목록</a>
	</div>
</body>
</html>