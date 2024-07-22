<%-- 
    Document   : login
    Created on : May 18, 2024, 10:00:35 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>THDAP</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Font Icon -->
        <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
         <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <!-- AOS CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <!-- Main CSS -->
        <link rel="stylesheet" href="./assets/css/loginstyles.css">

        <style>
            .sign-in,
            .signup-form input {
                font-family: "Tilt Neon", sans-serif;
            }
            .form-group input{
                font-family: "Tilt Neon", sans-serif;
            }
        </style>
    </head>
    <body>

        <div class="main">
            <!-- Sign in Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content" data-aos="fade-up">
                        <div class="signin-image">
                            <figure><img src="assets/img/z5446367370898_a14bcad66d84989db91ad7079d275553.jpg" alt="sign up image"></figure>
                            <a href="SignUp.jsp" class="signin-image-link" style="color:black;text-decoration: none; font-size: 18px;">Tạo tài khoản</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title" style="font-family: 'Tilt Neon', sans-serif;">Đăng nhập</h2>
                            <form method="POST" action="login" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="your_name" placeholder="Tên" required/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="your_pass" placeholder="Mật khẩu" required/>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="rem" value="ON" id="remember-me" class="agree-term"/>
                                    <label for="remember-me" class="label-agree-term"><span><span></span></span>Nhớ tài khoản</label>
                                </div>
                                <!-- Hiển thị thông báo nếu người dùng nhập sai -->
                                <div style="color: red; font-family: 'Tilt Neon', sans-serif;">${errorMessage}</div><br>
                                <div>
                                    <a class="forgot" href="forgotPassword.jsp">Quên mật khẩu</a>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Đăng Nhập với</span>
                                <ul class="socials">
                                    <li>
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/Vaccine/login-gg&response_type=code&client_id=338550021-l55c8354k1dtc9v340min1489e6vjmu2.apps.googleusercontent.com&approval_prompt=force">
                                            <i class="display-flex-center zmdi zmdi-google"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>

        <!-- AOS JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
        </script>
    </body>
</html>
