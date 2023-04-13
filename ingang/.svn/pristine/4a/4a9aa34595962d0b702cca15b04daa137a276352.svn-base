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

.table {
	background: #eee;
	border-radius: 45px 45px 45px 45px;
	border-collapse: collapse;
	padding-left: 10px;
	margin-left: 25px;
	width: 95%;
	
}

tr, td, th {
	border-bottom: hidden;
	border-top: hidden;
}

.show {
	border-bottom: thin;
	border-top: medium;
}

.br, .tbr {
	border: solid 2px;
	height: 1px;
	color: #aaa;
}
.bookTable:hover {
	cursor: pointer;
	background: #ccc;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>내 주문 목록</title>
<script type="text/javascript">
	$(function() {

		// 검색 데이터 유지
		<c:if test="${!empty pageObject.word}">
			$("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
			$("#word").val("${pageObject.word}");
		</c:if>
		
		
		$(".bookTable").click(function() {
			var no = $(this).find(".bookNo").text();
			location = "/book/view.do?no=" + no
		});
		$(".viewBtn").click(function() {
			var ordNo = $(this).closest(".dataDiv").find(".ordNo").text();
// 		    alert(ordNo);
			location = "/order/view.do?ordNo=" + ordNo
			+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
			+ "&key=${pageObject.key}&word=${pageObject.word}"
			;
		});

// 		$(".reviewBtn").click(function(){
// 			var no = $(this).find(".bookNo").text();
// 			location="/book/view.do?no=" + no + "&#review1"
// 		});
	});
</script>
</head>
<body class="sub_page">
	<section class="layout_padding">
		<div class="container">
			<h1>내 주문 목록</h1>
			<div class="row">
				<div class="col-md-12">
					<form action="myList.do" method="post">
						<input type="hidden" name="perPageNum"
							value="${pageObject.perPageNum }">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<select class="form-control" id="key" name="key">
									<option value="t">주문번호</option>
<!-- 									<option value="c">아이디</option> -->
									<option value="w">배송상태</option>
<!-- 									<option value="tc">주문번호/아이디</option> -->
<!-- 									<option value="tw">주문번호/배송상태</option> -->
<!-- 									<option value="cw">아이디/배송상태</option> -->
<!-- 									<option value="tcw">모두</option> -->
								</select>
							</div>
							<input type="text" class="form-control" placeholder="Search"
								id="word" name="word">
							<div class="input-group-append">
								<button class="btn btn-success" type="submit">검색</button>
							</div>
						</div>

					</form>
				</div>
			</div>
			<div class="filters-content">
				<c:forEach items="${list }" var="vo">
				<div class="dataDiv">
					<span style="float: right;"><button type="button" class="btn btn-info viewBtn">주문 상세보기</button></span>
					
					<table class="table bookTable">
						<tr class="dataRow">
							<td><c:if test="${vo.arriveDate == null }"><h4><fmt:formatDate value="${vo.orderDate }" pattern="yyyy-MM-dd" />주문 </h4></c:if>
							<c:if test="${vo.arriveDate != null }"><h4><fmt:formatDate value="${vo.arriveDate }" pattern="yyyy-MM-dd" />배송됨</h4></c:if>
							</td>
							<td style="float: right; text-align: left;">
							<h5>주문번호:<span class="ordNo">${vo.ordNo }</span></h5>
							<input  value="${vo.ordNo }" name="ordNo" hidden="">
							</td>
						<tr>
						<tr class="tbr">
						</tr>
						<tbody>
							<tr>
								<th >배송상태:${vo.dlvCondition }
								<input value="${vo.dlvCondition }" name="dlvCondition" hidden="">
								</th>
							</tr>
							<tr>
								<td style="width: 60%;"><img alt="${vo.fileName }" src="${vo.fileName }" width="250px" height="250px"></td>
								<td><h3>${vo.bookName }</h3>
									<br>구분:${vo.bookDiv }<br>가격:${vo.price }<br><br>총가격:${vo.totalPrice }</td>
							</tr>
							<tr>
								<td class="bookNo" hidden="">${vo.bookNo }</td>
							</tr>
						</tbody>
					</table>
				</div>
					<div class="br"></div>
				</c:forEach>
				<br />

			</div>
			<div id="pageNavDiv" style="width: 100%;height: 2em;">
				<pageNav:pageNav listURI="myList.do" pageObject="${pageObject }"  />
			</div>

		</div>
	</section>
</body>
</html>