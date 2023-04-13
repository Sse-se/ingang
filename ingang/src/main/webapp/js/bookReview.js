/**
 * 댓글 객체 선언해서 사용.
 */
 
 console.log("BookReview Module ........");
 
 var replyService = (function(){
 
 	// list(전달 데이터,   성공하면 실행할 함수, 실패하면 실행할 함수) - 전달되는 요소는 모두 생략 가능한다.
 	// param = {no:10, page:1}
 	function list(param, callback, error){
 		var no = param.no;
 		var page = param.page;
 		
 		// ajax 함수 한 줄 - $.getJSON(url, function).fail(function);
 		$.getJSON(
 			"/bookreview/list.do?page=" + page + "&no=" + no,
 			function(data){
 				// 성공하면 실행할 함수가 있다면 실행하자
 				if(callback){
 					console.log("data = " + JSON.stringify(data));
 					callback(data);
 				} // end of if(callback)
 				else {
 					alert(data);
 				}
 			} // end of function(data) - 성공했을 때 실행 함수 끝
 		).fail(function(xhr, status, err){// 실패 했을 때의 처리 시작 - function(통신객체, 상태, 에러)
 			if(error){
 				error();
 			} else {
 				console.log("xhr=" + xhr);
 				console.log("status=" + status);
 				console.log("err=" + err);
 				alert("댓글 리스트를 가져오는 문제가 발생했습니다.");
 			}
 		}) // 실패 했을 때의 처리 끝
 		;
 	}

	// write(전달 데이터,   성공하면 실행할 함수, 실패하면 실행할 함수) - 전달되는 요소는 모두 생략 가능한다.
	// reply = {no:284, reply:"~~~"}
	function write(reply, callback, error){
		console.log("write Reply .....................................");
		console.log("reply = " + JSON.stringify(reply));
		
		// 서버로 데이터를 보내서 댓글 등록 시킨다.
		$.ajax({
			url : "/bookreview/write.do",
			type : "post",
			// 서버에 전달해 주는 데이터
			data : JSON.stringify(reply),
			// 넘겨 주는 데이터의 타입 - json : text
			contentType : "application/json; charset=utf-8",
			// 서버의 정상 처리 후 실행하는 함수
			success : function(result, status, xhr){
				// 아래 3가지 처리를 전달받은 함수에 넣어서 처리하자.
				//   사용자에게 메시지 전달.
				//   모달 창을 닫기
				//   댓글 리스트를 다시 불러와야 한다.
				if(callback){
					callback(result);
				}else {
					alert("성공적으로 댓글 등록이 되었습니다.")
					console.log(result);
				}
			},
			// 서버에 오류가 있을 때 실행되는 함수.
			error : function(xhr, status, er){
				console.log(xhr);
				console.log(status);
				console.log(er);
				if(error){
					error();
				}else{
					alert("댓글 등록에 실패했습니다.")
				}
			} // error의 끝
			
		}); // $.ajax()의 끝
	} // function write() 의 끝
 
	// update(전달 데이터,   성공하면 실행할 함수, 실패하면 실행할 함수) - 전달되는 요소는 모두 생략 가능한다.
	// reply = {rno:10, reply:"~~~"}
	function update(reply, callback, error){
		console.log("update Reply .....................................");
		console.log("reply = " + JSON.stringify(reply));
		
		// 서버로 데이터를 보내서 댓글 등록 시킨다.
		$.ajax({
			url : "/bookreview/update.do",
			type : "post",
			// 서버에 전달해 주는 데이터
			data : JSON.stringify(reply),
			// 넘겨 주는 데이터의 타입 - json : text
			contentType : "application/json; charset=utf-8",
			// 서버의 정상 처리 후 실행하는 함수
			success : function(result, status, xhr){
				// 아래 3가지 처리를 전달받은 함수에 넣어서 처리하자.
				//   사용자에게 메시지 전달.
				//   모달 창을 닫기
				//   댓글 리스트를 다시 불러와야 한다.
				if(callback){
					callback(result);
				}else {
					alert("성공적으로 댓글 수정이 되었습니다.")
					console.log(result);
				}
			},
			// 서버에 오류가 있을 때 실행되는 함수.
			error : function(xhr, status, er){
				console.log(xhr);
				console.log(status);
				console.log(er);
				if(error){
					error();
				}else{
					alert("댓글 수정이 실패하였습니다.")
				}
			} // error의 끝
			
		}); // $.ajax()의 끝
	} // function update() 의 끝
 
 
	// delete(전달 데이터,   성공하면 실행할 함수, 실패하면 실행할 함수) - 전달되는 요소는 모두 생략 가능한다.
	function deleteFunc(rno, callback, error){
		console.log("delete Reply .....................................");
		console.log("rno = " + rno);
		
		// 서버로 데이터를 보내서 댓글 등록 시킨다.
		$.ajax({
			url : "/bookreview/delete.do?rno=" + rno,
			type : "delete",
			// 서버의 정상 처리 후 실행하는 함수
			success : function(result, status, xhr){
				// 아래 3가지 처리를 전달받은 함수에 넣어서 처리하자.
				//   사용자에게 메시지 전달.
				//   모달 창을 닫기
				//   댓글 리스트를 다시 불러와야 한다.
				if(callback){
					callback(result);
				}else {
					alert("성공적으로 댓글 삭제가 되었습니다.")
					console.log(result);
				}
			},
			// 서버에 오류가 있을 때 실행되는 함수.
			error : function(xhr, status, er){
				console.log(xhr);
				console.log(status);
				console.log(er);
				if(error){
					error();
				}else{
					alert("댓글 삭제가 실패하였습니다.")
				}
			} // error의 끝
			
		}); // $.ajax()의 끝
	} // function delete() 의 끝
 
 	return {
 		// 함수 리턴
 		list:list, // replyService.list()
 		write:write, // replyService.write()
 		update:update, // replyService.update()
 		delete:deleteFunc, // replyService.update()
 	};
 
 })(); // JSON 객체 선언 방법
 