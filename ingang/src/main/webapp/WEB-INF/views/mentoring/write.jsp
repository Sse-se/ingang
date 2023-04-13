<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="jquery-ui.css" rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>멘토링 글쓰기</title>
</head>
<body>
<div class="mento" style = "width: 90%; margin: auto; margin-top: 70px; margin-bottom: 50px;">
	<div class="card shadow md-4">
		<div class="card-header py-3"></div>
		<div class="card-body">
			<form action="write.do" method="post" id="writeForm">
				<input type="hidden" name="mid" value="${login.id }">
				<div class="form-group">
					<label>머리말</label> <input name="head" class="form-control"
						id="head">
				</div>
				<h4>멘토 정보</h4>
				<div class="form-group">
					<label>분야</label> <select name="field" id="field"
						class="form-control">
						<option value="개발/프로그래밍">개발/프로그래밍</option>
						<option value="학문/외국어">학문/외국어</option>
						<option value="게임개발">게임개발</option>
						<option value="직무/마케팅">직무/마케팅</option>
						<option value="보안">보안</option>
						<option value="커리어">커리어</option>
						<option value="디자인">디자인</option>
						<option value="데이터 사이언스">데이터 사이언스</option>
					</select>
				</div>
				<div class="form-group">
					<label>경력</label> <input name="career" class="form-control"
						id="career">
				</div>
				<div class="form-group">
					<label>현직</label> <input name="incumbent" class="form-control"
						id="incumbent">
				</div>
				<div class="form-group">
					<label>멘토 소개글</label> <input name="intro" class="form-control"
						id="intro">
				</div>
				<h4>상담 가능 기간</h4>
				<div class="form-group">
					시작 일자: <input type="date" id="avaStartDate" name="avaStartDate">
				</div>

				<div class="form-group">
					종료 일자: <input type="date" id="avaEndDate" name="avaEndDate">
				</div>
				<div>
					<select id="avaStartTime" name="avaStartTime">
						<option value="" selected disabled>시간선택</option>
<%-- 						<c:forEach begin="13" end="18" var="time"> --%>
<!-- 							<option value="00">00:00</option> -->
<%-- 						</c:forEach> --%>
						<option value="00">00:00</option>
						<option value="01">01:00</option>
						<option value="02">02:00</option>
						<option value="03">03:00</option>
						<option value="04">04:00</option>
						<option value="05">05:00</option>
						<option value="06">06:00</option>
						<option value="07">07:00</option>
						<option value="08">08:00</option>
						<option value="09">09:00</option>
						<option value="10">10:00</option>
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						<option value="20">20:00</option>
						<option value="21">21:00</option>
						<option value="22">22:00</option>
						<option value="23">23:00</option>
					</select> ~ <select id="avaEndTime" name="avaEndTime">
						<option value="" selected disabled>시간선택</option>
						<option value="00">00:00</option>
						<option value="01">01:00</option>
						<option value="02">02:00</option>
						<option value="03">03:00</option>
						<option value="04">04:00</option>
						<option value="05">05:00</option>
						<option value="06">06:00</option>
						<option value="07">07:00</option>
						<option value="08">08:00</option>
						<option value="09">09:00</option>
						<option value="10">10:00</option>
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						<option value="20">20:00</option>
						<option value="21">21:00</option>
						<option value="22">22:00</option>
						<option value="23">23:00</option>
					</select>

				</div>
				<div class="form-group">
					<label>강의료</label> <input name="lecFee" class="form-control"
						id="lecFee">
				</div>
				<button class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-success">새로입력</button>
				<button type="button" class="btn btn-danger"
					onclick="history.back()">취소</button>
			</form>
		</div>
	</div>
	</div>
</body>

</html>