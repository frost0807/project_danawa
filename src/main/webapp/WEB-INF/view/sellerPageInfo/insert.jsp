<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연결링크 추가 페이지</title>
<jsp:include page="../head.jsp"/>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container-fluid">
	<div class="row mt-5">
		<div class="offset-md-4 col-md-4">
		<h4 class="text-center mb-5">상품게시물 추가 페이지</h4>
			<form action="/sellerPageInfo/insert" method="post" enctype="multipart/form-data">
				<div class="row mb-4">
					<div class="col-md-2">
						<input type="text" class="form-control-plaintext" value="상품게시물 코드" disabled readonly>
					</div>
					<div class="col-md-10">
						<input class="form-control" type="text" name="postingId" placeholder="상품게시물 코드 입력">
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-2">
						<input type="text" class="form-control-plaintext" value="아이템 코드" disabled readonly>
					</div>
					<div class="col-md-10">
						<input class="form-control" type="text" name="itemId" placeholder="아이템코드 입력">
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-2">
						<input type="text" class="form-control-plaintext" value="가격" disabled readonly>
					</div>
					<div class="col-md-10">
						<input class="form-control" type="text" name="price" placeholder="가격 입력">
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-2">
						<input type="text" class="form-control-plaintext" value="배송료" disabled readonly>
					</div>
					<div class="col-md-10">
						<input class="form-control" type="text" name="deliveryCharge" placeholder="배송료 입력">
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-2">
						<input type="text" class="form-control-plaintext" value="링크 URL" disabled readonly>
					</div>
					<div class="col-md-10">
						<input class="form-control" type="text" name="siteUrl" placeholder="링크URL 입력">
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<input type="text" class="form-control-plaintext" value="로고이미지" disabled readonly>
					</div>
					<div class="col-md-10">
						<input class="form-control" type="file" name="image" multiple="multiple">
					</div>
				</div>
				<button class="form-control mt-3" type="submit">입력완료</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>