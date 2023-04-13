<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.formform{
	margin-left:380px;
	margin-right:700px;
}
</style>
<script type="text/javascript">
$(function() {
	
 	$("#cancelBtn").click(function() {
 		history.back();
 	});
});
</script>
<meta charset="UTF-8">
<title>교재 등록 폼</title>
</head>
<body class="sub_page">
	<section class="layout_padding">
		<div class="container">
			<h1>교재 등록 폼</h1>
		</div>
		<div class="formform">
			<form action="write.do" method="post"enctype="multipart/form-data">
				<div class="form-group">
					<label>교재명</label>
					 <input name="bookName" class="form-control" placeholder="※ 필수로 입력하셔야 합니다." required>
				</div>
				<div class="form-group">
					<label>이미지파일 ※ 필수로 첨부하셔야 합니다.</label>
					 <input name="ImageFile" id="ImageFile"
						class="form-control" type="file">
				</div>
				<div class="form-group">
					<label>책소개</label>
					<textarea name="bookIntroduce" class="form-control" placeholder="※ 필수로 입력하셔야 합니다." required></textarea>
				</div>
				<div class="form-group">
					<label>과목(영역) ※ 필수로 선택하셔야 합니다.</label>
					<div class="form-check row">
					<label class="radio-inline"><input
						type="radio" name="bookDiv" id="bookDiv" value="JAVA" >JAVA
					</label> <label class="radio-inline"> <input type="radio"
						name="bookDiv" id="" value="Jsp/Servlet" class="form-chek-input">Jsp/Servlet
					</label> <label class="radio-inline"> <input type="radio"
						name="bookDiv" id="bookDiv" value="Spring" class="form-chek-input">Spring
					</label>
					</div>
				</div>
					<div class="form-group">
						<label>출판사</label>
						<input name="publisher" id="publisher" class="form-control" placeholder="※ 필수로 입력하셔야 합니다." required>
					</div>
					<div class="form-group">
						<label>수량</label> 
						<input name="quantity" id="quantity" class="form-control" placeholder="※ 숫자만 입력가능합니다." pattern="[0-9]{1,4}" required>
					</div>
					<div class="form-group">
						<label>상태 ※ 필수로 선택하셔야 합니다.</label>
						<div class="form-check row">
						<label class="radio-inline"> <input
						type="radio" name="status" id="status" value="판매중" class="form-chek-input">판매중
					</label> <label class="radio-inline"> <input type="radio"
						name="status" id="status" value="품절" class="form-chek-input">품절
					</label> 
						</div> 
					</div>
					<div class="form-group">
						<label>발행일</label> 
						<input name="pubDate1" id="pubDate" class="form-control" type="date" required>
					</div>
					<div class="form-group">
						<label>가격</label> 
						<input name="price" id="price" class="form-control" placeholder="※ 숫자만 입력가능합니다." pattern="^[0-9]*$" required>
					</div>
				<button class="btn btn-dark">등록</button>
				<button type="reset" class="btn btn-danger">새로입력</button>
				<button type="button" id="cancelBtn" class="btn btn-info">취소</button>
			</form>
		</div>
	</section>
</body>
</html>