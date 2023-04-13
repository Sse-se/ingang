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
						<th>필드</th>
						<th>커리어</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vo }" var="vo">
						<tr class="dataRow">
							<td class="id">${vo.id }</td>
							<td>${vo.field }</td>
							<td>${vo.cer_career }</td>
							<td><input name="id" value="${vo.id }" type="hidden"> <a href="mentoApp.do?id=${vo.id }">승인</a><td>
							
							
						</tr>
					</c:forEach>
				</tbody>
			</table>

			

		</div>
	


</body>
</html>