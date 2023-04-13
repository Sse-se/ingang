<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토링 상세보기</title>
<style type="text/css">
</style>


</head>
<body>
<div class="mento" style = "width: 90%; margin: auto; margin-top: 70px; margin-bottom: 50px;">
	<div class="card shadow md-4">
		<div class="card-body">
			<input type="hidden" name="mid" value="${param.mid }">
			<div>
				<h3>멘토링 소개</h3>
			</div>
			<div>
				${vo.memberimg }
				<c:if test="${vo.memberimg == null }">이미지가 없어요</c:if>
			</div>
			<div>${param.mid }</div>
			<div>${vo.head }</div>
			<div>
				<h3>멘토 정보</h3>
			</div>
			<div>분야 :${vo.field }</div>
			<div>경력 :${vo.career }</div>
			<div>현직 :${vo.incumbent }</div>
			<div>
				<h3>멘토 소개</h3>
			</div>
			<div>${vo.intro }</div>
			<h3>강의료</h3>
			<div>${vo.lecFee }</div>

			<div>
				<h3>상담 가능 시간</h3>
			</div>
			<div>
				<fmt:formatDate value="${vo.avaStartDate }" pattern="yyyy-MM-dd"></fmt:formatDate>
				~
				<fmt:formatDate value="${vo.avaEndDate }" pattern="yyyy-MM-dd"></fmt:formatDate>
			</div>
			<div>${vo.avaStartTime }:00~ ${vo.avaEndTime }:00</div>

		</div>
	<div>
		<c:if test="${login.id !=null && login.id != param.mid && mento.mento != 'O'}">
				<button type="button" class="btn btn-success" id="ReservationBtn"
				onclick="location.href='/reservation/write.do?mno=${vo.mno}&mid=${param.mid }&avaStartDate=${vo.avaStartDate }&avaEndDate=${vo.avaEndDate }&avaStartTime=${vo.avaStartTime }&avaEndTime=${vo.avaEndTime }&lecFee=${vo.lecFee }'">신청하기</button>
    

		</c:if>

		<c:if test="${login.id == param.mid }">
			<button type="button" class="btn btn-success" id="UpdateBtn"
				onclick="location.href='update.do?mno=${vo.mno}&mid=${param.mid }&page=${param.page }&perPageNum=${param.perPageNum}'">수정</button>
			<button type="button" class="btn btn-danger" id="DeadlineBtn"
				onclick="location.href='deadline.do?mno=${vo.mno}'">접수마감</button>
		</c:if>
		</div>
	</div>


	<div>
	</div>


</div>
</body>
</html>