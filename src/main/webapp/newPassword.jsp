<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up Form by Colorlib</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
         <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <!-- Main css -->
        <link rel="stylesheet" href="./assets/css/loginstyles.css">
    </head>
    <body oncontextmenu='return false' class='snippet-body bg-info'>

        <div>
            <!-- Container containing all contents -->
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="assets/img/loginlogout/signin-image.jpg" alt="sing up image"></figure>

                    </div>
                    <!-- White Container -->
                    <div class="signin-form">
                        <!-- Main Heading -->
                        <h2 class="form-title">Đặt lại mật khẩu</h2>

                        <form class="register-form" action="NewPassServlet" method="POST">
                            <!-- User Name Input -->
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="your_name" placeholder="Mật khẩu mới"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="confPassword" id="your_pass" placeholder="Nhập lại mật khẩu"/>
                            </div>
                            <div style="color: red;font-family: 'Tilt Neon', sans-serif;">${tbsubmit}</div><br>
                            <div style="color: red;font-family: 'Tilt Neon', sans-serif;">${status}</div><br>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Gửi"/>

                            </div>

                            <!-- Log in Button -->

                        </form>

                        <!-- Alternative Login -->

                    </div>

                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

    </body>
</html>