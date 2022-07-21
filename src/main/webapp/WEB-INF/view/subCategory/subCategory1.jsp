<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvas1" aria-labelledby="subCategoryLabel1">
	<div class="offcanvas-header">
    	<h5 class="offcanvas-title" id="subCategoryLabel1">가전, TV</h5>
    	<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		<p class="fw-bold">TV</p>
		<p class="mb-1"><a href="#" data-bs-toggle="offcanvas" data-bs-target="#subCategory1_1">
	  		TV</a></p>
		<p class="mb-1"><a href="#" data-bs-toggle="offcanvas" data-bs-target="#subCategory1_2">
	  		프로젝트/스크린</a></p>
		<p class="mb-1"><a href="#" data-bs-toggle="offcanvas" data-bs-target="#subCategory1_3">
	  		홈시어터/오디오</a></p>
		<br>
		
		<p class="fw-bold">가전</p>
		<p class="mb-1"><a href="#">에어컨/선풍기제습기</a></p>
		<p class="mb-1"><a href="#">생활가전</a></p>
		<p class="mb-1"><a href="#">주방가전</a></p>
		<p class="mb-1"><a href="#">계절가전</a></p>
		<p class="mb-1"><a href="#">미용욕실가전</a></p>
  </div>
</div>
<jsp:include page="subCategory1_1.jsp"></jsp:include>
<jsp:include page="subCategory1_2.jsp"></jsp:include>
<jsp:include page="subCategory1_3.jsp"></jsp:include>
</body>
</html>