<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>회원탈퇴 페이지</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container-fluid mt-5">
	<div class="row">
		<form class="offset-md-4 col-md-4" action="/user/delete" method="post">
			<label class="mt-3" for="password">비밀번호 입력</label>
			<input class="form-control" type="text" name="password" placeholder="비밀번호 입력">
			<button class="form-control mt-3" type="submit">탈퇴하기</button>
		</form>
	</div>
</div>
</body>
</html>