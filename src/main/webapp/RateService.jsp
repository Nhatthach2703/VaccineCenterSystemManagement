<%-- 
    Document   : RateService
    Created on : Jul 5, 2024, 2:55:33 PM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đánh giá dịch vụ</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link href="assets/img/favicon.png" rel="icon" />
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />
        <link href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap" rel="stylesheet" />
        <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <<link rel="stylesheet" href="./assets/css/ServiceReview.css"/>
    </head>
    <style>
        .Btn {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    width: 200px;
    height: 40px;
    border: none;
    background-color: rgb(52,152,219);
    color: white;
    font-weight: 500;
    cursor: pointer;
    border-radius: 10px;
    transition-duration: .3s;
}

    </style>

    <body>
        <%@ include file="header.jsp" %>

    
        <div class="icon-box rounded-4 container" data-aos="fade-up" data-aos-delay="100" style="width: 100% ;margin-top: 10%">
                <div class="card h-25 p-5 text-center d-flex justify-content-center rounded-4" style="border-width: 2px;border-color: black">
                    <h2>Đánh giá dịch vụ</h2>
                    <form action="RateServiceServlet" method="post">
                        <input type="hidden" name="userID" value="${param.userID}">
                        <input type="hidden" name="type" value="${param.type}">
                        <p>Bạn đánh giá trải nghiệm như thế nào?</p>
                        <label for="type">Loại dịch vụ: ${param.type}</label>
                        <br>
                        <div class="rating">
                            <input type="radio" id="star5" name="rating" value="5" required>
                            <label for="star5"></label>
                            <input type="radio" id="star4" name="rating" value="4" required>
                            <label for="star4"></label>
                            <input type="radio" id="star3" name="rating" value="3" required>
                            <label for="star3"></label>
                            <input type="radio" id="star2" name="rating" value="2" required>
                            <label for="star2"></label>
                            <input type="radio" id="star1" name="rating" value="1" required>
                            <label for="star1"></label>
                        </div>
                        <div>
                            <p>Trải nghiệm của bạn về dịch vụ</p>
                            <input class="form-control rounded-4" style="height:100px" type="text" name="content" placeholder="Nội dung:" id="content" required>
                        </div>
                        <div class="ml-3 text-center d-flex justify-content-center">
                            <button type="submit" class="Btn mt-4">Gửi đánh giá <svg class="svg" viewBox="0 0 512 512">
        <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path></svg></button>
                        </div>
                    </form>
                    <c:if test="${not empty errorMessage}">
                        <p style="color: red;">${errorMessage}</p>
                    </c:if>

                </div>
            </div>

      
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/js/main.js"></script>

        <script>
            AOS.init();
        </script>
    </body>

</html>


