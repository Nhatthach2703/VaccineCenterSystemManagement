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

                <div class="row g-0 ">
                    <div class="mt-5 mb-5 text-center">
                        <h1 >Đánh giá dịch vụ</h1>

                    </div>
                    <div class=" col-sm-6 col-md-8" data-aos="fade-up" data-aos-delay="100"> 
                        <c:forEach var="review" items="${serviceReviews}">

                            <div class="row card-text rounded-4 mb-5 " style="width: 85%; border: 5px solid black">
                                <div class="card-image col-md-4 mb-5 mt-5">
                                    <c:forEach var="user" items="${users}">
                                        <c:if test="${user.userID == review.userID}">                   
                                            <img src="uploads/${user.image}" alt="Vaccine Image" class="card-img"/>
                                        </c:if>
                                    </c:forEach>
                                    <div class="mt-4">
                                        <c:forEach var="user" items="${users}">
                                            <c:if test="${user.userID == review.userID}">

                                                <c:forEach var="account" items="${accounts}">
                                                    <c:if test="${user.accountID == account.accountID}">

                                                        <p>Username: ${account.username}</p><br>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                    </div>

                                </div>
                                <div class="col-md-8 mt-5">
                                    <p>Đánh giá trải nghiệm </p>
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


                                    <p class="text-lg-start">Nội dung: ${review.content}</p> <br>

                                </div>

                            </div>



                        </c:forEach>
                    </div>


                    <div class="col-6 col-md-4">
                        <section class="services sidebar">
                            <div class="icon-box rounded-4" data-aos="fade-up" data-aos-delay="100">
                                <div class="card h-25 p-5 text-center d-flex justify-content-center rounded-4" style="border-width: 2px;border-color: black">
                                    <h2>Đánh giá dịch vụ</h2>
                                    <c:choose>
                                        <c:when test="${empty sessionScope.account}">
                                            <p>
                                                <a href="login.jsp">
                                                    <button class="cta">
                                                        <span>Đăng nhập</span>
                                                        <svg width="15px" height="10px" viewBox="0 0 13 10">
                                                        <path d="M1,5 L11,5"></path>
                                                        <polyline points="8 1 12 5 8 9"></polyline>
                                                        </svg>
                                                    </button><br>
                                                </a>
                                                Để đánh giá dịch vụ vui lòng đăng nhập.
                                            </p>
                                        </c:when>
                                        <c:otherwise>
                                            <form action="ServiceReviewServlet" method="post">
                                                <input type="hidden" name="userID" value="${sessionScope.user.userID}">
                                                <p>Bạn đánh giá trải nghiệm như thế nào?</p>
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
                                                    <input class="form-control rounded-4" type="text" name="content" placeholder="Nội dung:" id="content" required style="padding-bottom: 40%;">
                                                </div>
                                                <div class="ml-3 text-center d-flex justify-content-center">
                                                    <button class="Btn mt-4">Gửi đánh giá 
                                                        <svg class="svg" viewBox="0 0 512 512">
                                                        <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path>
                                                        </svg>
                                                    </button>
                                                </div>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </section>
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
