<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>마이 페이지</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container offset-md-3 col-md-6 mt-5">
	<table class="table">
		<tr>
			<th colspan="100%">회원 정보 페이지</th>
		</tr>
		<tr>
			<td>회원유형</td>
			<td>
				<c:choose>
					<c:when test="${logIn.type eq 1}">
						관리자
					</c:when>
					<c:when test="${logIn.type eq 2}">
						일반회원
					</c:when>
					<c:when test="${logIn.type eq 3}">
						사업자회원
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${logIn.username}</td>
		</tr>
		<c:choose>
			<c:when test="${logIn.type ne 1}">
				<tr>
					<td>이름</td>
					<td>${info.name}</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>${info.nickname}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${info.email}</td>
				</tr>
				<c:choose>
					<c:when test="${logIn.type eq 3}">
						<tr>
							<td>연락처</td>
							<td>${info.phone}</td>
						</tr>
						<tr>
							<td>업체명</td>
							<td>${info.phone}</td>
						</tr>
						<tr>
							<td>대표자명</td>
							<td>${info.representative}</td>
						</tr>
						<tr>
							<td>사업자 등록번호</td>
							<td>${info.corporateNumber}</td>
						</tr>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
	</table>
	<div class="d-flex justify-content-center">
		<div class="btn btn-outline-danger m-1" onclick="location.href='/user/update'">수정하기</div>
		<div class="btn btn-outline-danger m-1" onclick="location.href='/user/delete'">탈퇴하기</div>
	</div>
</div>

</body>
</html>