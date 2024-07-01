<%-- 
    Document   : error
    Created on : Jun 7, 2024, 2:59:42 AM
    Author     : Tran HaF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Successfully</title>

        <link rel="stylesheet" href="./assets/css/success_error.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://use.typekit.net/tqi0rfb.js"></script>
        <script>try {
                Typekit.load({async: true});
            } catch (e) {
            }</script>
    </head>
    <body>
        <div class="wrapper green">
            <div class="header__wrapper">
                <div class="header">
                    <div class="sign"><span></span></div>
                </div>
            </div>
            <h1>Yeah</h1>
            <p>Everything works fine!</p>

            <button onclick="goToNextPage()">Continue</button>
            <script>
                function goToNextPage() {
                    // Chuyển hướng đến trang JSP khác
                    window.location.href = 'index.jsp';
                    // ĐI ĐÂU THÌ THAY LINK JSP NHA
                }
            </script>
        </div>

        <script src="./assets/js/jquery-3.7.1.min.map"></script>
    </body>
</html>
