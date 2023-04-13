<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}

.modal {
	display: none; /* 처음에는 화면에서 보이지 않도록 설정 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경을 어둡게 표시 */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>



</head>
<body>
<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span class="close">&times;</span>
						<h2>인증번호를 입력하세요</h2>
						<p>
							<input type="number" id="mailCkInput">
						</p>
						<button id="emailCk" class="btn btn-primary btn-user btn-block">인증번호
							보내기</button>
						<button id="emailCkBtn" class="btn btn-primary btn-user btn-block">확인</button>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image">
						<img src="/upload/member/join.jpg"
							style="margin: 3px; margin-top: 40px; margin-left: 16px; width: 99%; hight: 99%;">
					</div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form id="join" class="user" action="join.do" method="post">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="id" placeholder="id" name="id">
									</div>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<button id="idck" type="button"
											class="btn btn-primary btn-user btn-block">중복체크</button>
									</div>

								</div>
								<div class="form-group">
									<input class="form-control form-control-user" id="name"
										name="name" placeholder="name" required>
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="email" name="email" placeholder="Email Address">

									<button name="myButton" id="myButton" type="button"
										class="btn btn-primary btn-user btn-block">인증</button>
									<span class="id_ok">사용 가능한 이메일입니다.</span> <span
										class="id_already">누군가 이 이멩를 사용하고 있어요.</span>
								</div>
								<div class="form-group">
									<input type="tel" class="form-control form-control-user"
										id="tel" name="tel" placeholder="tel(###-####-####)" required
										pattern="^\d{3}-\d{4}-\d{4}$">
								</div>

								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="pw" placeholder="Password" name="pw" required>
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											id="pw2" placeholder="Repeat Password" required>
									</div>
								</div>
								<button class="btn btn-primary btn-user btn-block">
									Register Account</button>
								<hr>

							</form>
							<hr>

							<div class="text-center">
								<a class="small" href="loginForm.do">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		document.getElementById("myButton").addEventListener("click",
				function() {
					document.getElementById("myModal").style.display = "block";
				});

		document.getElementsByClassName("close")[0].addEventListener("click",
				function() {
					document.getElementById("myModal").style.display = "none";
				});
	</script>

	<script type="text/javascript">
		//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
		var idck = 0;
		var emailck = 0;
		var code = null;
		$(function() {
			//idck 버튼을 클릭했을 때 
			$("#idck").click(function() {

				//userid 를 param.
				var id = $("#id").val();

				$.ajax({
					async : true,
					type : 'POST',
					data : id,
					url : "idcheck.do",
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						if (data.cnt > 0) {

							alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
							//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인

							$("#id").val("");
							$("#id").focus();
							idck = 0;

						} else {
							alert("사용가능한 아이디입니다.");
							//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인

							$("#pw").focus();
							//아이디가 중복하지 않으면  idck = 1 
							idck = 1;

						}
					},
					error : function(error) {

						alert("error : " + error);
					}
				});
			});
		});

		$(function() {
			$("#join").submit(function() {

				if (idck == 0) {
					alert("아이디 중복체크해라");
					return false;
				}
				if ($("#pw").val() != $("#pw2").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#pw, #pw2").val("");
					$("#pw").focus();
					return false;
				}
				if (emailck == 0) {
					alert("이메일인증을 완료해라.");

					return false;
				}

			});

		});

		$('#emailCk').click(function() {
			const email = $('#email').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
			const checkInput = $('#mailCkInput') // 인증번호 입력하는곳 

			$.ajax({
				type : 'get',
				url : "mailCheck.do?email=" + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				success : function(data) {
					console.log("data : " + data);
					checkInput.attr('disabled', false);
					code = data;
					alert('인증번호가 전송되었습니다.')
				}
			}); // end ajax
		}); // end send eamil

		$('#emailCkBtn').click(function() {
			const inputCode = $('#mailCkInput').val();

			if (inputCode === code) {
				alert('인증번호가 일치합니다.');
				document.getElementById("myModal").style.display = "none";
				emailck = 1;
			} else {
				alert('인증번호가 불일치 합니다. 다시 확인해주세요');

			}
		});
	</script>

</body>
</body>
</html>