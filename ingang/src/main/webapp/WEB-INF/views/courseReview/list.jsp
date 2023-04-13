<%@page import="com.ingang.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 리뷰 리스트</title>

<link rel="stylesheet" href="/css/review.css">
<style type="text/css">
.review-list-el{
	display: flex;
	flex-direction: column;
}
.review-el-header{
	text-align: center;
}
.review-el-userinfo{
	display: flex;
	flex-direction: column;
}
.review-el-starcover{
	display: inline-block;
	vertical-align: middle;
}
.infd-icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    transition: background-color .15s ease;
}
.review-el-header {
    margin-bottom: 12px;
    display: flex;
    align-items: center;
}
.review-list-filter {
    display: flex;
    overflow-x: auto;
    align-items: center;
    padding: 0 16px 10px;
    border-bottom: 1px solid #495057;
    white-space: nowrap;
}
.review-list-el+.review-list-el {
    border-top: 1px solid #f1f3f5;
}
.decimal-star__el{
	float: left;
}
.review-el-tools{
	display: flex;
}
.review-tool-right{
	margin-left: auto;
}
@media screen and (max-width: 768px){
	.review-filter__cover--PC {
	    display: none;
	}
}
@media screen and (max-width: 768px){
	.review-filter__cover--MB {
	    display: inline-flex;
	}
}
.review-filter__cover--PC {
    display: inline-flex;
}
.review-filter__cover--MB {
    display: none;
}
.starScore:hover{
	cursor: pointer;
}
.review-el__header--right{
	margin-left: auto;
}
.e-open-editable-modal:hover{
	cursor: pointer;
}
.open-editable-modal-cover .editable-modal-PC {
    position: absolute;
    top: calc(100% + 20px);
    right: 0;
    display: inline-flex;
    flex-direction: column;
    width: 82px;
    border: 1px solid #dee2e6;
    box-shadow: 0 3px 8px 0 rgba(222,226,230,.05);
    background-color: #fff;
}
.open-editable-modal-cover {
    position: relative;
}

.editable-modal-PC__button:hover{
	cursor: pointer;
}
.editable-modal-PC__button{
	padding: 10px 10px;
}
.hide{
	display:none;
}
.e-filter-el:hover{
	cursor: pointer;
}
.e-filter-el{
	color :#adb5bd;
}
.review-more{
	cursor: pointer;
	text-align: center;
}
</style>

<script type="text/javascript" src="/js/courseReview.js"></script>
<script type="text/javascript">

