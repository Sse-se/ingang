/**
 * 
 */

console.log("enrollList.js..............");

var enrollList = (function(){
	
	function list(param, callback, error){
		var page = param.page;
		var key = param.key;
		var word = param.word;
		
		$.getJSON(
			"/enrollList/list.do?page="+page+"&key="+key+"&word="+word,
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
	

	
	return {
		list: list,
	}
	
})();