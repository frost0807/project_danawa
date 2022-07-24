<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>연결링크 검색</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container mt-5">
	<div class="row">
	<table class="table table-hover col-md-12">
		<tr class="table-primary col-md-12">
			<th class="col-md-1">연결링크 코드</th>
			<th class="col-md-1">상품게시물 코드</th>
			<th class="col-md-1">상품정보 코드</th>
			<th class="col-md-2">상품명</th>
			<th class="col-md-1">상품가격</th>
			<th class="col-md-1">배송비</th>
			<th class="col-md-5">카테고리</th>
		</tr>
		<c:forEach items="${spList}" var="sp">
		<tr class="table-light" onclick="location.href='/sellerPageInfo/printOne/${sp.id}'">
			<td>${sp.id}</td>
			<td>${sp.postingId}</td>
			<td>${sp.itemId}</td>
			<td>${nameMap[sp.id]}</td>
			<td>${sp.price}원</td>
			<td>${sp.deliveryCharge}원</td>
			<td>${categoryMap[sp.id]}</td>
		</tr>
		</c:forEach>
	</table>	
	</div>
	<c:if test="${logIn.type==1}">
		<div class="row">
			<div class="col">
				<div class="btn btn-primary" onclick="location.href='/sellerPageInfo/insert'">추가하기</div>
			</div>
		</div>
	</c:if>
	<div class="row">
		<div class="col d-flex justify-content-center btn-toolbar btn-group-sm">
			<a class="btn btn-primary ps-1 pe-1" href="/sellerPageInfo/printList/1">[<<]</a>
			<c:choose>
				<c:when test="${currentPage<3}">
					<c:forEach begin="1" end="5" var="pageNo">
						<c:choose>
							<c:when test="${pageNo ne currentPage}">
								<a class="btn btn-outline-primary" href="/sellerPageInfo/printList/${pageNo}">${pageNo}</a>
							</c:when>
							<c:otherwise>
								<button class="btn btn-outline-primary fw-bold">${pageNo}</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
				<c:when test="${currentPage>=3 and currentPage<lastPageNo-2}">
					<c:forEach begin="${currentPage-2}" end="${currentPage+2}" var="pageNo">
						<c:choose>
							<c:when test="${pageNo ne currentPage}">
								<a class="btn btn-outline-primary" href="/sellerPageInfo/printList/${pageNo}"> ${pageNo} </a>
							</c:when>
							<c:otherwise>
								<button class="btn btn-outline-primary fw-bold"> ${pageNo}</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${lastPageNo-4}" end="${lastPageNo}" var="pageNo">
						<c:choose>
							<c:when test="${pageNo ne currentPage}">
								<a class="btn btn-outline-primary" href="/sellerPageInfo/printList/${pageNo}">${pageNo}</a>
							</c:when>
							<c:otherwise>
								<button class="btn btn-outline-primary fw-bold"> ${pageNo}</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<a class="btn btn-primary ps-1 pe-1" href="/sellerPageInfo/printList/${lastPageNo}">[>>]</a>
		</div>
	</div>
</div>
</body>
</html>