$(function(){

	// 필요한 변수 선언
	var page = 1; // 표시할 페이지
	var no = 2; // 강의 번호
	var listDiv = $(".review-list-content"); // 수강평 리스트 표시할 div
	var score = 5; // 별점
	var content = null; // 수강평 내용
// 	var id = 'test'; // 아이디
	var id = '<%= session.getAttribute("login") != null ? ((MemberVO)session.getAttribute("login")).getId() : "" %>';
	var pno = null; // 강의 결제 상세 번호
	var sort = null; // 정렬변경
	var startRow = 1; // 현재 페이지 시작 
	var endRow = 10; // 현재 페이지 끝
	var totalCount = 0; // 총 리뷰 개수
	// 페이지 로딩시 최초 리스트 표시
	showList(page);
	console.log("id : "+id);

	// ----------------------------- 리스트 불러오는 함수 -----------------------------
	function showList(page){

		// review.list(param, callback, error) - /js/courseReview.js
		review.list(
			{no:no, page:page, sort:sort, startRow:startRow, endRow:endRow}, // 넘겨주는 데이터 no-글번호, page-수강평리스트페이지
			function(data){
				// 결과 데이터 - 리스트, 페이지처리, 총 데이터개수, 내가쓴 글개수, 내가 좋아요한 리뷰번호
				var list = data.list; // 리뷰 리스트
				var pageObject = data.pageObject; // 페이지처리
				var count = data.count; // 
				totalCount = data.totalCount; // 총 데이터 개수
				var myLike = data.myLike; // 내가 좋아요한 리뷰 번호

				// 총 리뷰개수가 10개 이하이면 더보기 숨기기
				if(totalCount < 11){
					$(".review-more").addClass("hide");
				};

				
				if(pageObject.endRow === 10){ // 첫번째 페이지이면 리스트 초기화후 1~10번 표시
					var str = "";
				} else{ // 첫번째 페이지 아니면 원래 리스트에서 추가로 가져온 데이터 표시
					str = listDiv.html();
				}

				// 리스트 데이터 없으면 표시할 내용
				if(list == null || list.length == 0){
					listDiv.html("데이터가 존재하지 않습니다.")
					return;
				} // end of if

				// 리스트 데이터 있으면 있는 만큼 표시
				for(var i=0; i<list.length; i++){
					// 좋아요 확인하는 변수
					var isActive = false;
					
					console.log(list[i]);

					str += "<div class='review-list-el' data-id='"+list[i].pno+"' data-rno='"+list[i].rno+"'>";
					str += "<div class='review-el-header'>";
					str += "<div class='review-el-userinfo'>";
					str += "<div class='review-el-starcover'>";
					str += "<span class='review-el-star'>";
					str += "<div class='decimal-star' style='width: 80px;'>";
					// 비어있는 별 표시
					str += "<div class='decimal-star__empty-cover'>";
					str += '<span class="infd-icon decimal-star__el " data-id="1" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					str += '<span class="infd-icon decimal-star__el " data-id="2" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					str += '<span class="infd-icon decimal-star__el " data-id="3" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					str += '<span class="infd-icon decimal-star__el " data-id="4" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					str += '<span class="infd-icon decimal-star__el " data-id="5" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					str += '</div>';
					// 노란색 별 표시
					str += '<div class="decimal-star__fill-cover" style="width:80px;">';
					str += '<span class="infd-icon decimal-star__el " data-id="1" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					if(list[i].score>=2)
					str += '<span class="infd-icon decimal-star__el " data-id="2" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					if(list[i].score>=3)
					str += '<span class="infd-icon decimal-star__el " data-id="3" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					if(list[i].score>=4)
					str += '<span class="infd-icon decimal-star__el " data-id="4" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					if(list[i].score>=5)
					str += '<span class="infd-icon decimal-star__el " data-id="5" style="width:16px;height:16px;"><svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg></span>';
					str += '</div>';
					str += '</div>';
					str += '</span>';
					str += '<span class="review-el-starnum">'+list[i].score+'</span>';
					str += '</div>';
					str += '<div class="review-el-name">'+list[i].name+'</div>';
					str += '</div>';
					
					// 로그인한 아이디와 같은 글은 수정/삭제 버튼 표시
					if(list[i].id == id){
						str += '<div class="review-el__header--right open-editable-modal-cover">';
						str += '<div class="editable-modal-PC" style="display:none;">';
						str += '<div class="editable-modal-PC__button e-edit-review e-edit">';
						str += '<span class="infd-icon"><svg width="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 15"><path fill="#495057" fill-rule="evenodd" d="M11.606 8.738l.555-.547c.106-.104.283-.03.283.115v4.493c0 .724-.597 1.312-1.333 1.312H1.333C.597 14.111 0 13.523 0 12.8V3.174C0 2.449.597 1.86 1.333 1.86h8.12c.147 0 .222.178.116.279l-.555.547c-.03.03-.075.05-.117.05H1.333c-.244 0-.444.196-.444.437v9.625c0 .24.2.437.444.437h9.778c.245 0 .445-.197.445-.437V8.853c0-.044.016-.085.05-.115zm4.052-5.228l-8.68 8.545-2.775.303c-.372.041-.686-.268-.645-.634l.309-2.732 8.68-8.545c.456-.448 1.195-.448 1.65 0l1.461 1.439c.456.448.456 1.176 0 1.624zm-2.6 1.323L11.206 3.01l-6.49 6.384-.23 2.054 2.086-.227 6.486-6.388zm1.973-2.33l-1.462-1.438c-.105-.103-.283-.109-.391 0L11.833 2.39l1.853 1.824 1.345-1.324c.108-.104.108-.279 0-.385z"></path></svg></span>';
						str += '수정';
						str += '</div>';
						str += '<div class="editable-modal-PC__button e-delete-review e-delete">';
						str += '<span class="infd-icon"><svg width="16" aria-hidden="true" focusable="false" data-prefix="fal" data-icon="trash-alt" class="svg-inline--fa fa-trash-alt fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="#495057" d="M296 432h16a8 8 0 0 0 8-8V152a8 8 0 0 0-8-8h-16a8 8 0 0 0-8 8v272a8 8 0 0 0 8 8zm-160 0h16a8 8 0 0 0 8-8V152a8 8 0 0 0-8-8h-16a8 8 0 0 0-8 8v272a8 8 0 0 0 8 8zM440 64H336l-33.6-44.8A48 48 0 0 0 264 0h-80a48 48 0 0 0-38.4 19.2L112 64H8a8 8 0 0 0-8 8v16a8 8 0 0 0 8 8h24v368a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V96h24a8 8 0 0 0 8-8V72a8 8 0 0 0-8-8zM171.2 38.4A16.1 16.1 0 0 1 184 32h80a16.1 16.1 0 0 1 12.8 6.4L296 64H152zM384 464a16 16 0 0 1-16 16H80a16 16 0 0 1-16-16V96h320zm-168-32h16a8 8 0 0 0 8-8V152a8 8 0 0 0-8-8h-16a8 8 0 0 0-8 8v272a8 8 0 0 0 8 8z"></path></svg></span>';
						str += '삭제';
						str += '</div>';
						str += '</div>';
						str += '<span class="infd-icon open-editable-modal-PC-icon e-open-editable-modal" data-type="pc" data-target="review">';
						str += '<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#495057" d="M8 6.667c-.737 0-1.333.595-1.333 1.333 0 .737.596 1.333 1.333 1.333.738 0 1.333-.596 1.333-1.333 0-.738-.595-1.333-1.333-1.333zM9.333 3c0 .737-.595 1.333-1.333 1.333-.737 0-1.333-.596-1.333-1.333 0-.738.596-1.333 1.333-1.333.738 0 1.333.595 1.333 1.333zm0 10c0 .738-.595 1.333-1.333 1.333-.737 0-1.333-.595-1.333-1.333S7.263 11.667 8 11.667c.738 0 1.333.595 1.333 1.333z"></path></svg>';
						str += '</span>';
// 						str += '<span class="infd-icon open-editable-modal-MB-icon e-open-editable-modal" data-type="mb" data-target="review"><svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#495057" d="M8 6.667c-.737 0-1.333.595-1.333 1.333 0 .737.596 1.333 1.333 1.333.738 0 1.333-.596 1.333-1.333 0-.738-.595-1.333-1.333-1.333zM9.333 3c0 .737-.595 1.333-1.333 1.333-.737 0-1.333-.596-1.333-1.333 0-.738.596-1.333 1.333-1.333.738 0 1.333.595 1.333 1.333zm0 10c0 .738-.595 1.333-1.333 1.333-.737 0-1.333-.595-1.333-1.333S7.263 11.667 8 11.667c.738 0 1.333.595 1.333 1.333z"></path></svg></span>';
						str += '</div>';
					}
					
					str += '</div>';
					str += '<div class="review-el-body">'+list[i].content+'</div>';
					str += '<div class="review-el-tools">';
					str += '<div class="review-tool-left"><span class="review-el-tool">'

					date = new Date(list[i].writeDate);
					str += date.getFullYear() + "-" + (date.getMonth() + 1 < 10 ? '0' : '') + (date.getMonth() + 1) + "-" + (date.getDate() < 10 ? '0' : '') + date.getDate();
					
					str += '</span></div>';
					str += '<div class="review-tool-right">';

						// 좋아요 버튼 활성화 / 비활성화
						if(myLike.length === 0 || myLike === 'null'){ // 내가 좋아요 누른 글이 없으면 전부 비활성화
						    str += '<span class="ac-like-button e-like ">';
						} else { // 좋아요 누른 글이 있으면
						    let found = false;
						    
						    for(j=0; j<myLike.length; j++){ // 좋아요 누른 글번호 반복
						        if(myLike[j].rno === list[i].rno){ // 좋아요 누른글번호와 같은 글번호면 좋아요 버튼 빨간색
						            str += '<span class="ac-like-button e-like ac-like-button--active">';
									// found true - 내가 좋아요 누른 글임
						            found = true;
						            break;
						        } // end of if
						    } // end of for
						    
						    if(!found){ // 내가 좋아요 누른글 아니면 버튼 회색
						        str += '<span class="ac-like-button e-like ">';
						    } // end of if
						} // end of if else

							
					str += '<span class="infd-icon ac-like-button__icon--visible"><svg width="16" xmlns="http://www.w3.org/2000/svg" height="16" viewBox="0 0 16 16"><path fill="#e5503c" d="M9.333 13.605c-.328.205-.602.365-.795.473-.102.057-.205.113-.308.168h-.002c-.143.074-.313.074-.456 0-.105-.054-.208-.11-.31-.168-.193-.108-.467-.268-.795-.473-.655-.41-1.53-1.007-2.408-1.754C2.534 10.382.667 8.22.667 5.676c0-2.308 1.886-4.01 3.824-4.01 1.529 0 2.763.818 3.509 2.07.746-1.252 1.98-2.07 3.509-2.07 1.938 0 3.824 1.702 3.824 4.01 0 2.545-1.867 4.706-3.592 6.175-.878.747-1.753 1.344-2.408 1.754z"></path></svg></span>';
					str += '<span class="infd-icon"><svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#adb5bd" fill-rule="evenodd" clip-rule="evenodd" d="M4.49095 2.66666C3.10493 2.66666 1.66663 3.92028 1.66663 5.67567C1.66663 7.74725 3.21569 9.64919 4.90742 11.0894C5.73796 11.7965 6.571 12.3653 7.19759 12.7576C7.51037 12.9534 7.7704 13.1045 7.95123 13.2061C7.96818 13.2156 7.98443 13.2247 7.99996 13.2333C8.01549 13.2247 8.03174 13.2156 8.04869 13.2061C8.22952 13.1045 8.48955 12.9534 8.80233 12.7576C9.42892 12.3653 10.262 11.7965 11.0925 11.0894C12.7842 9.64919 14.3333 7.74725 14.3333 5.67567C14.3333 3.92028 12.895 2.66666 11.509 2.66666C10.1054 2.66666 8.9751 3.59266 8.4743 5.09505C8.40624 5.29922 8.21518 5.43693 7.99996 5.43693C7.78474 5.43693 7.59368 5.29922 7.52562 5.09505C7.02482 3.59266 5.89453 2.66666 4.49095 2.66666ZM7.99996 13.8018L8.22836 14.2466C8.08499 14.3202 7.91493 14.3202 7.77156 14.2466L7.99996 13.8018ZM0.666626 5.67567C0.666626 3.368 2.55265 1.66666 4.49095 1.66666C6.01983 1.66666 7.25381 2.48414 7.99996 3.73655C8.74611 2.48414 9.98009 1.66666 11.509 1.66666C13.4473 1.66666 15.3333 3.368 15.3333 5.67567C15.3333 8.22121 13.4657 10.3823 11.7407 11.8509C10.863 12.5982 9.98767 13.1953 9.33301 13.6052C9.00516 13.8104 8.73133 13.9696 8.53847 14.0779C8.44201 14.1321 8.36571 14.1737 8.31292 14.2019C8.28653 14.2161 8.26601 14.2269 8.25177 14.2344L8.2352 14.2431L8.23054 14.2455L8.22914 14.2462C8.22897 14.2463 8.22836 14.2466 7.99996 13.8018C7.77156 14.2466 7.77173 14.2467 7.77156 14.2466L7.76938 14.2455L7.76472 14.2431L7.74815 14.2344C7.73391 14.2269 7.71339 14.2161 7.687 14.2019C7.63421 14.1737 7.55791 14.1321 7.46145 14.0779C7.26858 13.9696 6.99476 13.8104 6.66691 13.6052C6.01225 13.1953 5.13695 12.5982 4.25917 11.8509C2.53423 10.3823 0.666626 8.22121 0.666626 5.67567Z"></path></svg></span>';
					str += '<span class="ac-like-button__count">'+list[i].likecnt+'</span>';
					str += '</span>';
					str += '</div>';
					str += '</div>';
					str += '</div>';
					
				} // end of for

				// 리스트 div에 데이터 표시
				listDiv.html(str);

				// 총 개수 표시
				$(".review-title").html('총 '+totalCount+'개');

				// 로그인 안되어 있으면 입력 폼 안보이게 하기
				// 내가 쓴 글이 있으면 입력 폼 안보이게 하기
				if (id === '' || count === 1) {
// 				  $("#review-add-Form").addClass("hide").hide();
				  $("#review-add-Form").css("display", "none");
				  
				} else {
// 				  $("#review-add-Form").removeClass("hide").show();
				  $("#review-add-Form").css("display", "block");
				} 
				
				
			} // end of function(data)

		) // end of review.list()

	}; // end of showList(page)
	// ----------------------------- 리스트 불러오기 끝 -----------------------------


	// ------------------------ 등록 폼 별점 변경 -----------------------------
	// 별 span태그 선택 - 등록 폼
	const emptyCovers = document.querySelectorAll('.write-empty-Star span');
	const fillCovers = document.querySelectorAll('.write-fill-Star span');

	// 별 클릭시 클릭한 만큼 표시(노란별)
	fillCovers.forEach((fillCover) => {
	  fillCover.addEventListener('click', () => {
	    const id = fillCover.getAttribute('data-id');
	    score = id;
	    const width = id * 30;
	    document.getElementById('title-fill-cover').style.width = width+ 'px';
	  });
	});

	// 별 클릭시 클릭한 만큼 표시(회색별)
	emptyCovers.forEach((emptyCover) => {
	  emptyCover.addEventListener('click', () => {
	    const id = emptyCover.getAttribute('data-id');
	    score = id;
	    const width = id * 30;
	    document.getElementById('title-fill-cover').style.width = width+ 'px';
	  });
	});
	// --------------------------- 별점 변경 끝 ----------------------------

	
	// -------------------------- 수정 modal 별점 변경 ---------------------------
	// 별 span태그 선택 - 수정 modal
	const modalEmptyCovers = document.querySelectorAll('.update-empty-Star span');
	const modalFillCovers = document.querySelectorAll('.update-fill-Star span');

	// 별 클릭시 클릭한 만큼 표시(노란별) - 수정 modal
	modalFillCovers.forEach((fillCover) => {
	  fillCover.addEventListener('click', () => {
	    const id = fillCover.getAttribute('data-id');
	    score = id;
	    const width = id * 30;
	    document.getElementById('update-title-fill-cover').style.width = width+ 'px';
	    $("#modal-star-num").text(score);
	  });
	});

	// 별 클릭시 클릭한 만큼 표시(회색별) - 수정 modal
	modalEmptyCovers.forEach((emptyCover) => {
	  emptyCover.addEventListener('click', () => {
	    const id = emptyCover.getAttribute('data-id');
	    score = id;
	    const width = id * 30;
	    document.getElementById('update-title-fill-cover').style.width = width+ 'px';
	    $("#modal-star-num").text(score);
	  });
	});
	// -------------------------- 수정 modal 별점 변경 끝 ---------------------------

	
	// ----------------------------- 리뷰등록 버튼 클릭 -------------------------
	$("#review-submit-Btn").click(function(){
		// 작성한 리뷰 내용 가져오기
		content = $("#review-content").val();
		// 넘겨줄 데이터 - 내용, 강의번호, 별점
		var param = {
			content: content,
			no: no,
			score: score
		};

		// 리뷰 등록 실행
		review.write(
			param, 
			function(result){
				// 페이지 리로드
				startRow=1;
				endRow=10;
				$(".review-more").removeClass("hide");
				showList(page);
				console.log(result);
				// 리뷰 div에 내용 삭제
				$("#review-content").val('');
				// 별점 초기화
				document.getElementById('title-fill-cover').style.removeProperty('width');
				score=5;
			}
		);
		
	});
	// ----------------------------- 리뷰등록 버튼 클릭 끝  -------------------------

	
	// ----------------------------- 삭제 버튼 클릭  -----------------------------
	$(document).on("click", ".e-delete-review",function(){
		console.log("삭제버튼 클릭");
		// 삭제버튼 클릭한 행의 pno 가져오기
		pno = $(this).closest(".review-list-el").data("id");
		console.log(pno);
		// 리뷰 삭제 실행
		review.deleteFn(
			pno,
			function(result){
				// 1페이지 리로드
				page=1;
				startRow=1;
				endRow=10;
				$(".review-more").removeClass("hide");
				
				showList(page);

				alert("삭제되었습니다.");
			}
		);
	});
	// ----------------------------- 삭제 버튼 클릭  끝 -----------------------------

	
	// ----------------------------- 수정 버튼 클릭 - div 열기 -----------------------------
	$(document).on("click", ".e-edit-review", function(){
		// 수정버튼 클릭한 행의 별점 가져오기
		score = $(this).closest(".review-el-header").find(".review-el-starnum").text();
		console.log(score);
		// 수정버튼 클릭한 행의 내용 가져오기
		content = $(this).closest(".review-list-el").find(".review-el-body").text();
		console.log(content);

		// pno modal에 넣기 
		pno = $(this).closest(".review-list-el").data("id");
		$("#modal-pno").text(pno);
		
		// 별점 modal에 넣기
		width = score * 30;
		document.getElementById('update-title-fill-cover').style.width = width+ 'px';
		$("#modal-star-num").text(score);
		
		// 내용 modal에 넣기
		$("#modal-review-content").val(content);
		
		// 수정 modal 열기
		$("#reviewModal").modal("show");
	})
	// ----------------------------- 수정 버튼 클릭 - div열기 끝 -----------------------------

	// ----------------------------- 수정버튼 클릭 - 수정 처리 --------------------------------
	$("#modalUpdateBtn").click(function(){
		// 필요한 데이터 수집 - pno, content, score
		pno = $("#modal-pno").text();
		content = $("#modal-review-content").val();
		score = $("#modal-star-num").text();

		// 수정 실행
		review.update(
			{pno:pno, content:content, score:score},
			function(result){
				// 수정 후 리스트 다시 표시
				startRow=1;
				endRow=10;
				$(".review-more").removeClass("hide");
				
				showList(page);

				$("#reviewModal").modal("hide");

				alert("수정이 완료되었습니다.");

			}

		)
		
	});
	
	// ----------------------------- 수정버튼 클릭 - 수정 처리 끝 --------------------------------

	// ----------------------------- 정렬변경 ---------------------------------------
	
	$(".e-filter-el").click(function(){
		// 클릭한 정렬버튼 가져오기
		sort = $(this).data("type");
		console.log(sort);

		$(".e-filter-el").css("color", "#adb5bd");
		$(this).css("color", "#495057");
		
		// 리스트 다시 불러오기
		startRow=1;
		endRow=10;
		$(".review-more").removeClass("hide");
		
		showList(page);
		
	});
	
	// ----------------------------- 정렬변경 끝 ---------------------------------------

	// ------------------------------ 더보기 버튼 클릭 (다음 데이터 가져오기)----------------------------------
	
	$(".review-more").click(function(){
		console.log("처음 : "+startRow+"/"+endRow);

		console.log("totalCount : "+totalCount);

		startRow = endRow + 1;
		endRow = startRow + 10;
		
		if(endRow > totalCount){
			endRow = totalCount;
			$(".review-more").addClass("hide");
		}
		console.log("나중 : "+startRow+"/"+endRow);
		
		showList(page+1);
		
	});
	// ------------------------------ 더보기 버튼 클릭 끝 ----------------------------------

	// ----------------------------- 좋아요 버튼 클릭 ----------------------------------
	$(document).on("click", ".ac-like-button",function(){
		console.log("좋아요 클릭");

		if(id == null || id == '') {
			alert("로그인 후 이용 가능합니다.");
			return;
		}
		// 클릭한 리뷰번호 가져오기
		rno = $(this).closest(".review-list-el").data("rno");
		console.log("rno : "+rno);

		var self = $(this);
		var num = $(this).find(".ac-like-button__count");

		console.log("현재 좋아요 개수 : "+num.text());
		
		if($(this).hasClass("ac-like-button--active")){ // 좋아요 취소
			console.log("좋아요 취소 실행");

			// 좋아요 취소 실행
			review.cancelLike(
				rno,
				function(){
					self.removeClass("ac-like-button--active");
					num.text(parseInt(num.text())-1);
					console.log("좋아요 취소");
				}
			)
			
		} else { // 좋아요 하기
			console.log("좋아요 실행");
			
			// 좋아요 실행
			review.like(
				{rno:rno},
				function(){
					self.addClass("ac-like-button--active");
					num.text(parseInt(num.text())+1);
					console.log("좋아요 완료");
				}
			)

		} // end of if else

	});
	// ----------------------------- 좋아요 버튼 클릭 끝 ----------------------------------
	
});

