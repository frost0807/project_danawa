<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>회원정보수정 페이지</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container-fluid">
	<div class="row">
		<form class="offset-md-4 col-md-4" action="/user/update" method="post">
			<input type="hidden" name="type" value="logIn.type">
			<label class="mt-3" for="username">아이디</label>
			<input class="form-control" type="text" name="username" value="${logIn.username}" readonly>
			<label class="mt-3" for="password">새로운 비밀번호</label>
			<input class="form-control" type="password" name="password" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상">
			<label class="mt-3" for="passwordCheck">새로운 비밀번호 확인</label>
			<input class="form-control" type="password" name="passwordCheck" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상">
			<label class="mt-3" for="passwordCheck">기존 비밀번호</label>
			<input class="form-control" type="password" name="oldPassword" placeholder="숫자, 영문, 특수문자 포함 최소 8자 이상">
			<c:if test="${logIn.type eq 2}">
				<label class="mt-3" for="name">이름</label>
				<input class="form-control" type="text" name="name" value="${general.name}" readonly>
				<label class="mt-3" for="nickname">닉네임</label>
				<input class="form-control" type="text" name="nickname" value="${general.nickname}">
				<label for="email">이메일 주소</label>
				<input class="form-control" type="email" name="email" value="${general.email}" readonly>
			</c:if>
			<c:if test="${logIn.type eq 3}">
				<label class="mt-3" for="name">이름</label>
				<input class="form-control" type="text" name="name" value="${business.name}" readonly>
				<label class="mt-3" for="nickname">닉네임</label>
				<input class="form-control" type="text" name="nickname" value="${business.nickname}">
				<label for="email">이메일 주소</label>
				<input class="form-control" type="email" name="email" value="${business.email}" readonly>
				<label class="mt-3" for="nickname">회사명</label>
				<input class="form-control" type="text" name="company" value="${business.company}">
				<label class="mt-3" for="nickname">대표자명</label>
				<input class="form-control" type="text" name="representative" value="${business.representative}">
				<label class="mt-3" for="nickname">사업자 등록 번호</label>
				<input class="form-control" type="text" name="corporateNumber" value="${business.corporateNumber}">
				<label class="mt-3" for="nickname">휴대폰 번호 (선택)</label>
				<input class="form-control" type="text" name="phone"  value="${business.phone}">
			</c:if>
			<button class="form-control mt-3" type="submit">회원가입</button>
		</form>
	</div>
</div>
</body>
</html>