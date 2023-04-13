<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 로그</title>

<!-- 라이브러리 등록  : CDN 방식 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">


.message-row {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  margin-bottom: 10px;
}

.message-container {
	overflow-y: scroll;
	max-height: 500px;
}
.my-message {
  align-self: flex-end;
  background-color: #009933;
  color: #EDF3FB;
  margin-left: 20%;
  position: relative;
}

.par1-message {
    text-align: left;
    background-color: #F0F0F0;
    clear: both;
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    position: relative;
}
.message-box {
  display: inline-block;
  padding: 10px;
  border-radius: 10px;
  max-width: 80%;
  word-wrap: break-word;
}
.message-row::after {
	content: "";
	display: table;
	clear: both;
}
.my-message-date {
  align-self: flex-end;
  font-size: 0.8em;
  color: #666;
  margin-top: 5px;
  margin-left: 5px;
}
.par1-message-date {
align-self: flex-start;
  font-size: 0.8em;
  color: #666;
  margin-top: 5px;
  margin-left: 5px;
}
.par1-message-box {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-bottom: 10px;
}
.par1-profile-image {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  margin-right: 10px;
  position: relative;
}
#content {
  font-size: 15px;
  width: 86%;
  height: 100px;
  padding : 30px;
  border-color: #009933;
  border: 1px solid black;
  border-radius: 5px;
  float : left;
  outline : none;
}
.submitbtn {
  background-color : #009933;
  width: 10%;
  margin: 10px;
  padding: 30px;
  text-align: center;
  text-transform: uppercase;
  transition: 0.5s;
  background-size: 100%;
  color: white;
  box-shadow: 0 0 20px #eee;
  border-radius: 10px;	
  float: right;
}



</style>


</head>
<body>
	<div class="container">
		<h1>대화방</h1>
		<input type="hidden" name="id" id="id" value="${login.id }">
		<div id="message-container">
			<c:forEach items="${list}" var="message">
				<div class="message-row">
					<c:if test="${message.sender eq login.id}">
						
						<div class="my-message message-box">${message.content}</div>
						<div class="my-message-date">${message.sendDate}</div>
					</c:if>
					<c:if test="${message.sender eq param.par1}">
						 <div class="par1-message-box">
						 
						 <img class="par1-profile-image" alt ="이미지 없음">
						<div class="par1-message message-box">${message.content}</div>
						<div class="par1-message-date">${message.sendDate}</div>
						</div>
					</c:if>
				</div>
			</c:forEach>
			<c:if test="${vo.roomstatus == '진행중' }" >
			<form action="write.do?roomno=${param.roomno }&par1=${param.par1}"
				method="post" id="writeForm">
				<div class="form-group">
					<input name="content" id="content" class="form-control"></input>
				<button class="submitbtn" type ="submit">보내기</button>
				</div>
			</form>
			</c:if>
		</div>
	</div>
</body>
</html>