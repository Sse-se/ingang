<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.filters-content {
	background: #ddd;
}

.table, .tablebook {
	background: #eee;
	border-radius: 45px 45px 45px 45px;
	border-collapse: collapse;
}

tr, td, th {
	border-bottom: hidden;
	border-top: hidden;
}

.show {
	border-bottom: thin;
	border-top: medium;
}

.br {
	border: solid 2px;
	height: 1px;
	color: #aaa;
}
.tablebook:hover {
	cursor: pointer;
	background: #ccc;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>주문 상세 보기</title>
<script type="text/javascript">
	$(function() {
		$(".table").click(function() {
			var no = $(this).find(".bookNo").text();
			location = "/book/view.do?no=" + no 
		});
		$(".deleteBtn").click(function() {
			var ordNo = $(".row").find(".ordNo1").val();
// 			alert(ordNo);
			location = "delete.do?ordNo=" + ordNo
			alert("주문목록이 삭제되었습니다.")
		});
		$(".myListBtn").click(function() {
			history.back();
		});

	});
</script>
</head>
<body class="sub_page">
	<section class="layout_padding">
		<div class="container">
			<h1>주문 상세보기</h1>
			<div class="filters-content">
						<c:forEach items="${vo }" var="vo" begin="0" end="0">
				<div class="row">
					<div class="col-md-4">
						<c:if test="${vo.arriveDate == null }"><h4><fmt:formatDate value="${vo.orderDate }" pattern="yyyy-MM-dd" />주문 </h4></c:if>
						<c:if test="${vo.arriveDate != null }"><h4><fmt:formatDate value="${vo.arriveDate }" pattern="yyyy-MM-dd" />배송됨</h4></c:if>
							
					</div>
					<div class="col-md-5"></div>
					<div class="col-md-2 ordNo" style="text-align: right;" ><h5>주문번호:${vo.ordNo }</h5></div>
					<div class="col-md-1"><input class="ordNo1" value="${vo.ordNo }" hidden=""></div>
				</div>
				</c:forEach>
				<br />		
				<c:forEach items="${vo }" var="vo">
				<table class="table tablebook" id="bookTable">
					<tbody>
						<tr>
							<th>배달상태:${vo.dlvCondition }</th>
						</tr>
						<tr>
							<td style="width: 50%;"><img alt="${vo.fileName }" src="${vo.fileName }"width="150px" height="150px"></td>
							<td><h3>${vo.bookName }<c:if test="${vo.dlvCondition eq '배송완료'}" ><span style="float: right;"><button type="button" class="btn btn-outline-success reviewBtn">리뷰쓰기</button></span></c:if></h3><br>구분:${vo.bookDiv }<br>가격:${vo.price }<br>개수:${vo.odquantity }</td>
						</tr>
						<tr>
							<td class="bookNo" hidden="" >${vo.bookNo }</td>
						</tr>
					</tbody>
				</table>
				</c:forEach>
				<div class="br"></div><br>
				<c:forEach items="${vo }" var="vo" begin="0" end="0">
				<table class="table">
					<tbody>
						<tr>
							<th><h3>배송정보</h3></th>
						</tr>
						<tr>
							<th style="width: 20%; ">받는사람 : ${vo.oname } </th>
						</tr>
						<tr>
							<th>배송지 : ${vo.dlvAdress }</th>
						</tr>
						<tr>
							<th>전화번호 : ${vo.tel }</th>
						</tr>
					</tbody>
				</table>
				</c:forEach>
				<div class="br"></div><br>
				<c:forEach items="${vo }" var="vo" begin="0" end="0">
				<table class="table">
					<tbody>
						<tr>
							<th><h3>결제정보</h3></th>
						</tr>
						<tr>
							<th style="width: 20%; ">구매자 : ${vo.id } </th>
						</tr>
						<tr>
							<th>결제수단 : ${vo.payMethod }</th>
						</tr>
						<tr>
							<td style="float: right;"><h1>총가격 : ${vo.totalPrice }</h1></td>	
						</tr>
					</tbody>
				</table>
				</c:forEach>
				<br />
			</div>

			<div class="row">
				<div class="col-md-6">
					<button class="btn btn-dark myListBtn" style="text-align: center; width: 550px">이전메뉴
						</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-dark deleteBtn" style="text-align: center; width: 550px">주문내역
						삭제</button>
				</div>
			</div>
		</div>
	</section>
</body>
</html>