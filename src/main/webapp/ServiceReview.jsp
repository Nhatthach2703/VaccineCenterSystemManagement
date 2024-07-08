<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon" />
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap"
            rel="stylesheet"
            />

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link
            href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/ServiceReview.css"/>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluids mt-5">
            <div class="container text-center mt-5">
                <div class="row g-0 justify-content-center">
                    <div class="mt-5 mb-5 text-center">
                        <h1><strong>Đánh giá dịch vụ</strong></h1>
                    </div>
                    <div class="col-md-8" data-aos="fade-up" data-aos-delay="100">
                        <c:forEach var="review" items="${serviceReviews}">
                            <div class="row card-text rounded-4 mb-5 justify-content-center" style="border: 5px solid black; width: 100%;">
                                <div class="card-image col-md-4 mb-5 mt-5">

                                    <div class="mt-4">
                                        <c:forEach var="user" items="${users}">
                                            <c:if test="${user.userID == review.userID}">
                                                <c:forEach var="account" items="${accounts}">
                                                    <c:if test="${user.accountID == account.accountID}">
                                                        <p><strong>Khách hàng:</strong> ${account.username}</p><br>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <p><strong>Loại:</strong> ${review.getType()}</p>
                                    </div>
                                </div>
                                <div class="col-md-8 mt-5">
                                    <H5><strong>Đánh giá trải nghiệm</strong></H5>
                                    <div class="rating">
                                        <input type="radio" id="star5-${review.reviewID}" name="rating-${review.reviewID}" value="5" ${review.rate == 5 ? 'checked' : ''} disabled>
                                        <label for="star5-${review.reviewID}"></label>
                                        <input type="radio" id="star4-${review.reviewID}" name="rating-${review.reviewID}" value="4" ${review.rate == 4 ? 'checked' : ''} disabled>
                                        <label for="star4-${review.reviewID}"></label>
                                        <input type="radio" id="star3-${review.reviewID}" name="rating-${review.reviewID}" value="3" ${review.rate == 3 ? 'checked' : ''} disabled>
                                        <label for="star3-${review.reviewID}"></label>
                                        <input type="radio" id="star2-${review.reviewID}" name="rating-${review.reviewID}" value="2" ${review.rate == 2 ? 'checked' : ''} disabled>
                                        <label for="star2-${review.reviewID}"></label>
                                        <input type="radio" id="star1-${review.reviewID}" name="rating-${review.reviewID}" value="1" ${review.rate == 1 ? 'checked' : ''} disabled>
                                        <label for="star1-${review.reviewID}"></label>
                                    </div>
                                    <p><strong>Nội dung</strong></p> <br>
                                    <p>${review.content}</p>                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
        <script>
            AOS.init();
        </script>
    </body>
</html>
