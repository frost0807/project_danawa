<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>상품게시물 검색 페이지</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container mt-5">
	<div class="row">
	<table class="table table-hover col-md-12">
		<tr class="table-primary col-md-12">
			<th class="col-md-1">게시물코드</th>
			<th class="col-md-1">상품사진</th>
			<th class="col-md-2">상품명</th>
			<th class="col-md-6">상품스펙</th>
			<th class="col-md-1">상품가격</th>
			<th class="col-md-1">등록일</th>
		</tr>
		<c:forEach items="${list}" var="p">
		<tr class="table-light" onclick="location.href='/posting/printOne/${p.id}'">
			<td>${p.id}</td>
			<td><img class="w-100" src="${itemImageMap[p.itemId]}"></td>
			<td>${itemNameMap[p.itemId]}</td>
			<td>${itemSpecMap[p.itemId]}</td>
			<td>${priceMap[p.id]}</td>
			<td><fmt:formatDate value="${p.writtenDate.time}" pattern="yyyy.MM"/></td>
		</tr>
		</c:forEach>
	</table>	
	</div>
	<c:if test="${logIn.type==1}">
		<div class="row">
			<div class="col">
				<div class="btn btn-primary" onclick="location.href='/posting/insert'">추가하기</div>
			</div>
		</div>
	</c:if>
	<div class="row">
		<div class="col d-flex justify-content-center btn-toolbar btn-group-sm">
			<a class="btn btn-primary ps-1 pe-1" href="/posting/printList/1">[<<]</a>
			<c:choose>
				<c:when test="${currentPage<3}">
					<c:forEach begin="1" end="5" var="pageNo">
						<c:choose>
							<c:when test="${pageNo ne currentPage}">
								<a class="btn btn-outline-primary" href="/posting/printList/${pageNo}">${pageNo}</a>
							</c:when>
							<c:otherwise>
								<button class="btn btn-outline-primary fw-bold"> ${pageNo}</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
				<c:when test="${currentPage>=3 and currentPage<lastPageNo-2}">
					<c:forEach begin="${currentPage-2}" end="${currentPage+2}" var="pageNo">
						<c:choose>
							<c:when test="${pageNo ne currentPage}">
								<a class="btn btn-outline-primary" href="/posting/printList/${pageNo}"> ${pageNo} </a>
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
								<a class="btn btn-outline-primary" href="/posting/printList/${pageNo}">${pageNo}</a>
							</c:when>
							<c:otherwise>
								<button class="btn btn-outline-primary fw-bold"> ${pageNo}</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<a class="btn btn-primary ps-1 pe-1" href="/posting/printList/${lastPageNo}">[>>]</a>
		</div>
	</div>
</div>
</body>
</html>