<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript">
$(document).ready(function(){

	let cartNo = $(".cartNo").val();
	let bookQty = $(".bookQty").val()
	let courseQty = $(".courseQty").val()
	
	if(bookQty > 999) {

		bookQty = $(".bookQty").val('999');	
		
	
		}
	if(bookQty < 0) {

		bookQty = $(".bookQty").val('1');	
		
	
		}
	if(courseQty > 1) {

		bookQty = $(".bookQty").val('1');	
		
	
		}
	if(courseQty < 0) {

		bookQty = $(".bookQty").val('1');	
		
	
		}
	
	

	if(cartNo == null){
		$(".cartNull").show();
		}



	
	
	  // 전체 선택 체크박스 클릭 이벤트
	  $('.all_check').click(function() {
	    // 전체 선택 체크박스의 상태에 따라 모든 개별 체크박스 선택/해제
	    $('.checkbox').prop('checked', $(this).prop('checked'));
	    /* 체크여부에따른 종합 정보 변화 */
	    setTotalInfo($(".cart_select"));
	  });

	  // 개별 체크박스 클릭 이벤트
	  $('.checkbox').click(function() {
	    // 개별 체크박스의 상태에 따라 전체 선택 체크박스 선택/해제
	    if ($('.checkbox:checked').length === $('.checkbox').length) {
	      $('.all_check').prop('checked', true);
	    } else {
	      $('.all_check').prop('checked', false);
	    }
	    /* 체크여부에따른 종합 정보 변화 */
	    setTotalInfo($(".product"));
	  });
	  
	  function setTotalInfo(cartInfo) {  
	//체크박스 전체 갯수
	  let totalCnt = $('.checkbox:checked').length;
	  $('#total_cnt_span').text(totalCnt);
	//  alert(totalCnt);

	  //체크박스 선택 총 금액 
	  let totalPrice = 0;
		$('.checkbox:checked').each(function() {
		  let cartNo = $(this).parents(".product").find(".cartNo").val();
		  let price = parseInt($(this).parents(".product").find(".price").text().replace(/[^0-9]/g, ''));

		 
				  
		  totalPrice += price;
		

		});

		//총 가격 
		$('#total_price_span').text(totalPrice);
	//  alert(totalPrice);
		

			



		
		
	  }
  // 페이지 로딩 시 모든 체크박스가 체크되어 있으면 종합 정보 출력
  if ($('.checkbox:checked').length === $('.checkbox').length) {
    setTotalInfo($(".product"));


  }

  

	  	
	  
  
	  
});// end of function

	
	$(function() {
	    $(".quantity-btn").click(function() {
// 	        const operation = $(this).data('operation');
	        const currentQuantity = $(this).parents(".btnDiv").parents(".input-group").parents(".quantity").find(".quantity-input").val();
	        const bookQty= $(this).parents(".btnDiv").parents(".input-group").parents(".quantity").find(".bookQty").val();
	        const courseQty= $(this).parents(".btnDiv").parents(".input-group").parents(".quantity").find(".courseQty").val();
	        let cartNo = $(this).parents(".btnDiv").parents(".input-group").parents(".quantity").find(".cartNos").val();
	        let newQuantity;
	        const piNo = $(this).parents(".btnDiv").parents(".input-group").parents(".quantity").find(".piNo").val();
	       

// 	        if (operation === 'increment' && currentQuantity < 999 && piNo == 1) {
// 	            newQuantity = parseInt(currentQuantity) + 1;
// 	        } else if (operation === 'decrement' && currentQuantity > 1 && piNo == 1) {
// 	            newQuantity = parseInt(currentQuantity) - 1;
// 	        } else if (operation === 'decrement' && currentQuantity == 1 && piNo == 1) {
// 	            alert("최소수량은 1개 입니다.");
// 	            return
	            
// 	        } else if (operation === 'increment' && currentQuantity == 999 && piNo == 1) {
// 	            alert("최대 수량은 999개 입니다.");
// 	            return
// 	        } else {
// 		        alert("강의는 수량을 변경할 수 없습니다.");
// 	            return;
// 	        }

	        $(this).parents(".btnDiv").parents(".input-group").parents(".quantity").find(".quantity-input").val(currentQuantity);
	   

	        $.ajax({
	            url: "/cart/update.do",
	            dataType : "json",
	            type: "POST",
	            data: {
	              cartNo: cartNo,
// 	              quantity: newQuantity
	              quantity: currentQuantity
	            },
	            
	            success: function(result) {
	              if (result === 1) {
		           
	                location.reload();
	              } else {
	                alert("Failed to update cart.");
	              }
	            }
// 	            error: function(xhr){
// 		            console.log(xhr);
// 		        }
	          });
	        });
$(".deleteBtn").click(function(){

	let cartNo = $(this).parents(".product").find(".cartNos").val();

	
	

	$.ajax({
		url : "/cart/delete.do",
		type : "post",
		dataType : "json",
		data : {"cartNo" : cartNo},
		success : function(result){
		      if (result === 10) {
		             location.reload();
	              } else {
	                alert("Failed to delete cart.");
	              }
		}
	});
	
});

$("#delAllBtn").click(function(){

	var delAll = confirm(" 정말 삭제 하시겠습니까? ")
	if(delAll){

		$.ajax({
			url : "/cart/deleteAll.do",
			type : "post",
			dataType : "json",
			success : function(result){
			      if (result != 0) {
			             location.reload();
		              } else {
		                alert("Failed to deleteAll cart.");
		              }
			}
		});
		


		}else{}
	
});



	 function showCancelDiv() {
			const checkAll = document.querySelector("input[name='selectAll']");
		    const checkBoxes = document.getElementsByName("cartNoList");
		    const selectedPnoList = [];

		    for (let i = 0; i < checkBoxes.length; i++) {
		      if (checkBoxes[i].checked) {
		        selectedPnoList.push(checkBoxes[i].value);
		      }
		    }

		    console.log(selectedPnoList); // 선택된 상품 번호 배열 출력
		    
	 }

	 $(".quantity-input").keydown(function(event){

		if(event.keyCode ==13 || event.which == 13){

			 return false;
			}
			
		 });
	 $(".quantity-input").keyup(function(event){

		 if (event.keyCode == 13 || event.which == 13) {
			    // 엔터 키를 눌렀을 때의 동작을 처리
			    // 이 코드는 input 요소의 값을 해당 input 요소에 입력하는 역할을 합니다.
			 $(this).blur();
			  }
			
		 });

	 $(".bookQty").on("blur", function() {
		  // 커서가 해당 input 요소 밖으로 이동되었을 때 실행되는 함수
		  let bookQty = $(this).val();
		  let voBookQty = $(this).parents(".input-group").find(".voBookQty").val();
		  if(bookQty > 999){
				alert("최대 수량은 999개 입니다.");
				alert(voBookQty);
				$(this).val(voBookQty);
			  }
		  if(bookQty <= 0){
			  alert("최소 수량은 1개 입니다.");
				$(this).val('1');
			  }

		  if(bookQty != voBookQty){

			  $(this).parents(".input-group").parents(".quantity").find(".bookQtyBtn").removeAttr("disabled");
			  }
		  
		});
	 

	 

	 $("#selectCart").click(function(){
		 let cartNo = $(".cartNo").val();
		 if(cartNo == null){

			 alert("장바구니에 상품이 없어 결제가 불가능 합니다.");
			return false;
			 }else{
				return;
			 }
		 

		 });

	 
	

        
});



