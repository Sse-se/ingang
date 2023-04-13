<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.payment {
	margin: auto;
	width: 90%;
	height: auto;
	overflow: hidden;

	clear: both;
	position: relative;
}

.product {
	border-bottom: 1px solid #eee;
	height: 100px;
	width: 100%;
	text-align: center;
}

.title {
	
	width: 40%;
}

.image {
	height: 100%;
}

.piname, .image, .Qty, .price {
	
	width: 15%;
}

.Qty, .price, .title, .piname {
	font-size: 20px;
	height: 30px;
	margin-top: 35px;
}

.image>img {
	margin-top: 10px;
	height: 80px;
	width: 80px;
}

 #userInfo{
 display: none;
 
 }
 .nameerr{
 text-align: right; 
 margin-top: 15px;
  display: none;
  color: red;
  }
  .telerr{
   text-align: right; 
 margin-top: 15px;
  display: none;
  color: red;
  }
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>교재 결제</title>
<script type="text/javascript" src="/js/regEx.js"></script>
<script type="text/javascript">

		
$(function() {

	console.log("........................")

	$("document").ready(function(){
		let piNo = $(".piNo").map(function() {
		    return $(this).val();
		}).get();

		

		if(piNo.includes("1")){
		$("#userInfo").show();
	}
});
	


				





$("#nameInput").keydown(function(event){
    console.log(event.key);

	if(event.keyCode ==13 || event.which == 13){

		 return false;
		}
		
	 });



 $("#nameInput").keyup(function(event){

	 if (event.keyCode == 13 || event.which == 13) {
		    // 엔터 키를 눌렀을 때의 동작을 처리
		    // 이 코드는 input 요소의 값을 해당 input 요소에 입력하는 역할을 합니다.
		 $(this).blur();
		 return false;
		  }
		
	 });

 $("#tel").keydown(function(event){
    console.log(event.key);

	if(event.keyCode ==13 || event.which == 13){

		 return false;
		}
		
	 });



 $("#tel").keyup(function(event){

	 if (event.keyCode == 13 || event.which == 13) {
		    // 엔터 키를 눌렀을 때의 동작을 처리
		    // 이 코드는 input 요소의 값을 해당 input 요소에 입력하는 역할을 합니다.
		 $(this).blur();
		 return false;
		  }
		
	 });

 $("#nameInput").on("blur", function() {
	  // 커서가 해당 input 요소 밖으로 이동되었을 때 실행되는 함수
	 if(!checkData(reg_name, $("#nameInput"), reg_name_error_msg, 1)){ 
		
		$(".nameerr").text(reg_name_error_msg);
		$(".nameerr").show();
		 return false;
		 }else{
	    $(".nameerr").text("");
		$(".nameerr").hide();
		return;
		 }
		 
	});

 $("#tel").on("blur", function() {
	  // 커서가 해당 input 요소 밖으로 이동되었을 때 실행되는 함수
	 if(!checkData(reg_tel, $("#tel"), reg_tel_error_msg, 1)){ 
			
			$(".telerr").text(reg_tel_error_msg);
			$(".telerr").show();
			return false;
			 }else{
			$(".telerr").text("");
			$(".telerr").hide();
			return;
			 }
			 
		});


	$("#orderBtn").click(function(){

	if($(".nameerr").text() != "" )return false;

	
	 if($(".telerr").text() != "" ) return false;
			
	let selector = $(".custom-select").val();
	

	if(selector == '결제수단을 선택하세요'){

		return false;
		
		}else{
			return;
		}

			 

	});

});
</script>
</head>
<body>

	<div class="payment" style="margin-top: 70px; margin-bottom: 70px;">
		<div>
			<h3>상품 구매</h3>
			<hr>
		</div>
		

		<form action="/cartOrder/cartOrder.do" method="post"
			id="cartOrderForm" style="margin-top: 50px;">

			<div class="row">

				<div class="col-md-9">
					<c:forEach items="${cart }" var="vo">
						<c:choose>
							<c:when test="${vo.piNo eq 1 }">
								<div class="row product">

									<div class="col-md-2 image">
										<img src="${vo.image }">
									</div>

									<div class="col-md-2 piname">
										<span>교재</span>
									</div>

									<div class="col-md-4 title">
										<span> ${vo.bookName } </span>
									</div>

									<div class="col-md-2 Qty">
										<span>${vo.quantity }</span>
									<input class="quantityList" name="quantityList" type="hidden" value="${vo.quantity }">
									<input class="BidList" name="BidList" type="hidden" value="${vo.id }">
									<input class="piNo" name="piNo" type="hidden" value="${vo.piNo }">
									<input class="cartNoList" name="cartNoList" type="hidden" value="${vo.cartNo }">
									</div>

									<div class="col-md-2 price">

										<span>${vo.price * vo.quantity }원</span>

									</div>
									
									<c:set var="booktotalPrice"
							value="${booktotalPrice + vo.price * vo.quantity}" scope="page" />
							<input id="bookNoList" name="bookNoList" type="hidden" value="${vo.bookNo }">	
									

								</div>
							</c:when>
							<c:otherwise>
								<div class="row product">


									<div class="col-md-2 image">
										<img src="${vo.image }">
									</div>

									<div class="col-md-2 piname">
										<span>강의</span>
									</div>

									<div class="col-md-4 title">${vo.title }</div>
									

									<div class="col-md-2 Qty">

										<span>${vo.quantity }</span> 
									<input class="cartNoList" name="cartNoList" type="hidden" value="${vo.cartNo }">
									<input class="piNo" name="piNo" type="hidden" value="${vo.piNo }">
									<input class="CidList" name="CidList" type="hidden" value="${vo.id }">
									<input name="titleList" type="hidden" value="${vo.title }">
									</div>

									<div class="col-md-2 price">

										${vo.price * vo.quantity } <span>원</span>

									</div>
									
									
									<c:set var="coursetotalPrice"
							value="${coursetotalPrice + vo.price}" scope="page" />
							<input id="noList" name="noList" type="hidden" value="${vo.no }">		

								</div>
							</c:otherwise>
						</c:choose>
						<c:set var="totalPrice"
							value="${totalPrice + vo.price * vo.quantity}" scope="page" />


					</c:forEach>

					<div id="userInfo" style="margin-top: 50px;">
						<h4>받는사람 정보</h4>
						<hr />

				<div class="row">
					<div class="col-md-4">
						<div class="row" style="text-align: center;">
							<div class="col-md-4" style="margin-top: 20px;">
							<label>받는사람 :</label>
							</div>
							<div class="col-md-8" style="margin-top: 15px;">
						    <input class="form-control" id="nameInput" name="name" value="${member.name }">
							</div>
							<div class=col-md-12 style="">
							<span class="nameerr"></span>
							</div>
							<div class="col-md-4" style="margin-top: 20px;">
							<label>전화번호 :</label>
							</div>
							<div class="col-md-8" style="margin-top: 15px;">
						    <input class="form-control" id="tel" name="tel" value="${member.tel }">
							</div>
							<div class=col-md-12>
							<span class="telerr"></span>
							</div>
							<div class="col-md-4" style="margin-top: 20px;">
							<label>배 송 지 :</label>
							</div>
							<div class="col-md-8" style="margin-top: 15px;">
						    <input class="form-control" id="dlvAdress" name="dlvAdress" value="${member.address }">
							</div>
						</div>
					</div>
				</div>		
	     	</div>
		
				<div style="margin-top: 50px; margin-bottom: 50px;">
						<h4>구매자 정보</h4>
						<hr />
						<div class="row">
					<div class="col-md-4">
						<div class="row">
							<div class="col-md-4" style="margin-top: 20px;text-align: center;">
							<label>받는사람 :</label>
							</div>
							<div class="col-md-8" style="margin-top: 15px;">
						    <span>${member.name }</span>
							</div>
							<div class="col-md-4" style="margin-top: 20px;text-align: center;">
							<label>전화번호 :</label>
							</div>
							<div class="col-md-8" style="margin-top: 15px;">
						    <span>${member.tel }</span>
							</div>
							<div class="col-md-4" style="margin-top: 20px;text-align: center;">
							<label>배 송 지 :</label>
							</div>
							<div class="col-md-8" style="margin-top: 15px;">
						    <span>${member.address }</span>
							</div>
							<div class="col-md-4" style="margin-top: 20px;text-align: center;">
							<label>이 메 일 :</label>
							</div>
							<div class="col-md-8" style="margin-top: 15px;">
						    <span>${member.email }</span> 
							</div>
							<div class="col-md-4" style="margin-top: 20px;text-align: center;">
							<label>결제수단 :</label>
							</div>
							<div class="col-md-8" style="margin-top: 15px;">
						    <select name="payMethod" class="custom-select mb-3">
									<option selected>결제수단을 선택하세요</option>
									<option value="카드결제">카드결제</option>
									<option value="카카오페이">카카오페이</option>
									<option value="네이버페이">네이버페이</option>
								</select>
							</div>
							<div>
							 
								
						    </div>
						</div>
					</div>
				</div>	

					

					</div>

				</div>
				<div class="col-md-2 totalprice"
					style="position: fixed; left: 75%;border-radius: 20px;">
							<input id="booktotalPrice" name="booktotalPrice" value="${booktotalPrice }" type="hidden">
							<input id="coursetotalPrice" name="coursetotalPrice" value="${coursetotalPrice }" type="hidden">
							<input id="id" name="id" type="hidden" value="${vo.id }">
							
					<div class="total_wrap row" style="margin-top: 6px; border-radius: 5px; border: 2px solid #aaa;  background: skyblue;">
		<div class="col-md-6" style="margin-top: 30px; background: #eee;">
		<label>전체 교재 가격 :</label>
		</div>
		<div class="col-md-6" style="text-align: right; margin-top: 30px; background: #eee;">
			<span>${booktotalPrice }원</span>
		</div>
		<div class="col-md-6" style="margin-top: 20px; background: #eee;">
		<label>전체 강의 가격 :</label>
		</div>
		<div class="col-md-6" style="text-align: right; margin-top: 20px; background: #eee;">
			<span>${coursetotalPrice }원</span>
		</div>
		<div class="col-md-6" style="margin-top: 20px; background: #eee;">
		<label>총 금 액 :</label>
		</div>
		<div class="col-md-6" style="text-align: right; margin-top: 20px; background: #eee;">
			<span>${totalPrice}원</span>
		</div>
		<div class="col-md-6" style="margin-top: 20px; background: #eee;height: 30px;">
		<label><strong>할인금액 :</strong></label>
		</div>
		<div class="col-md-6"style="text-align: right; margin-top: 20px; background: #eee; height: 30px;">
		<span>0원</span>
		</div>				
		
		<div class="col-md-6" style="margin-top: 20px; background: #eee;height: 30px;">
		<label><strong>결제 금액 :</strong></label>
		</div>
		<div class="col-md-6"style="text-align: right; margin-top: 20px; background: #eee; height: 30px;">
		<span>${totalPrice}</span>
		</div>				
						<button class="btn btn-primary" id="orderBtn" style="width: 60%; margin: auto; margin-top: 30px; margin-bottom: 20px;">결제하기</button>
					</div>
					
					



				</div>
			</div>



		</form>

	</div>









</body>
</html>