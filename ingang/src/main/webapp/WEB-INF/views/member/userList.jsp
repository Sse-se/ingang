<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저리스트</title>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<style type="text/css">
</style>
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	function myFunction() {
		var btnDiv = event.target.parentNode.querySelector('#btnDiv');
		if (btnDiv.style.display === "none") {
			btnDiv.style.display = "block";
		} else {
			btnDiv.style.display = "none";
		}
		var gradeBtns = btnDiv.querySelectorAll('#GBtn');
		for (var i = 0; i < gradeBtns.length; i++) {
			gradeBtns[i].addEventListener('click', function() {
				var gradeInput = btnDiv.querySelector('#gradeInput');
				gradeInput.value = this.value;
				btnDiv.querySelector('form').submit();
			});
		}
	}
</script>
<script type="text/javascript">
	
</script>
</head>
<body>

	<div class="card shadow md-4">
	<div class="container">
	<div class="row" style="margin-top:10px">
			<div class="col-md-12">
				<form action="userList.do" method="post">
					<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
						  <select class="form-control" id="key" name="key">
						    <option value="t">아이디</option>
						    
						  </select>
					  </div>
					  <input type="text" class="form-control" placeholder="Search" id="word" name="word">
					  <div class="input-group-append">
					    <button class="btn btn-success" type="submit">검색</button>
					  </div>
					</div>
					
				</form>
			</div>
		</div>
		</div>
		<!-- <div class="container"> -->
		<div class="card-header py-3">
			게시판 리스트
			<!-- 		<h3>게시판 리스트</h3> -->
		</div>
		<div class="card-body">
			<table class="table">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>가입일</th>
						<th>상태</th>
						<th>등급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="vo">
						<tr class="dataRow">
							<td class="id">${vo.id }</td>
							<td>${vo.name }</td>
							<td>${vo.regDate }</td>
							<td>${vo.status }</td>
							<td>${vo.gradeName }<button onclick="myFunction()">변경</button>
								<div id="btnDiv" style="display: none">
									<form action="changeGrade.do" method="post">
										<input name="id" value="${vo.id}" type="hidden"> 
										<input name="gradeNo" id="gradeInput" type="hidden">
										<button class="btn1" id="GBtn" value="1">일반</button>
										<button class="btn1" id="GBtn" value="9">관리자</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div>
				<pageNav:pageNav listURI="userList.do" pageObject="${pageObject }" />
			</div>

		</div>
	</div>


</body>
</html>