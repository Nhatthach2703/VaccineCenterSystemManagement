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
        <link rel="stylesheet" href="./assets/css/ServiceReview.css" />
    </head>

    <body>
        <%@ include file="header.jsp" %>

        <section class="services sidebar">
            <div class="icon-box rounded-4" data-aos="fade-up" data-aos-delay="100">
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
                            <input class="form-control rounded-4" type="text" name="content" placeholder="Nội dung:" id="content" required>
                        </div>
                        <div class="ml-3 text-center d-flex justify-content-center">
                            <button type="submit" class="Btn mt-4">Gửi đánh giá</button>
                        </div>
                    </form>
                    <c:if test="${not empty errorMessage}">
                        <p style="color: red;">${errorMessage}</p>
                    </c:if>

                </div>
            </div>
        </section>

        <%@ include file="footer.jsp" %>

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


