<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 삭제 페이지</title>
<jsp:include page="../head.jsp"/>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class="container-fluid mt-5">
	<div class="row">
		<form class="offset-md-4 col-md-4" action="/item/delete" method="post">
			<h5>정말로 삭제하시겠습니까?</h5>
			<input type="hidden" name="id" value="${id}">
			<button class="form-control mt-3" type="submit">삭제하기</button>
		</form>
	</div>
</div>
</body>
</html>