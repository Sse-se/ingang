<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이메뉴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.modal {
	display: none; /* 처음에는 화면에서 보이지 않도록 설정 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경을 어둡게 표시 */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.menu {
	border: 1px black solid;
	width: 23%;
	height: 100px;
	text-align: center;
	line-height: 100px;
	box-shadow: 5px 5px 5px gray;
	color: white;
	background: #FFBE33;
	border-color: #FFBE33;
	float: left;
	margin: 5px;
}

.menu:hover {
	background-color: white;
	color: black;
}

.menuB {
	background: #0099ff;
	border-color: #0099ff;
	float: right;
	margin: 3px;
	color: white;
}
</style>
<script type="text/javascript">
	function goView() {
		window.location.href = "userView.do?id=" + $
		{
			login.id
		}
		;
	}
</script>

</head>
<body>
	<div class="card shadow md-4">
		<!-- <div class="container"> -->
		<div class="card-header py-3">
			마이메뉴
			<!-- 		<h3>게시판 리스트</h3> -->
		</div>
		<div class="container" style="height: 100%">
			<h4 style="margin-bottom: 50px; margin-top: 50px">${login.id}환영합니다</h4>

			<div style="margin-bottom: 100px">
				<div class="menu"
					onclick="window.location.href='userView.do?id=${login.id}';">
					<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<strong>내
						정보</strong>
				</div>
				<div class="menu" onclick="window.location.href='findPwForm.do';">
					<!-- #에다 url 적으세요 -->
					<span class="glyphicon glyphicon-retweet"></span>&nbsp;&nbsp;<strong>비밀번호변경</strong>
					<!-- 메뉴이름 -->
				</div>
				<div class="menu"
					onclick="window.location.href='../order/myList.do';">
					<strong>교재 주문목록</strong>
				</div>
				<div class="menu" onclick="window.location.href='/enroll/orderList.do';">
					<strong>강의 결제목록</strong>
				</div>
				<div class="menu" onclick="window.location.href='/enroll/enrollList.do';">
					<strong>내 강의실</strong>
				</div>
				<div class="menu" onclick="window.location.href='#';">
					<strong>공백</strong>
				</div>
				<!-- 관리자 메뉴 -->

			</div>
		</div>
		<c:if test="${login.gradeNo == 9 }">
			<div class="container">
				<div style="margin-top: 10px; margin-buttom: 10px">
					<p>
						<strong>관리자 메뉴</strong>
					</p>
				</div>
			</div>
			<div class="container" style="height: 100%">
				<div style="margin-bottom: 100px">
					<div class="menu" onclick="window.location.href='userList.do';">
						<span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;<strong>유저
							리스트</strong>
					</div>

					<div class="menu" onclick="window.location.href='mentoPList.do';">
						<span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;<strong>멘토신청관리</strong>
					</div>
					
					<div class="menu" onclick="window.location.href='/enroll/orderListAll.do';">
						&nbsp;&nbsp;<strong>회원 강의 결제목록</strong>
					</div>
					
					<div class="menu" onclick="window.location.href='/order/list.do';">
						&nbsp;&nbsp;<strong>회원 교재 구매 목록</strong>
					</div>
				</div>
			</div>
		</c:if>
		<div class="container" style="margin-top: 1%;">


			<button style="float: right; background: #007BFF; border: #007BFF"
				type="button" class="btn btn-primary" id="outModal">회원탈퇴</button>

		</div>
	</div>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>비밀번호를 입력하세요</h2>
			<form id="userDelete" action="userDelete.do" method="post">
			<p>
				<input id ="id" name="id" value="${login.id}">
				<input type="password" id="pw" name="pw">
			</p>
			</form>
			<button id="out" class="btn btn-primary btn-user btn-block">확인</button>
		</div>
	</div>
	<script type="text/javascript">
		document.getElementById("outModal").addEventListener("click",
				function() {
					document.getElementById("myModal").style.display = "block";
				});

		document.getElementsByClassName("close")[0].addEventListener("click",
				function() {
					document.getElementById("myModal").style.display = "none";
				});

		document.getElementById("out").addEventListener("click",
				function() {
			document.getElementById("myModal").style.display = "none";
			 var form = document.getElementById("userDelete");
			  form.submit();
			
		});
		
	</script>



</body>
</html>