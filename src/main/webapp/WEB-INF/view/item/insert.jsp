<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 추가</title>
<jsp:include page="../head.jsp"/>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container-fluid">
	<div class="row mt-5">
		<div class="offset-md-4 col-md-4">
			<form action="/item/insert" method="post" enctype="multipart/form-data">
				<div class="row mb-4">
					<div class="col-md-2">
						<input type="text" class="form-control-plaintext" value="상품명" disabled readonly>
					</div>
					<div class="col-md-10">
						<input class="form-control" type="text" name="name" placeholder="상품명 입력">
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
						<select class="form-select col-md-7" name="main" onchange="categorySelect1(this)">
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
						<select id="largeIns" class="form-select col-md-7" name="large" onchange="categorySelect2(this)">
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<input type="text" class="form-control-plaintext" value="중분류" disabled readonly>
					</div>
					<div class="col-md-8">
						<select id="middleIns" class="form-select col-md-7" name="middle" onchange="categorySelect3(this)">
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<input type="text" class="form-control-plaintext" value="소분류" disabled readonly>
					</div>
					<div class="col-md-8">
						<select id="subIns" class="form-select col-md-7" name="sub" onchange="categorySelect4(this)">
						</select>
					</div>
				</div>
				<div id="specIns" class="mt-4"></div>
				<button class="form-control mt-3" type="submit">입력완료</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>