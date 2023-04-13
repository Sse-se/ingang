<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 수정 폼</title>
<script type="text/javascript">
$(function() {
 	$("#cancelBtn").click(function() {
 		history.back();
 	});
});
</script>
</head>
<body>
	<!-- 전체 -->
	<div class="card shadow md-4">
		<div class="card-header py-3">강의 수정 (관리자 권한)</div>
		<div class="card-body">
			<form action="update.do" method="post" enctype="multipart/form-data">
			
				<div class="form-group">
					<input name="no" class="form-control" hidden="hidden" value="${vo.no }">
				</div>

				<!-- 페이지 정보 세팅 -->
				<input type="hidden" name="page" value="${param.page }"> <input
					type="hidden" name="perPageNum" value="${param.perPageNum }">
				<input type="hidden" name="key" value="${param.key }"> <input
					type="hidden" name="word" value="${param.word }">

				<div class="row">

					<!-- left -->
					<div class="col-md-6">
						<div class="form-group">
							<label>강의명</label>
							<input name="title" class="form-control" value="${vo.title }">
						</div>
						<div class="form-group">
							<label>담당자</label>
							<input name="teacher" class="form-control" value="${vo.teacher }">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea rows="5" name="content" class="form-control">${vo.content }</textarea>
						</div>
					</div>

					<!-- right -->
					<div class="col-md-6" align="right">
						<div class="form-group">	
							<img src="${vo.image }">
						</div>
						<br />	
						<div class="form-group">
							<input placeholder="${vo.image }" name="imageM" class="form-control" id="imageM" type="file" required="required">
						</div>
						<br />
						<div class="form-group">
							<label>동영상</label>
							<input name="vid" class="form-control" value="${vo.vid }">
						</div>
						<br />
						<div class="form-group">	
							<img src="${vo.fileName }">
						</div>
						<br />
						<div class="form-group">
							<label>관련교재</label>
							<input name="cbno" class="form-control" value="${vo.cbno }">
						</div>
						<br />
						<div class="form-group">
							<label>강의가격</label>
							<input name="price" class="form-control" value="${vo.price }">
						</div>
					</div>
				</div>
				<div>
					<div class="form-group col-md-4">
						<label>시작일</label>
						<fmt:formatDate value="${vo.startDate }" pattern="yyyy-MM-dd" />
						<input name="startDate" class="form-control" placeholder="${vo.startDate }" type="date" required="required" />
					</div>
					<div class="form-group col-md-4">
						<label>종료일</label>
						<fmt:formatDate value="${vo.endDate }" pattern="yyyy-MM-dd" />
						<input name="endDate" class="form-control" placeholder="${vo.endDate }" type="date" required="required" />
					</div>
					<div class="form-group col-md-2">
						<!-- 작성자(관리자) : 로그인 정보  -->
						<h6>작성자(관리자)</h6>
						<input name="writer" class="form-control" id="writer" value="${login.id }" readonly="readonly">
					</div>
				</div>
				<br />
				<button class="btn btn-success">수정</button>
				<button type="reset" class="btn btn-dark">새로입력</button>
				<button class="btn btn-warning" type="button" id="cancelBtn">취소</button>
			</form>
		</div>
	</div>
</body>
</html>