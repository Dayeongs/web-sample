<%@page import="hr.dao.JobDao"%>
<%@page import="hr.vo.Job"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청 URL : http://localhost/sample/hr/job/add.jsp
	// 요청 파라미터(요청 메세지의 바디부)
	// 		id=xxx&title=xxx&minSalary=xxx&maxSalary=xxx
	
	// 요청파라미터값 조회하기
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	int minSalary = Integer.valueOf(request.getParameter("minSalary"));
	int maxSalary = Integer.valueOf(request.getParameter("maxSalary"));
	
	// Job 객체를 생성해서 죄회된 요청파라미터값을 저장하기
	Job job = new Job();
	job.setId(id);
	job.setTitle(title);
	job.setMinSalary(minSalary);
	job.setMaxSalary(maxSalary);
	
	// JOBS 테이블에 대한 CRUD 작업이 구현된 JobDao 객체를 생성한다.
	JobDao jobDao = new JobDao();
	
	// 신규 직종정보를 전달받아서 데이터베이스에 저장시키는 insertJob(Job job)을 실행시킨다.
	jobDao.insertJob(job);
	
	// 모든 직종목록을 확인할 수 있는 list.jsp를 재요청하게 하는 응답을 보낸다.
	response.sendRedirect("list.jsp");
%>
