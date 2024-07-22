<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <!-- Font Icon -->
        <link
            rel="stylesheet"
            href="assets/css/confirm.css"
            />

        <!-- Main css -->
        <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- AOS CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <link rel="stylesheet" href="./assets/css/confrimCode.css" />
    </head>

    <body>
        <section>
            <div class="otp-card" data-aos="fade-down">
                <h1>Nhập mã OTP</h1>
                <p>Mã đã được gửi tới email của bạn</p>
                <form action="ConfirmCodeServlet" method="post">
                    <div class="otp-card-inputs">
                        <input type="text" maxlength="1" name="verificationCode1" />
                        <input type="text" disabled maxlength="1" name="verificationCode2" />
                        <input type="text" disabled maxlength="1" name="verificationCode3"/>
                        <input type="text" disabled maxlength="1" name="verificationCode4"/>
                    </div>
                    <p></p>
                    <div style="color: red">${kq}</div><br>
                    <button
                        type="submit"
                        class="verification"
                        name="signin"
                        >
                        Xác nhận
                    </button>
                </form>

            </div>
        </section>
        <div class="otp-card1"data-aos="fade-up">
            <img class="icon" src="assets/img/yes.png" alt="" />
            <h1>Xin chào</h1>
            <p></p>
            <h2>Bạn đã đăng ký thành công</h2>
            <button
                class="goSignIn"
                type="submit"
                onclick="window.location.href = 'login.jsp'"
                style="margin-top: 2rem; font-family: Tilt Neon, sans-serif"
                ;
                >
                Đăng nhập
            </button>
        </div>
        <!-- JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
                    AOS.init();
        </script>
        <script src="assets/js/confirm.js"></script>  </body>
    <!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>