<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>ConfirmCode</title>

        <!-- Font Icon -->
        <link
            rel="stylesheet"
            href="assets/css/confrimCode.css"
            />

        <!-- Main css -->
        <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- AOS CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <link rel="stylesheet" href="assets/css/confirm.css" />
    </head>

    <body>
        <div class="otp-card"data-aos="fade-right">
            <h1>Nhập mã OTP</h1>
            <p>Mã đã được gửi tới email của bạn</p>
            <form id="register-form" action="ValidOtpServlet" role="form" autocomplete="off" class="form" method="post">
                <div class="otp-card-inputs">
                    <input type="text" maxlength="1" name="otp1" />
                    <input type="text" disabled maxlength="1" name="otp2" />
                    <input type="text" disabled maxlength="1" name="otp3"/>
                    <input type="text" disabled maxlength="1" name="otp4"/>
                </div>
                <p></p>
                <div style="color: red">${message}</div><br>
                <button
                    type="submit"
                    class="verification"
                    name="recover-submit"
                    >
                    Xác nhận
                </button>
            </form>
            
        </div>
        <!-- JS -->
         <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
        </script>
        <script src="assets/js/confirm.js"></script>  </body>
    <!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
