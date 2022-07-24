<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>연결링크 페이지 출력</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container mt-5">
	<table class="table">
		<tr>
			<td class="w-15">연결링크 코드</td>
			<td>${s.id}</td>
		</tr>
		<tr>
			<td>상품게시물 코드</td>
			<td>${p.id}</td>
		</tr>
		<tr>
			<td>상품 코드</td>
			<td>${i.id}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${s.price}</td>
		</tr>
		<tr>
			<td>배송비</td>
			<td>${s.deliveryCharge}</td>
		</tr>
		<tr>
			<td>링크 URL</td>
			<td>${s.siteUrl}</td>
		</tr>
		<tr>
			<td>링크 로고</td>
			<td><img src="${s.logoUrl}"></td>
		</tr>
	</table>
	<div class="d-flex justify-content-between">
		<div class="btn btn-primary" onclick="location.href='/sellerPageInfo/printList'">목록으로</div>
		<div>
			<div class="btn btn-primary" onclick="location.href='/sellerPageInfo/update/${s.id}'">수정하기</div>
			<div class="btn btn-primary" onclick="location.href='/sellerPageInfo/delete/${s.id}'">삭제하기</div>
		</div>
	</div>
</div>
</body>
</html>