<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-4">
		<div class="row justify-content-between">
			<div class="col-md-2">
				<a href="/index/"><img src="/img/danawalogo.png"></a>
			</div>
			<div class="col-md-4 m-2">
				<form class="form-control d-flex justify-content-center" action=""
					method="post">
					<input class="form-control border-0 flex-fill p-1" type="text"
						placeholder="검색"> <input class="ms-1 p-1" type="image"
						src="/img/searchBar.png">
				</form>
			</div>
			<div class="btn-toolbar col-md-3 mt-4 mb-4">
				<div class="btn-group btn-group-sm">
					<button class="btn btn-outline-secondary">최근</button>
					<c:choose>
						<c:when test="${empty logIn}">
							<button class="btn btn-outline-secondary"
								onclick="location.href='/user/logIn'">로그인</button>
							<button class="btn btn-outline-secondary"
								onclick="location.href='/user/signup/general'">회원가입</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-outline-secondary"
								onclick="location.href='/user/logOut'">로그아웃</button>
							<button class="btn btn-outline-secondary"
								onclick="location.href='/user/myPage'">마이페이지</button>
							<c:choose>
									<c:when test="${logIn.type eq 1}">
										<div class="dropdown btn-group btn-group-sm">
											<a class="btn btn-outline-secondary dropdown-toggle" id="adminMenu"
											data-bs-toggle="dropdown" aria-expanded=false>관리메뉴</a>
												<ul class="dropdown-menu" aria-labelledby="adminMenu">
													<li><a class="dropdown-item" href="/item/printList">상품정보 검색</a></li>
													<li><a class="dropdown-item" href="/item/insert">상품정보 추가</a></li>
													<li><hr class="dropdown-divider"></li>
													<li><a class="dropdown-item" href="/posting/printList">상품게시물 검색</a></li>
													<li><a class="dropdown-item" href="/posting/insert">상품게시물 추가</a></li>
													<li><hr class="dropdown-divider"></li>
													<li><a class="dropdown-item" href="/sellerPageInfo/printList">연결링크 검색</a></li>
													<li><a class="dropdown-item" href="/sellerPageInfo/insert">연결링크 추가</a></li>
												</ul>
										</div>
									</c:when>
								<c:otherwise>
									<button class="btn btn-outline-secondary"
										onclick="location.href='/user/signup/general'">회원 가입</button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div class="offcanvas offcanvas-end" data-bs-scroll="true"
		tabindex="-1" id="adminMenu">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">관리메뉴</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div class="accordion" id="adminMenuParent">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button" data-bs-toggle="collapse"
							data-bs-target="#adminMenu1" aria-expanded="true">물건정보 관리
						</button>
					</h2>
					<div id="adminMenu1" class="accordion-collapse collapse" data-bs-parent="#adminMenuParent">
						<div class="accordion-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><a href="/item/printList">물건정보 검색</a></li>
								<li class="list-group-item"><a href="/item/insert">물건정보 추가</a></li>
								<li class="list-group-item"><a href="/item/update">물건정보 수정</a></li>
								<li class="list-group-item"><a href="/item/delete">물건정보 삭제</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button" data-bs-toggle="collapse"
							data-bs-target="#adminMenu2" aria-expanded="true"> 상품게시물 관리
						</button>
					</h2>
					<div id="adminMenu2" class="accordion-collapse collapse" data-bs-parent="#adminMenuParent">
						<div class="accordion-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><a href="/posting/printList">상품게시물 검색</a></li>
								<li class="list-group-item"><a href="#">상품게시물 추가</a></li>
								<li class="list-group-item"><a href="#">상품게시물 수정</a></li>
								<li class="list-group-item"><a href="#">상품게시물 삭제</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button" data-bs-toggle="collapse"
							data-bs-target="#adminMenu3" aria-expanded="true"> 연결링크 관리
						</button>
					</h2>
					<div id="adminMenu3" class="accordion-collapse collapse" data-bs-parent="#adminMenuParent">
						<div class="accordion-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><a href="/sellerPageInfo/printList">연결링크 검색</a></li>
								<li class="list-group-item"><a href="#">연결링크 추가</a></li>
								<li class="list-group-item"><a href="#">연결링크 수정</a></li>
								<li class="list-group-item"><a href="#">연결링크 삭제</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>