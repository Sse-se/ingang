<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 리스트</title>

<style type="text/css">
.dataRow {
	min-width:19%;
	width:20%;
	height:400px;
	margin-right: 3%; 
	text-align:center;
	position: relative;
    margin-top: 25px;
    border-radius: 10px;
    border-radius: 15px;
    overflow: hidden;
}
.dataRow:hover {
	border-color : aqua;
	background: #eafaf1;
	cursor: pointer;
}
.img-box{
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    height: 215px;
    border-radius: 0 0 0 45px;
    margin: -1px;
    padding: 25px;
}
.dataRow .img{
	max-width: 150%;
    max-height: 200px;
    -webkit-transition: all .2s;
    transition: all .2s;
}
</style>

<script type="text/javascript">
$(function(){
	
	// 검색 데이터 유지
	<c:if test="${!empty pageObject.word}">
		$("#key").val("${(!empty pageObject.key)?pageObject.key:'t'}");
		$("#word").val("${pageObject.word}");
	</c:if>

	// view 이동
 	$(".dataRow").click(function(){
		var no = $(this).find(".no").text();
		// alert("글번호 : " + no);
		location = "view.do?no=" + no
			+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
			+ "&key=${pageObject.key}&word=${pageObject.word}"
		;	
	});

});
</script>

</head>
<body>
<div class="card shadow md-4">
<!-- <div class="container"> -->
	<div class="card-body">
	<!-- 관리자만 버튼 보이게 -->
	<c:if test="${login != null && login.gradeNo == 9 }">
		<a href="write.do" class="btn btn-dark" style="float:right">강의 등록</a>
	</c:if>
		<div class="row1">
			<div class="col-md-3">
				<form action="list.do" method="post">
					<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
						  <select class="form-control" id="key" name="key">
						    <option value="t">강의</option>
						    <option value="n">강사</option>
						    <option value="tn">전체</option>
						  </select>
					  </div>
					  <input type="text" class="form-control" placeholder="search" id="word" name="word">
					  <div class="input-group-append">
					    <button class="btn btn-success" type="submit">검색</button>
					  </div>
					</div>			
				</form>
			</div>		
		</div>
		<div class="row2">
			<div class="col-md-12" align="center">
				<c:forEach items="${list }" var="vo">
					<div class="dataRow" style="display: inline-block">
						<div class="no" hidden="hidden">${vo.no }</div><br/>
						<div class="img-box">
						<img src="${vo.image }" class="img">
						</div><br/>
						<div style="color:black; font-size: 14pt; font-family: fantasy;">
						<b>${vo.title }</b>
						</div>
						<br/>
						<div style="color: #097f09; font-size: 13pt; font-family: fantasy;" >
						<b>${vo.name }</b>
						</div>
						<div>
						<b>
						<fmt:formatDate value="${vo.startDate }" pattern="yyyy-MM-dd"/>
						~<fmt:formatDate value="${vo.endDate }" pattern="yyyy-MM-dd"/>
						</b>
						</div>
						<div style="color: #097f09">
						<b>
						<fmt:formatNumber value="${vo.price }" pattern="#,###"/>원
						</b>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<br/><br/>
		<div>
		<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
		</div>
	</div>
</div>
</body>
</html>