<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp" />
<title>상품정보 출력 페이지</title>
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="container mt-5">
		<div class="row">
			<table class="table col-md-12">
				<tr>
					<td colspan="100%">${item.name}</td>
				</tr>
				<tr>
					<td colspan="100%">${item.specification}</td>
				</tr>
				<tr>

					<td><img src="${item.imagePath}"></td>
					<td><c:if test="${not empty spList}">
							<h2 class="mb-4">최저가 ${lowestPrice}</h2>
							<c:forEach items="${spList}" var="sp">
								<div>
									<a href="${sp.siteUrl}"><img src="${sp.logoUrl}"></a>
									${sp.price}원 ${sp.deliveryCharge}원
								</div>
							</c:forEach>
						</c:if></td>
				</tr>
			</table>
		</div>
		<div class="d-flex justify-content-between">
			<div class="btn btn-primary"
				onclick="location.href='/posting/printList'">목록으로</div>
			<c:if test="${logIn.type==1}">
				<div>
					<div class="btn btn-primary"
						onclick="location.href='/posting/update/${posting.id}'">수정하기</div>
					<div class="btn btn-primary"
						onclick="location.href='/posting/delete/${posting.id}'">삭제하기</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>