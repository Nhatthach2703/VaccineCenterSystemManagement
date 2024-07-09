<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form by Colorlib</title>

        <!-- Font Icon -->
        <!--        <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">-->

        <!-- Main css -->
        <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- AOS CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <link href="./assets/css/loginstyles.css" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/profile.css" />
        
        <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
         <style>
            .signup-form h2,.signup-form input{
                font-family: "Tilt Neon", sans-serif;
            }
            .option {
                position: relative;
                display: inline-block;
                width: 303px;
                margin-bottom: 30px;
                margin-top: 20px;
            }

            .option select {
                width: 100%;
                padding: 10px;


                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                background: white;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .option::after {
                content: '\25BC'; /* Unicode character for down arrow */
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                pointer-events: none;
            }

        </style>
    </head>

    <body>

        <div class="main">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content"data-aos="fade-up">
                        <div class="signup-form">
                            <h2 class="form-title">Đăng kí</h2>
                            <form method="post" class="register-form" id="register-form" action="SignUpServlet">
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="fullName" id="fullName" placeholder="Tên" required/>
                                </div>
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="userName" id="userName" placeholder="UserName" required/>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="pass" id="pass" placeholder="Mật khẩu" required/>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="re_pass" id="re_pass" placeholder="Nhập lại mật khẩu" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Email" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="date" name="doB" id="doB" placeholder="Ngày sinh" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="phoneNumber" id="phoneNumber" placeholder="Số điện thoại" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="address" id="address" placeholder="Địa chỉ" required/>
                                </div>
                                <div class="option">
                                    <label for="gender"></label>
                                    <select name="gender" id="gender" required>
                                        <option value="" disabled selected>Giới tính</option>
                                        <option value="Nam">Nam</option>
                                        <option value="Nữ">Nữ</option>
                                        <option value="Khác">Khác</option>
                                    </select><br>
                                </div>
                                
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required/>
                                    <label for="agree-term" class="cbx" style="font-family: 'Tilt Neon';"><span><span></span></span>Tôi đồng ý với các điều khoản <a href="#" class="term-service">dịch vụ</a></label>
                                </div>
                                <div style="color: red;font-family: 'Tilt Neon', sans-serif;">${kq}</div><br>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Đăng kí" />
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img
                                    src="https://img.freepik.com/premium-vector/illustration-message-sent-flat-vector_203633-8051.jpg?w=740"
                                    alt="sing up image"></figure>
                            <a href="login.jsp" class="signup-image-link"style="color:black;text-decoration: none; font-size: 18px;font-family: 'Tilt Neon', sans-serif;">Tôi đã có tài khoản</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
        </script>
    </body>
</html>