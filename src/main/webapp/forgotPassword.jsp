<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>THDAP</title>

        <!-- Font Icon -->
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- AOS CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <!-- Main css -->
        <link rel="stylesheet" href="./assets/css/loginstyles.css">
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
    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container">
            <div class="signin-content" data-aos="fade-up">
                <div class="signin-image">
                    <figure><img src="assets/img/loginlogout/signin-image.jpg" alt="sing up image"></figure>
                </div>

                <form class="signin-form" style="margin:65px;" action="ForgotPassServlet" method="POST">
                    <div class="card-body">
                        <h2 class="form-title">Đặt lại mật khẩu</h2>
                        <h6 style="font-size: 12px;">Nhập email của bạn để đặt lại mật khẩu</h6>
                        <div class="form-group">
                            <label for="your_name"><i class="zmdi zmdi-email"></i></label> <input
                                type="email" name="email" id="email-for-pass" required="" placeholder="Email">
                        </div>
                    </div>
                    <div style="color: red">${message}</div><br>
                    <div class="form-group form-button">
                        <button class="form-submit" type="submit">Gửi</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init();
    </script>
    <script type='text/javascript'
    src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
    <script type='text/javascript' src=''></script>
    <script type='text/javascript' src=''></script>
    <script type='text/Javascript'></script>
</body>
</html>