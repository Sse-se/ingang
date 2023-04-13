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
    $(function() {
        //idck 버튼을 클릭했을 때 
        $("#pwFind").click(function() {
            
            //userid 를 param.
            var email =  $("#email").val(); 
            
            $.ajax({
                async: true,
                type : 'POST',
                data : email,
                url : "findPw.do",
                dataType : "json",
                contentType: "application/json; charset=UTF-8",
                success : function(data) {
                    if (data.pw != null ){
                        
                        alert(data.pw);
                        //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                        
                        $("#id").val("");
                        $("#id").focus();
                        
                        
                    
                    } else {
                        alert("비밀번호를찾을수 없습니다.");
                        //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                       
                        $("#pw").focus();
                        //아이디가 중복하지 않으면  idck = 1 
                        
                        
                    }
                },
                error : function(error) {
                    
                    alert("error : " + error);
                }
            });
        });
    });

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
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"><img src="/upload/member/login.jpg" style="margin:3px; margin-top:9px; width:99%;hight:99%;"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                                        <p class="mb-4">We get it, stuff happens. Just enter your email address below
                                            and we'll send you a link to reset your password!</p>
                                    </div>
                                    
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="email" aria-describedby="emailHelp"
                                                placeholder="Enter Email Address...">
                                        </div>
                                        
                                           <button class="btn btn-primary btn-user btn-block" id="pwFind">비밀번호 찾기</button>
                                        
                                    
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