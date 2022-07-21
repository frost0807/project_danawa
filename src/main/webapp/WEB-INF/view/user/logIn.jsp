<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>로그인 페이지</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container-fluid mt-5">
	<div class="row">
		<form class="offset-md-4 col-md-4" action="/user/logIn" method="post">
			<label class="mt-3" for="username">아이디</label>
			<input class="form-control" type="text" name="username" placeholder="아이디 입력">
			<label class="mt-3" for="password">비밀번호</label>
			<input class="form-control" type="text" name="password" placeholder="비밀번호 입력">
			<button class="form-control mt-3" type="submit">로그인</button>
		</form>
		<div class="d-flex justify-content-center mt-3">
			<a>아이디 찾기</a>
				<span class="border-end ms-2 me-2"></span>
			<a>비밀번호 찾기</a>
		</div>
	</div>
</div>
</body>
</html>