$(document).ready(function() {
	// ... 클릭시 수정/삭제 버튼 토글
	$(document).on('click', '.e-open-editable-modal', function() {
	  $(this).parent().find(".editable-modal-PC").toggle();
	});

	// 수정/삭제 외 다른곳 클릭시 다시 숨김
	$(document).on('click', function(event) {
	  var $target = $(event.target);
	  if (!$target.closest('.editable-modal-PC, .e-open-editable-modal').length) {
	    $('.editable-modal-PC').hide();
	  }
	});

});



</script>
</head>
<body>

	<section class="layout_padding pg___course-description-section">
		<div class="container">
		
			<div id="listDiv">
				<section>
					<div class="review-header">
						<div>
							<span>수강평</span>
							<span class="review-title"></span>
						</div>
					</div>
					<div class="review-description">
						<div></div>
					</div>
					<div class="review-dashboard">
						<div></div>
						<div></div>
					</div>
					<div class="review-add" id="review-add-Form" style="display: none;">
						<div class="review-add-top">
								<div class="review-add-star">
	          
							    <div class="decimal-star decimal-star--selectable" style="width: 150px;">
							      <div class="decimal-star__empty-cover write-empty-Star">
							        <span class="starScore infd-icon decimal-star__el e-select-star" data-id="1" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="2" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="3" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="4" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="5" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span>
							      </div>
							      <div class="decimal-star__fill-cover write-fill-Star" id="title-fill-cover">
							        <span class="starScore infd-icon decimal-star__el e-select-star" data-id="1" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="2" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="3" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="4" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="5" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span>
							      </div>
							    </div>
					        </div>
						</div>
						<div class="review-add-bottom">
							<div><textarea rows="" cols="" style="resize: none;" id="review-content"></textarea></div>
							<div><button id="review-submit-Btn">등록</button></div>
						</div>
					</div>
					<div class="review-list">
						<div class="review-list-filter">
							<span class="review-filter__el e-filter-el" data-type="recommended">
						      <span class="infd-icon"><svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z"></path></svg></span>좋아요 순
						    </span>
						    <span class="review-filter__el e-filter-el" data-type="id">
						      <span class="infd-icon"><svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z"></path></svg></span>최신 순
						    </span>
						    <span class="review-filter__cover--PC">
						      <span class="review-filter__el e-filter-el" data-type="high">
						        <span class="infd-icon"><svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z"></path></svg></span>높은 평점 순
						      </span>
						      <span class="review-filter__el e-filter-el" data-type="low">
						        <span class="infd-icon"><svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z"></path></svg></span>낮은 평점 순
						      </span>
						    </span>
							  <span class="review-filter__cover--MB">
							      <span class="review-filter__el e-filter-el-MB review-filter__el--active" data-type="normal">
							        <span class="infd-icon"><svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#212529" d="M8 10c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z"></path></svg></span>평점 순
							      </span>
							      <span class="review-filter__el e-filter-el-MB" data-type="high">
							        <span class="infd-icon"><svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#212529" fill-rule="evenodd" clip-rule="evenodd" d="M3.39645 6.93688C3.20118 6.74162 3.20118 6.42503 3.39645 6.22977L7.56311 2.06311C7.75838 1.86784 8.07496 1.86784 8.27022 2.06311L12.4369 6.22977C12.6321 6.42503 12.6321 6.74162 12.4369 6.93688C12.2416 7.13214 11.925 7.13214 11.7298 6.93688L8.41667 3.62377L8.41667 13.25C8.41667 13.5261 8.19281 13.75 7.91667 13.75C7.64052 13.75 7.41667 13.5261 7.41667 13.25L7.41667 3.62377L4.10355 6.93688C3.90829 7.13214 3.59171 7.13214 3.39645 6.93688Z"></path></svg></span>높은 평점 순
							      </span>
							      <span class="review-filter__el e-filter-el-MB" data-type="low">
							        <span class="infd-icon"><svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg"><path fill="#212529" fill-rule="evenodd" clip-rule="evenodd" d="M3.39645 9.06312C3.20118 9.25838 3.20118 9.57497 3.39645 9.77023L7.56311 13.9369C7.75837 14.1322 8.07496 14.1322 8.27022 13.9369L12.4369 9.77023C12.6321 9.57497 12.6321 9.25838 12.4369 9.06312C12.2416 8.86786 11.925 8.86786 11.7298 9.06312L8.41667 12.3762L8.41667 2.75001C8.41667 2.47387 8.19281 2.25001 7.91667 2.25001C7.64052 2.25001 7.41667 2.47387 7.41667 2.75001L7.41667 12.3762L4.10355 9.06312C3.90829 8.86786 3.59171 8.86786 3.39645 9.06312Z"></path></svg></span>낮은 평점 순
							      </span>
							    </span>
						</div>
						<!-- 리뷰 내용 적힐 div -->
						<div class="review-list-content">


						</div>
					</div>
					<div class="review-more">더보기</div>
				</section>
			</div>
		
			<!-- 모달 div -->
			<div class="modal" id="reviewModal">
				<div class="modal-dialog">
					<div class="modal-content">
		
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title" id="replyModalTitle">수강평 수정</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
		
						<!-- Modal body -->
						<div class="modal-body">
							<div class="form-group" id="updateStar">
						    
						    <div class="decimal-star decimal-star--selectable" style="width: 150px;">
							      <div class="decimal-star__empty-cover update-empty-Star">
							        <span class="starScore infd-icon decimal-star__el e-select-star" data-id="1" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="2" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="3" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="4" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="5" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#dee2e6" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span>
							      </div>
							      <div class="decimal-star__fill-cover update-fill-Star" id="update-title-fill-cover">
							        <span class="starScore infd-icon decimal-star__el e-select-star" data-id="1" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="2" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="3" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="4" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span><span class="starScore infd-icon decimal-star__el e-select-star" data-id="5" style="width:30px;height:30px;">
							    <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path fill="#ffc807" fill-rule="evenodd" d="M8 1.3c.133 0 .263.037.375.108.113.07.203.17.262.29l1.778 3.637 3.978.583c.131.02.254.075.355.161.101.086.176.199.217.326.041.126.046.262.014.392-.031.13-.098.247-.193.34l-2.878 2.831.68 3.996c.022.131.007.267-.042.39-.05.124-.133.23-.24.31-.107.078-.234.125-.366.134-.132.01-.263-.018-.38-.08L8 12.831l-3.558 1.887c-.117.062-.248.09-.38.08-.132-.01-.259-.056-.365-.134-.107-.079-.19-.186-.24-.31-.05-.123-.065-.258-.043-.39l.68-3.997-2.88-2.83c-.094-.093-.161-.21-.193-.34-.032-.13-.027-.266.014-.393.04-.127.116-.24.217-.326.102-.086.225-.142.356-.16l3.978-.583 1.779-3.637c.059-.12.15-.22.262-.29.112-.07.242-.108.374-.108z" clip-rule="evenodd"></path></svg>
							  </span>
							      </div>
							    </div>							
							<div id="modal-star-num" style="display: none;"></div>
							<div id="modal-pno" style="display: none;"></div>
							</div>
							<div class="form-group">
								<textarea rows="" cols="" style="resize: none;" id="modal-review-content"></textarea>
							</div>
						</div>
		
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-primary" id="modalUpdateBtn">수정</button>
							<button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
						</div>
		
					</div>
				</div>
			</div>
		
		</div>
	</section>

</body>
</html>