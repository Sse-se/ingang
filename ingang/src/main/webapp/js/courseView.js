/**
 * 
 */


  var endView = (function(){ // endView 시작

        function update(view, callback, error){
    		console.log("view : "+JSON.stringify(view));

				$.ajax({
					url:"/courseView/update.do",
					type : "post",
					data : JSON.stringify(view),
			contentType : "application/json; charset=utf-8",
					success : function(result, status, xhr){
						if(callback){
							callback(result);
						}else{
							alert("수정 완료");
							console.log(result);
						}
					},
					error : function(xhr, status, err){
						if(error){
							error();
						}else{
							alert("수정 실패");
							console.log(xhr);
							console.log(status);
							console.log(err);
						}

					} // error
					
				}); // ajax

			} // update 
        
        return {
            update : update
        };
    })();
