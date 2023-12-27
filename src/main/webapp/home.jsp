<%--
	<%@ page %>
		+ page 디렉티브(Directive, 지시어)
		+ page 지시어는 JSP 페이지에 대한 설정정보를 지정한다.
		+ page 지시어의 주요 속성
			- language
				* 이 jsp 페이지에서 사용할 코딩 언어를 지정한다.
				* 기본값은 java다.
			- contentType
				* 이 JSP의 최종 응답 컨텐츠 타입과 문자인코딩 방식을 지정한다.
				* 기본값: text/html; charset=ISO-8859-1
				* 기본값을 그대로 사용할 경우 응답 컨텐츠에 한글이 포함되어 있는 경우
				  제대로 출력되지 않는다. 
			- pageEnconding
				* 이 JSP 파일을 저장할 때 사용할 문자인코딩 방식을 지정한다.
				* 기본값: ISO-8859-1
				* 기본값을 그대로 사용할 경우 JSP 파일에 한글이 포함되어 있는 경우
				  파일내용을 깨진채로 저장된다.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>샘플 홈페이지</h1>
	
	<h3>요청객체 연습</h3>
	<ul>
		<li><a href="req1.jsp">요청객체 연습1</a></li>
		<li>요청객체 연습2
			<ul>
				<li><a href="req2.jsp?keyword=java&sort=date&page=1">연습1</a></li>
				<li><a href="req2.jsp?keyword=게임&sort=price&page=4">연습2</a></li>
				<li><a href="req2.jsp?keyword=영화&sort=review&page=1">연습3</a></li>
			</ul>
		</li>
		<li>요청객체 연습3
			<form action="req3.jsp">
				검색어 : <input type="text" name="keyword" /><br>
				정렬기준 : <input type="radio" name="sort" value="date" checked>날짜순
						<input type="radio" name="sort" value="review">평점순
						<input type="radio" name="sort" value="read">조회순<br>
				<button>검색</button>
			</form>
		</li>
		<li>요청객체 연습4
			<form method="post" action="req4.jsp">
				아이디 : <input type="text" name="id" /><br>
				비밀번호 : <input type="password" name="pwd" /><br>
				<button>로그인</button>
			</form>
		</li>
	</ul>
</body>
</html>
