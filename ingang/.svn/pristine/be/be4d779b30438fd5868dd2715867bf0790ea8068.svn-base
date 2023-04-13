<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 결제 내역</title>
<style type="text/css">
.dataRow:hover{
	cursor: pointer;
	background: #e3e6f0;
}

.active-Btn{
	color: white;
	background: #4e73df;
}
.active-Btn:hover{
	color: white;
	background: #4e73df;
}
.path {
 margin-top:15px;
 margin-bottom:30px;
  display: flex;
  align-items: center;
  font-size: 14px;
  font-weight: bold;
  color: #333;
}

.path span:not(:last-child)::after {
  content: "";
  display: inline-block;
  margin: 0 10px;
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background-color: #ccc;
}

.path span:last-child {
  color: #666;
}
.layout_padding{
	padding: 10px 0 90px 0;
}
h1{
	padding-bottom: 8px;
	border-bottom: 4px solid #187FD9;
}
.table{
	margin-top: 40px;
}
</style>

<script type="text/javascript">
$(function(){
	// 리스트중 한 행 클릭
	$(".dataRow").click(function(){
		// 클릭한 행에서 예약번호 가져오기
		let eno = $(this).find(".eno").text();
		location = "orderView.do?eno="+eno+"&page=${pageObject.page }&perPageNum=${pageObject.perPageNum }&all=0";
	});

	<c:if test="${msg != null}">
		// 메시지 있으면 출력
		$("#messageModal").modal("show")
	</c:if>
	
});

</script>

</head>
<body>
	<section class="layout_padding">
		<div class="container">
			<div class="path">
			  <span>Home</span>
			  <span>강의 결제내역</span>
			</div>
		
			<h1 style="color:#333333">결제 내역</h1>
			
		<table class="table">
			<thead>
				<tr>
					<th>주문일</th>
					<th>주문번호</th>
					<th>강의명</th>
					<th>총결제금액</th>
					<th>결제상태</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list }" var="vo">
				<tr class="dataRow">
					<td><fmt:formatDate value="${vo.payDate }" pattern="yyyy-MM-dd"/></td>
					<td class="eno">${vo.eno }</td>
					<td>${vo.listtitle }</td>
					<td>${vo.totalprice }원</td>
					<td>${vo.status }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div id="pageNavDiv"><pageNav:pageNav listURI="orderList.do" pageObject="${pageObject }"/></div>
		
		
		</div>
	</section>
	
			<div class="modal" id="messageModal">
				<div class="modal-dialog">
					<div class="modal-content">
		
						<!-- Modal body -->
						<div class="modal-body">
							<div class="form-group" id="modal-delete-content">
								<div class="small-modal-content icon-content" id="small-modal-delete-content">
								    <span class="infd-icon">
								    <i class="fa fa-check" style="font-size:45px"></i>
								    </span>
								    <span class="description">${msg }</span>
								    
								  </div>
							</div>
						</div>
		
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
						</div>
		
					</div>
				</div>
			</div>
	
	
	
	
	
</body>
</html>