</script>
<style type="text/css">

#head_line{

clear: both;
margin-top: 30px;
width: 100%;
}

.product{

clear: both;
border-bottom: 1px solid #aaa;
height: 80px;
font-size: 19px;

}

.all_option{
clear: both;
height: 50px;
margin-top: 50px;
border-bottom: 1px solid #999;
margin-bottom: 20px;

}

.cartNull{
display: none;
}
.checkbox{
width: 15px;
height: 15px;
margin-top: 30px;
}


</style>
</head>
<body>

<div class="Cart" style="width: 90%; margin: auto; margin-bottom: 100px;">
<div id="head_line">
<h3>장바구니</h3>
</div>
<form id="cartOrderForm" action="/cartOrder/cartOrder.do" method="get">
<div class="row">

<div class="col-md-9" style="position: relative;">

<div class ="all_option row">
<div class="all_check_input_div col-md-6">
	<input type="checkbox" class="all_check" checked="checked" />
	<span class="all_check_span">전체선택</span>
</div>
<div id="delAllBtnDiv" class="col-md-6" style ="text-align: right">
	<button class="btn btn-light" id="delAllBtn">전체 삭제</button>
</div>
</div>
				
		

		<c:forEach items="${list }" var="vo">
<c:choose>
	<c:when test="${vo.piNo eq 1 }">
	<div class="product row" style =";">
		<div class="col-md-1 cart_select" style="float: left;text-align: center;">
		<input type="checkbox" name ="cartNoList" type="checkbox" checked="checked" value="${vo.cartNo }" readonly
				class="checkbox cartNo"></div>
		<div class="col-md-1" style="float: left; margin-top: 26px;text-align: center;">
		<div style="border: 1px solid #eee;border-radius: 3px; width: 70%; background: skyblue; color: white;">
		<span>교재</span>
		</div>
		</div>
		
		<div class="col-md-1" style="float: left; margin-top: 10px;text-align: center;">
		<img style="width:60px; height:60px" src="${vo.image }">
		</div>
	
		
		<div class="col-md-4" style="float: left; margin-top: 26px; padding-left: 60px;">
		${vo.bookName }
		</div>
		
		<div class="col-md-2 quantity" style="float: left; margin-top: 23px;text-align: center;">
			<div class="input-group">
			
<!-- 				<div class="input-group-prepend btnDiv"> -->
<!-- 					<button class="btn btn-outline-primary quantity-btn" type="button" data-operation="decrement">-</button> -->
<!-- 				</div> -->

					<input class="form-control quantity-input bookQty" type="number" value=${vo.quantity } min="1" max="999">
					<input class="voBookQty" type ="hidden" value="${vo.quantity }">
  
