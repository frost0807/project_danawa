<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="head.jsp" />
<title>Danawa 메인 페이지</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="row mt-4">
			<jsp:include page="categoryNav.jsp" />
			<div class="col-md-9">화면 출력</div>
		</div>
	</div>
</body>
</html>