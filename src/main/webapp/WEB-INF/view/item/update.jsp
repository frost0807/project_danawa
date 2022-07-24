<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../head.jsp"/>
<title>상품정보 수정 페이지</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container-fluid">
	<div class="row mt-5">
		<div class="offset-md-4 col-md-4">
			<h4 class="text-center mb-5">상품정보 수정 페이지</h4>
			<form action="/item/insert" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${item.id}">
				<div class="row mb-4">
					<div class="col-md-2">
						<input type="text" class="form-control-plaintext" value="상품명" disabled readonly>
					</div>
					<div class="col-md-10">
						<input class="form-control" type="text" name="name" value="${item.name}">
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<input type="text" class="form-control-plaintext" value="이미지" disabled readonly>
					</div>
					<div class="col-md-10">
						<input class="form-control" type="file" name="image" multiple="multiple">
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-md-4">
						<input type="text" class="form-control-plaintext" value="전체카테고리" disabled readonly>
					</div>
					<div class="col-md-8">
						<select class="form-select col-md-7" name="main" onchange="categorySelect5(this)">
							<option selected>-----------------------------</option>
							<c:forEach items="${mainCategory}" var="mc">
								<option val="${mc}">${mc}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<input type="text" class="form-control-plaintext" value="대분류" disabled readonly>
					</div>
					<div class="col-md-8">
						<select id="largeUp" class="form-select col-md-7" name="large" onchange="categorySelect6(this)">
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<input type="text" class="form-control-plaintext" value="중분류" disabled readonly>
					</div>
					<div class="col-md-8">
						<select id="middleUp" class="form-select col-md-7" name="middle" onchange="categorySelect7(this)">
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<input type="text" class="form-control-plaintext" value="소분류" disabled readonly>
					</div>
					<div class="col-md-8">
						<select id="subUp" class="form-select col-md-7" name="sub" onchange="categorySelect8(this)">
						</select>
					</div>
				</div>
				<div id="specUp" class="mt-4"></div>
				<button class="form-control mt-3" type="submit">수정완료</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>