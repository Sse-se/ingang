/**
 * 정규 표현식 처리
 * -- 새로 입력된 코드를 적용시키기 위해서 Ctrl+F5로 코드 새로고침을 해야 한다.
 * -> 2차 호출파일은 처음 실행 시 컴퓨터에 저장해놓고 다음에는 저장된 파일을 불러온다. (새로작성해도 새로 저장하지 않는다.)
 */
 
  console.log("regEx.js Loading.........");
 
 // const - 상수 변수 선언
 
 // 한글이름 패턴
 const reg_name = /^[가-힣]{2,5}$/;
 const reg_name_error_msg = "이름은 한글 2자 ~ 5자로 입력하세요.";
 
 // 영문이름 패턴
 const reg_ename = /^[A-Z\s+]{4,30}$/;
 const reg_ename_error_msg = "영문이름은 영문 4자 ~ 30자로 입력하세요.";
 
 // 아이디 패턴
 // 영어,숫자 포함 6자 ~ 20자 이내. 
 const reg_id = /^[a-zA-Z0-9]{6,20}$/;
 const reg_id_error_msg = "아이디는 영문자,숫자 6자 ~ 20자까지 사용 가능.";
 
 // 비밀번호 패턴
 // 글자이면서 4자이상 20자 이내
 const reg_pw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
 const reg_pw_error_msg = "비밀번호는 영문+숫자+특수문자(!@#$%^&*) 조합 8자 ~ 20자 이내.";
 
 // 생년월일 : 19xx, 20xx로 입력, 월 : 01 ~ 12로 입력, 일 : 01 ~ 31로 입력 
 const reg_birth = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
 const reg_birth_error_msg = "생년월일은 숫자와 - 를 포함해서 YYYY-MM-DD 형식으로 작성하세요.";

 // 휴대전화 번호 패턴
 const reg_tel = /^01([0|1|6|7|8|9])-[0-9]{3,4}-[0-9]{4}$/;
 const reg_tel_error_msg = "휴대전화 번호는 숫자, -을 포함해 01x-(xxx 또는 xxxx)-xxxx 형식에 맞게 입력하세요.";
 
 // 이메일 패턴
 // 아이디 : 영숫자로 시작하고 영문자 사이에 [-],[_],[.]을 한개 사용가능하다.
 // 도메인 : 영숫자로 시작
 // const reg_email1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])$/;
 const reg_email1 = /^^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])$$/;
 const reg_email1_error_msg = "이메일은 영문+숫자+[-_.]만 입력 가능합니다.";
 
 const reg_email2 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
 const reg_email2_error_msg = "이메일 @ 뒤에 도메인을 입력해야 합니다. (ex: gmail.com )";
 
 
 
 
 

 // 제목 패턴
 // 한글로 100자 이내(다른 문자도 입력가능) -> DB - 300 바이트
 // 4자 이상, 앞 뒤 공백문자는 허용하지 않는다.(제거해서 처리)
 const reg_title = /^.{4,100}$/;
 const reg_title_error_msg = "제목은 앞/뒤 공백 없이 4자이상 100자 이내로 입력하세요.";

 // 내용 패턴
 // 줄바꿈(\n)과 공백문자를 다 지우고 (" " -> "", \n -> "") 4자 이상 체크를 먼저 진행한다. -> 정규 표현식
 // . 전체 문자 - 줄바꿈은 포함하지 않는다.
 const reg_content = /^(\n|.){4,670}$/;
 // 한글로 670자 이내, 영문인 경우 2000자
// const reg_content = /^.{4,670}$/m;
 const reg_content_error_msg = "내용은 4자이상 670자 이내로 입력하세요.";
 
 
 const reg_contentsi = /^(\n|.){4,1500}$/;
 // 한글로 670자 이내, 영문인 경우 4000자
// const reg_content = /^.{4,1500}$/m;
 const reg_contentsi_error_msg = "내용은 4자이상 1500자 이내로 입력하세요.";

 // 작성자 패턴
 const reg_writer = /^[가-힣]{2,10}$/;
 const reg_writer_error_msg = "작성자는 한글 2자 ~ 10자로 입력하세요.";
 
 //공항
 const reg_station = /^[가-힣]{2,100}$/;
 const reg_station_error_msg = "한글이름은 한글 2자 ~ 5자로 입력하세요.";
 
 
 // 정규 표현식을 검사하는 함수.
 // test(정규 표현식 변수, 검사할 문자열, 패턴에 맞지 않는 경우 오류 메시지)
 function test(reg, str, err_msg){
	// alert(reg + ", "+ str);
	if(!reg.test(str)){ // 패턴이 맞지 않는 경우 처리
		// 오류 메시지 출력
		
//		alert(err_msg);
            err_msg
		
		// 호출한 쪽에 false 리턴 
		return false;
	}
	// 패턴에 맞는 경우 호출한 쪽에 true 리턴
	return true;
}


	// 데이터의 유효성 검사하는 함수 - input, textarea
	// isTrim -> 1이면 trim()처리 한다. 0이면 trim()처리 하지 않는다.
	function checkData(reg, obj, reg_err_msg, isTrim){
// 		alert("checkData.obj : "+obj);

		if(isTrim) obj.val(obj.val().trim());
			
		// 잘못된 데이터 처리
		if(!test(reg, obj.val(), reg_err_msg)){
			obj.focus();
			return false;
		}
		// 적당한 데이터 처리
		return true;
	};


