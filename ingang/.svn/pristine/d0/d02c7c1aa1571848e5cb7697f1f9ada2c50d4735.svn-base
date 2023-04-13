<%@	 page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row11 :hover {
	cursor: pointer;
	background: #eeeeee;
}
</style>
<script type="text/javascript">
$(function(){
	  
	  $(".dataRow").click(function(){
	    var no = $(this).find(".no").text();
	    location = "view.do?no=" + no + "&inc=1"
		    + "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
	    	+ "&key=${pageObject.key}&word=${pageObject.word}";
	  });
		// 검색 데이터 유지
		<c:if test="${!empty pageObject.word}">
			$("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
			$("#word").val("${pageObject.word}");
		</c:if>
});
</script>
</head>
<body>
<div class="card shadow md-4">
	<div class="card-header py-3">
		<h4>공지사항 리스트</h4>
		<c:if test="${login !=null && login.gradeNo ==9 }">
		<a href="write.do" class="btn btn-dark" style="float:right">공지 등록</a>
		</c:if>
	</div>
	<div class="row1">
		<div class="col-md-3">
			<form action="list.do" method="post">
				<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<select class="form-control" id="key" name="key">
						<option value="t">제목</option>
						<option value="c">내용</option>
						<option value="tc">전체</option>
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
	<div class="card-body">
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>등록일(수정일)</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody class="row11">
			<c:forEach items="${list }" var="vo">
			 <tr class="dataRow">
				<td class="no">${vo.no }</td>
				<td>${vo.title }</td>
				<td><fmt:formatDate value="${vo.startDate }" pattern="yyyy년MM월dd일"/> </td>
				<td><fmt:formatDate value="${vo.endDate }" pattern="yyyy년MM월dd일"/> </td>
				<td><fmt:formatDate value="${vo.updateDate }" pattern="yyyy년MM월dd일"/> </td>
				<td class="inc">${vo.hit }</td>
			 </tr>
			</c:forEach>
			</tbody>
		</table>
		<div>
		<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
		</div>
	</div>
</div>
</body>
</html>