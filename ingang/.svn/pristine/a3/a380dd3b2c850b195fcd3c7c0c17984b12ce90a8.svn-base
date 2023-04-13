<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Forgot Password</title>

    
   

    <!-- Custom styles for this template-->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
    

    </script>
    <script type="text/javascript">
	function conform(){
		 var password1 = document.getElementsByName("changePw")[0].value;
		 var password2 = document.getElementsByName("changePw2")[0].value;

		 if(password1 == password2){
			 document.getElementById("pwForm").submit();
			 }else{
				alert("비밀번호가 일치하지 않음!");
				 }
		}
    </script>

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            
                            <div class="col-lg-6">
                            <form action="changePw.do" method="post" id = "pwForm">
                                <div class="p-5">
                                    
                                    	
                                        <div class="form-group">
                                        <input name="id" type="hidden"  value="${login.id }">
                                        <label for="changePw">변경하실 비밀번호</label>
                                            <input type = "password"class="form-control form-control-user"
                                                id="changePw" name="changePw" 
                                                placeholder="변경하실 비밀번호 입력">
                                                <label for="changePw">비밀번호 확인</label>
                                            <input type = "password" class="form-control form-control-user"
                                                id="changePw2" name = "changePw2"
                                                placeholder="변경하실 비밀번호 입력">
                                        </div>
                                        
                                        <label for="changePw">현제 비밀번호</label>
                                            <input class="form-control form-control-user"
                                                id="changePw" name="pw" 
                                                placeholder="현제 비밀번호">
                                        </div>
                                        <button type="button" onclick="conform()" class="btn btn-primary btn-user btn-block" id="pwFind">비밀번호 변경</button>
                                      </form>  
                                           
                                        
                                    
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="joinForm.do">Create an Account!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="loginForm.do">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    

</body>

</html>