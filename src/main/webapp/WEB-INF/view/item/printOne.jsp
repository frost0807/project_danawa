<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>상품정보 출력 페이지</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container mt-5">
	<table class="table">
		<tr>
			<td class="w-15">상품코드</td>
			<td>${item.id}</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>${item.name}</td>
		</tr>
		<tr>
			<td>스펙</td>
			<td>${item.specification}</td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>${category}</td>
		</tr>
		<tr>
			<td>이미지 경로</td>
			<td>${item.imagePath}</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><img class="w-15" src="${item.imagePath}"></td>
		</tr>
	</table>
	<div class="d-flex justify-content-between">
		<div class="btn btn-primary" onclick="location.href='/item/printList'">목록으로</div>
		<div>
			<div class="btn btn-primary" onclick="location.href='/item/update/${item.id}'">수정하기</div>
			<div class="btn btn-primary" onclick="location.href='/item/delete/${item.id}'">삭제하기</div>
		</div>
	</div>
</div>
</body>
</html>