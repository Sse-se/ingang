<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대화방 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">


.dataRow:hover{
	background: #eee;
	cursor: pointer;
}


h1 {
  text-align: center;
  font-size: 36px;
  margin-bottom: 50px;
}


table {
  width: 800px;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
}

th{
	text-align: left;
	background: #009933;
	color: #EDF3FB;
	}

</style>
<script type="text/javascript">

	$(function() {
		$(".dataRow").click(function() {
					let roomno = $(this).find(".roomno").text();
					let par1 = $(this).find(".par1").text();
					
					
					location = "/message/list.do?roomno=" + roomno + "&par1=" + par1;
				});
			
	});
</script>
</head>
<body>
	<div class="container">
		<h1></h1>
		<input type="hidden" name="id" id="id" value="${login.id }">
		<table class="table">
			<thead>
				<tr>
					<th style="text-align : left;">방 번호</th>
					<c:if test="${mento.mento != 'O' }">
					<th style="text-align : left;">분야</th>
					</c:if>
					<th style="text-align : left;">프로필</th>
					<th style="text-align : left;">아이디</th>
					<th style="text-align : left;">최근 메시지</th>
					<th style="text-align : left;">상담 시간</th>
					<th style="text-align : left;">상태</th>
					
					
				</tr>
			</thead>  <colgroup> 
    </colgroup> 
			<tbody>
				<c:forEach items="${list }" var="vo">
						
					<tr class="dataRow">
						<td class="roomno">${vo.roomno }</td>
						<c:if test="${mento.mento != 'O' }">	
						<td style="text-align: left;">${vo.field }</td>
						</c:if>
						<c:if test="${login.id == vo.par1}">
							<td><img class="img img-circle" style="width: 30%"   src="${vo.memberimg}"></td>
							<td class="par1">${vo.par2 }</td>
						</c:if>
						
						<c:if test="${login.id != vo.par1}">	
							<td><img class="img img-circle" style="width: 30%" src="${vo.memberimg}"></td>
							<td class="par1">${vo.par1 }</td>
						</c:if>
						<c:if test="${login.id == vo.par1 }">	
						<td style="text-align: left;">${vo.lmcontent }<span class="label label-danger">${vo.unreadcount1}</span></td>
						</c:if>
						<c:if test="${login.id != vo.par1 }">	
						<td style="text-align: left;">${vo.lmcontent }<span class="label label-danger">${vo.unreadcount2}</span></td>
						</c:if>
						
						<td style="text-align: left;">
						<fmt:formatDate value="${vo.resDate }" pattern="yyyy-MM-dd"></fmt:formatDate><br>
						${vo.resTime }:00 ~ ${vo.resTime+1 }:00
						
						</td>
						
						<td style="text-align: left;">${vo.roomstatus }
						<c:if test = "${mento.mento == 'O'}">
						<form action="updatea.do" method="POST">
						    <input type="hidden" name="roomno" value="${vo.roomno}">
						    <button type="submit" class="btn btn-success">승인</button>
						</form>
						<form action="updater.do" method="POST">
						    <input type="hidden" name="roomno" value="${vo.roomno}">
						    <button type="submit" class="btn btn-warning">거절</button>
						</form>
						<form action="updatet.do" method="POST">
						    <input type="hidden" name="roomno" value="${vo.roomno}">
						    <button type="submit" class="btn btn-danger">종료</button>
						</form>
						
						</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>