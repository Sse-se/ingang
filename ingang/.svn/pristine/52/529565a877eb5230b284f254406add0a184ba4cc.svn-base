<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토링 리스트</title>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}

.check input[type="checkbox"] {
    -webkit-appearance: none;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    position: relative;
    width: 20px;
    height: 20px;
    cursor: pointer;
    outline: none !important;
    border: 1px solid #9999;
    vertical-align: middle;
}
.check input[type="checkbox"]::before {
    content: "\2713";
    position: absolute;
    top: 50%;
    left: 50%;
    overflow: hidden;
    transform: scale(0) translate(-50%, -50%);
    line-height: 1;
}
.check input[type="checkbox"]:checked {
    background-color: #63aeff;
    border-color: rgba(255, 255, 255, 0.3);
    color: white;
}
.check input[type="checkbox"]:checked::before {
    border-radius: 4px;
    transform: scale(1) translate(-50%, -50%)
}
</style>
 <link href="/css/responsive.css" rel="stylesheet" />
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
			var mno = $(this).find(".mno").text();
			var mid = $(this).find(".mid").text();
			location = "view.do?mno=" + mno + "&mid=" + mid
			+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
		});

		 $("input[name='option']").change(function() {
			    const checkedValues = [];
			    $("input[name='option']:checked").each(function() {
			      checkedValues.push($(this).val());
			    });
			    console.log(checkedValues);
			  });
		 $("#searchBtn").on("click", function() {
			    const checkedValues = [];
			    $("input[name='option']:checked").each(function() {
			      checkedValues.push($(this).val());
			    });
			    const queryString = checkedValues.join(",");
		        location.href = "/mentoring/flist.do?checkedValues=" + queryString
		        + "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
			  
			  });
			});
	
</script> 
</head>
<body>
	<div class="mento" style = "width: 90%; margin: auto; margin-top: 70px; margin-bottom: 50px;">

	<div class="card shadow md-4 row">

		<div class="card-body">

		<div class="check col-md-2" style="border: 1px solid #666; float: left; margin-left: 40px; margin-top: 30px;">
		<div class="row">
			<div class="col-md-12"><input type="checkbox" id="check1" name="option" value="개발/프로그래밍"><label for ="check1">개발/프로그래밍</label></div>
			<div class="col-md-12"><input type="checkbox" id="check2" name="option" value="학문/외국어"><label for ="check2">학문/외국어</label></div>
			<div class="col-md-12"><input type="checkbox" id="check3" name="option" value="직무/마케팅"><label for ="check3">직무/마케팅</label></div>
			<div class="col-md-12"><input type="checkbox" id="check4" name="option" value="게임개발"><label for ="check4">게임 개발</label></div>
			<div class="col-md-12"><input type="checkbox" id="check5" name="option" value="보안"><label for ="check5">보안</label></div>
			<div class="col-md-12"><input type="checkbox" id="check6" name="option" value="커리어"><label for ="check6">커리어</label></div>
			<div class="col-md-12"><input type="checkbox" id="check7" name="option" value="디자인"><label for ="check7">디자인</label></div>
			<div class="col-md-12"><input type="checkbox" id="check8" name="option" value="데이터사이언스"><label for ="check8">데이터 사이언스</label></div>
		<div class="" style = "border: 1px solid #666; margin-left: 40px;">
		<button id="searchBtn" class="btn btn-secondary">Search</button>
		</div>
		</div>
		</div>
		

			<div class= "col-md-9" style="float: right; margin-top: 30px; margin-right: 40px;">
			<table class="table" style="border: 1px solid #eee;">
				<thead>
					<tr>
						<th>번호</th>
						<th>분야</th>
						<th>머리말</th>
						<th>경력</th>
						<th>현직</th>
						<th>아이디</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${flist }" var="vo">
						<tr class="dataRow">
							<td class="mno">${vo.mno }</td>
							<td>${vo.field }</td>
							<td>${vo.head }</td>
							<td>${vo.career }</td>
							<td>${vo.incumbent }</td>
							<td class="mid">${vo.mid }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div style = "margin-top: 30px;">
			<c:if test = "${mento.mento == 'O'}">
			<button type="button" class="btn btn-success" id="UpdateBtn" onclick= "location.href='write.do'">글 등록</button>
			</c:if>
			<c:if test = "${mento.mento != 'O'}">
			<button type="button" class="btn btn-success" id="ApplyBtn" onclick= "location.href='/m_apply/write.do'">멘토 지원하기</button>
			</c:if>
			<button type="button" class="btn btn-success" id="MessageRoomBtn" onclick= "location.href='/messageroom/list.do'">진행 중인 상담 목록<span class="badge badge-pill badge-danger">${unreadcount }</span></button>
			</div>
			
			<div style = "margin-top: 30px;">
				<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" />
			</div>
		</div>
</div>
	</div>
	</div>
</body>
</html>