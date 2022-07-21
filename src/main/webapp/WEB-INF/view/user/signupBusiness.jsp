<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>회원가입 페이지</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container-fluid mt-5 mb-5">
	<ul class="nav nav-pills row justify-content-center">
		<li class="nav-item col-2">
			<a class="nav-link" aria-current="page" href="/user/signup/general">일반회원</a>
		</li>
		<li class="nav-item col-2">
			<a class="nav-link active" href="/user/signup/business">사업자 회원</a>
		</li>
	</ul>
</div>
<div class="container-fluid">
	<div class="row">
		<form class="offset-md-4 col-md-4" action="/user/insert/business" method="post">
			<label for="email">이메일 주소</label>
			<input class="form-control" type="email" name="email" placeholder="이메일 주소 입력">
			<label class="mt-3" for="username">아이디</label>
			<input class="form-control" type="text" name="username" placeholder="영문 4자 이상, 최대 20자">
			<label class="mt-3" for="password">비밀번호</label>
			<input class="form-control" type="password" name="password" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상">
			<label class="mt-3" for="passwordCheck">비밀번호 확인</label>
			<input class="form-control" type="password" name="passwordCheck" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상">
			<label class="mt-3" for="name">이름</label>
			<input class="form-control" type="text" name="name" placeholder="한글 8자, 영문 16자 까지 가능">
			<label class="mt-3" for="nickname">닉네임</label>
			<input class="form-control" type="text" name="nickname" placeholder="한글 8자, 영문 16자 까지 가능">
			<label class="mt-3" for="nickname">회사명</label>
			<input class="form-control" type="text" name="company">
			<label class="mt-3" for="nickname">대표자명</label>
			<input class="form-control" type="text" name="representative">
			<label class="mt-3" for="nickname">사업자 등록 번호</label>
			<input class="form-control" type="text" name="corporateNumber" placeholder="숫자만입력">
			<label class="mt-3" for="nickname">휴대폰 번호 (선택)</label>
			<input class="form-control" type="text" name="phone" placeholder="숫자만 입력">
			<button class="form-control mt-3" type="submit">회원가입</button>
		</form>
	</div>
</div>
</body>
</html>