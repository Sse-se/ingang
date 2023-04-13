/**
 * 
 */


console.log("courseReview.js.................");

var review = (function(){
	
	// 리스트
	function list(param, callback, error){
		
		var no = param.no;
		var page = param.page;
		var sort = param.sort;
		var startRow = param.startRow;
		var endRow = param.endRow;
		
		$.getJSON(
			"/review/list.do?no="+no+"&page="+page+"&sort="+sort+"&startRow="+startRow+"&endRow="+endRow,
			function(data){
				if(callback){
					console.log(data);
					callback(data);
				} else{
					console.log(data);
				}
			}
		);
		
	}
	
	// 등록
	function write(param, callback, error){
		
		console.log("param : "+JSON.stringify(param));
		
		$.ajax({
			url: "/review/write.do",
			type: "post",
			data: JSON.stringify(param),
			contentType : "application/json; charset=utf-8",
			success: function(result){
				if(callback){
					callback(result)					
				} else{
					console.log(result)
				}
			},
			error: function(xhr, status, err){
				console.log(xhr)
				console.log(status)
				console.log(err)
			}
		});
	}
	
	// 수정
	function update(param, callback, error){
		
		console.log("param : "+JSON.stringify(param));
		
		$.ajax({
			url: "/review/update.do",
			type: "post",
			data: JSON.stringify(param),
			contentType : "application/json; charset=utf-8",
			success: function(result){
				if(callback){
					callback(result)					
				} else{
					console.log(result)
				}
			},
			error: function(xhr, status, err){
				console.log(xhr)
				console.log(status)
				console.log(err)
			}
		});
	}
	
	// 삭제
	function deleteFn(pno, callback, error){
		
		console.log("pno : "+pno);
		
		$.ajax({
			url: "/review/delete.do?pno="+pno,
			type: "delete",
			success: function(result){
				if(callback){
					callback(result)					
				} else{
					console.log(result)
				}
			},
			error: function(xhr, status, err){
				console.log(xhr)
				console.log(status)
				console.log(err)
			}
		});
	}
	
	// 좋아요
	function like(param, callback, error){
		
		console.log("param : "+JSON.stringify(param));
		
		$.ajax({
			url: "/review/like.do",
			type: "post",
			data: JSON.stringify(param),
			contentType : "application/json; charset=utf-8",
			success: function(result){
				if(callback){
					callback(result)					
				} else{
					console.log(result)
				}
			},
			error: function(xhr, status, err){
				console.log(xhr)
				console.log(status)
				console.log(err)
			}
		});
	}
	
	// 좋아요 취소
	function cancelLike(rno, callback, error){
		
		console.log("rno : "+rno);
		
		$.ajax({
			url: "/review/cancelLike.do?rno="+rno,
			type: "delete",
			success: function(result){
				if(callback){
					callback(result)					
				} else{
					console.log(result)
				}
			},
			error: function(xhr, status, err){
				console.log(xhr)
				console.log(status)
				console.log(err)
			}
		});
	}
		
	
	return {
		list: list,
		write: write,
		update: update,
		deleteFn: deleteFn,
		like: like,
		cancelLike:cancelLike

	}
	
})();