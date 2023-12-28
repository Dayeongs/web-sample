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
	// 요청 URL : http://localhost/sample/hr/job/list.jsp?id=AC_ACCOUNT(문자열)
	
	// 요청파라미터값(상세정보를 조회할 직종아이디) 조회하기
	String jobId = request.getParameter("id");

	// JOBS 테이블에 대한 CRUD 작업이 구현된 JobDao 객체를 생성한다.
	JobDao dao = new JobDao();
	// 직종아이디를 전달받아서 직종상세정보를 반환하는 getJobById(String jobId)를 실행한다.
	Job job = dao.getJobById(jobId);
%>
	<dl>
		<%-- 조회된 직종 상세 정보를 응답으로 보내기 --%>
		<dt>아이디</dt><dd><%=job.getId() %></dd>
		<dt>제목</dt><dd><%=job.getTitle() %></dd>
		<dt>최저급여</dt><dd><%=job.getMinSalary() %></dd>
		<dt>최고급여</dt><dd><%=job.getMaxSalary() %></dd>
	</dl>
	
	<div>
		<a href="list.jsp">목록</a>
	</div>
</body>
</html>