<!--   				<div class="input-group-append btnDiv"> -->
<!-- 					<button class="btn btn-outline-primary quantity-btn" type="button" data-operation="increment">+</button> -->
<!-- 				</div> -->
  				<div class="input-group-append btnDiv">
					<button class="btn btn-outline-primary quantity-btn bookQtyBtn" type="button" disabled="disabled">변경</button>
				</div>
			
			</div>
		
		<input class="cartNos" type ="hidden" value="${vo.cartNo }">
		<input class="piNo" type ="hidden" value="${vo.piNo }">
		<input class="voBookQty" type ="hidden" value="${vo.quantity }">
		</div>
		
		<div class="col-md-2 price" style="float: left;  margin-top: 26px;text-align: center;">
		
		${vo.price * vo.quantity } <span>원</span>
		
		</div>
		<div class="col-md-1 delBtnDiv" style="float: left; margin-top: 18px;text-align: center;">
		<button class="btn btn-ligth deleteBtn" type="button">x</button></div>
	</div>
		
	</c:when>
	<c:otherwise>
	<div class="product row">
		<div class="col-md-1 cart_select" style="float: left;text-align: center;">
		<input type="checkbox" name ="cartNoList" type="checkbox" checked="checked" value="${vo.cartNo }" readonly
				class="checkbox cartNo"></div>
	
		<div class="col-md-1" style="float: left; margin-top: 26px;text-align: center;">
		<div style="border: 1px solid #eee;border-radius: 3px; width: 70%; background: pink; color: white;">
		<span>강의</span>
		</div>
		</div>
	
	<div class="col-md-1" style="float: left; margin-top: 10px;text-align: center;">
		<img style="width:60px; height:60px" src="${vo.image }">
		</div>
	
		
		<div class="col-md-4" style="float: left; margin-top: 26px; padding-left: 60px;">
		${vo.title }
		</div>
		
		<div class="col-md-2 quantity" style="float: left; margin-top: 23px;text-align: center;">
			<div class="input-group">
<!-- 				<div class="input-group-prepend btnDiv"> -->
<!-- 					<button class="btn btn-outline-primary quantity-btn" type="button" data-operation="decrement">-</button> -->
<!-- 				</div> -->

					<input class="form-control quantity-input courseQty" type="number" readonly="readonly" value=1 min="1" max="1" style="background-color: white;">
  					
<!--   				<div class="input-group-append btnDiv"> -->
<!-- 					<button class="btn btn-outline-primary quantity-btn" type="button" data-operation="increment">+</button> -->
<!-- 				</div> -->
  
  				<div class="input-group-append btnDiv">
					<button class="btn btn-outline-primary quantity-btn" type="button" disabled="disabled">변경</button>
				</div>
		</div>
		<input class="cartNos" type ="hidden" value="${vo.cartNo }">
		<input class="piNo" type ="hidden" value="${vo.piNo }">
		

		</div>
		
		<div class="col-md-2 price" style="float: left;  margin-top: 26px;text-align: center;">
		
		${vo.price * vo.quantity } <span>원</span>
		
		</div>
		<div class="col-md-1 delBtnDiv" style="float: left; margin-top: 18px;text-align: center;">
			<button class="btn btn-ligth deleteBtn" type="button">x</button>
		</div>
	</div>
	</c:otherwise>
</c:choose>
	
		
		</c:forEach>
		<div class="cartNull" style="clear:both ;margin-top: 40px; text-align: center; border-bottom: 1px solid #999; margin-bottom: 35px;">
		<h4 style="color: #aaa;margin-bottom: 35px;">장바구니가 비어 있습니다.</h4>
		</div>
		
		
		
</div>		
	

	<div class="col-md-2" style="position: fixed; top: 18%; left: 75%; height: 200px; margin-left: 20px;">
		<div class="total_wrap row" style="margin-top: 6px; background: white; border-radius: 5px; border: 2px solid #aaa;  background: skyblue;">
		<div class="col-md-6" style="margin-top: 30px; background: #eee;">
		<label>총 주문 상품수 :</label>
		</div>
		<div class="col-md-6" style="text-align: right; margin-top: 30px; background: #eee;">
		<span id="total_cnt_span"></span>
		<span>개</span> 
		</div>
		<div class="col-md-6" style="margin-top: 20px; background: #eee;height: 30px;">
		<label><strong>총 주문 가격 :</strong></label>
		</div>
		<div class="col-md-6"style="text-align: right; margin-top: 20px; background: #eee; height: 30px;">
		<strong id="total_price_span"></strong> 원
		</div>				
		
		<div class="col-md-12" style="margin-top: 20px; text-align: center; margin-bottom: 20px;">
            <button class="btn btn-primary btn-lg" id="selectCart" class="selectCart">선택한 상품 주문하기</button>
	        </div>
		</div>
	</div>	
	     
	        
	       </div> 
</form>		


		</div>	
</body>
</html>