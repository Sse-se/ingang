<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ingang - Login</title>

    <!-- Custom fonts for this template-->
<!--     <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
<!--     <link -->
<!--         href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" -->
<!--         rel="stylesheet"> -->

<!--     Custom styles for this template -->
<!--     <link href="/css/sb-admin-2.min.css" rel="stylesheet"> -->
    
    

<%-- 메시지가 있는 경우에만 Alert 메시지를 표시 --%>
<%
  String message = (String) request.getAttribute("message");
%>

<% if (message != null) { %> 
  <script>
    alert("<%= message %>");
  </script>
<% } %>

</head>

<body class="bg-gradient-primary">
<div id="message"></div>

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image">
                            <img src="/upload/member/login.jpg" style="margin:3px; margin-top:9px; width:99%;hight:99%;">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" action="login.do" method="post">
                                        <div class="form-group">
                                            <input name="id" class="form-control form-control-user"
                                                id="id" aria-describedby="emailHelp"
                                                placeholder="Enter id...">
                                        </div>
                                        <div class="form-group">
                                            <input name="pw" type="password" class="form-control form-control-user"
                                                id="pw" placeholder="Password">
                                        </div>
                                       
                                        <button class="btn btn-primary btn-user btn-block">
                                            Login
                                        </button>
                                        <hr>
                                        <a style="background: #FEE500" href="https://kauth.kakao.com/oauth/authorize?client_id=4b4340562db2d9ce54a6e0d8bb473c6a&redirect_uri=http://localhost/member/kakao&response_type=code" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Kakao 
                                        </a>
                                        
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="findPwForm.do">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="check.do">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

   

</html>