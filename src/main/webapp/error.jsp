<%-- 
    Document   : error
    Created on : Jun 7, 2024, 2:59:42 AM
    Author     : Tran HaF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error</title>

        <link rel="stylesheet" href="./assets/css/success_error.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://use.typekit.net/tqi0rfb.js"></script>
        <script>try {
                Typekit.load({async: true});
            } catch (e) {
            }</script>
    </head>
    <body>
        <div class="wrapper red">
            <div class="header__wrapper">
                <div class="header">
                    <div class="sign"><span></span></div>
                </div>
            </div>
            <h1>Whooops</h1>
            <p>Đã có vấn đề xảy ra, vui lòng thử lại!</p>

            <button onclick="goToHomePage()">Về trang chủ</button>
            <script>
                function goToHomePage() {
                    // Determine the redirection URL based on the roleID
                    var roleID = '<c:out value="${sessionScope.account.roleID}" />';
                    console.log(roleID);
                    if (roleID === 'Admin') {
                        window.location.href = 'AdminIndexServlet';
                    } else if (roleID === 'Doctor') {
                        window.location.href = 'doctorIndexServlet';
                    } else {
                        window.location.href = 'homeIndex';
                    }
                }
            </script>
        </div>
        <script src="./assets/js/jquery-3.7.1.min.map"></script>
    </body>
</html>
