<%-- 
    Document   : ListServiceReview
    Created on : Jul 4, 2024, 10:48:26 PM
    Author     : DELL
--%>

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
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/ServiceReview.css"/>
    </head>
    <body>
        <%@ include file="AdminHeader.jsp" %>

        <div class="container-fluids mt-5">
            <div class="container text-center mt-5">
                <div class="row g-0">
                    <div class="mt-5 mb-5 text-center">
                        <h1>Danh sách đánh giá dịch vụ</h1>
                    </div>

                    <div class="col-sm-6 col-md-8" data-aos="fade-up" data-aos-delay="100">
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">${errorMessage}</div>
                        </c:if>
                        <c:if test="${not empty serviceReviews}">
                            <h4>CÓ ${reviewCount} ĐÁNH GIÁ</h4>
                        </c:if>
                        <c:forEach var="review" items="${serviceReviews}">
                            <div class="row card-text rounded-4 mb-5" style="width: 85%; border: 5px solid black">
                                <div class="col-md-4 mb-5 mt-5">

                                    <c:forEach var="user" items="${users}">

                                    </c:forEach>

                                    <c:forEach var="user" items="${users}">
                                        <c:if test="${user.userID == review.userID}">

                                            <c:forEach var="account" items="${accounts}">
                                                <c:if test="${user.accountID == account.accountID}">

                                                    <p><strong>Khách hàng:</strong> ${account.username}</p><br>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>

                                    <p><strong>Ngày:</strong> ${review.getDate()}</p>
                                    <p><strong>Loại:</strong> ${review.getType()}</p>
                                </div>
                                <div class="col-md-8 mt-5">
                                    <H5><strong>Đánh giá trải nghiệm</strong></H5>
                                    <div class="rating <input type="radio" id="star5-${review.reviewID}" name="rating-${review.reviewID}" value="5" ${review.rate == 5 ? 'checked' : ''} disabled>
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
                                    <p>${review.content}</p>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${empty serviceReviews}">
                            <p class="text-danger">Không có kết quả bạn cần tìm.</p>
                        </c:if>
                    </div>
                    <!-- Filter sidebar -->
                    <div class="col-6 col-md-4">
                        <section class="services sidebar p-3 border rounded-4" style="background-color: #f8f9fa;">
                            <form action="ListServiceReviewServlet" method="get">
                                <h4 class="mb-4">Lọc Đánh Giá </h4>
                                <div class="mb-3">
                                    <label for="rating" class="form-label">Rating:</label>
                                    <select name="rating" id="rating" class="form-select">
                                        <option value="" <%= request.getParameter("rating") == null ? "selected" : ""%>>Tất Cả</option>
                                        <option value="1" <%= "1".equals(request.getParameter("rating")) ? "selected" : ""%>>&starf;</option>
                                        <option value="2" <%= "2".equals(request.getParameter("rating")) ? "selected" : ""%>>&starf; &starf;</option>
                                        <option value="3" <%= "3".equals(request.getParameter("rating")) ? "selected" : ""%>>&starf; &starf; &starf;</option>
                                        <option value="4" <%= "4".equals(request.getParameter("rating")) ? "selected" : ""%>>&starf; &starf; &starf; &starf;</option>
                                        <option value="5" <%= "5".equals(request.getParameter("rating")) ? "selected" : ""%>>&starf; &starf; &starf; &starf; &starf;</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="startDate" class="form-label">Từ Ngày:</label>
                                    <input type="date" id="startDate" name="startDate" class="form-control" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : ""%>">
                                </div>
                                <div class="mb-3">
                                    <label for="endDate" class="form-label">Tới ngày:</label>
                                    <input type="date" id="endDate" name="endDate" class="form-control" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : ""%>">
                                </div>
                                <div class="mb-3">
                                    <label for="type" class="form-label">Loại:</label>
                                    <select name="type" id="type" class="form-select">
                                        <option value="" <%= request.getParameter("type") == null ? "selected" : ""%>>Tất cả</option>
                                        <option value="Tư vấn" <%= "Tư vấn".equals(request.getParameter("type")) ? "selected" : ""%>>Tư vấn</option>
                                        <option value="Tiêm" <%= "Tiêm".equals(request.getParameter("type")) ? "selected" : ""%>>Tiêm</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary w-100 mb-2">Lọc</button>
                                <a href="ListServiceReviewServlet" class="btn btn-secondary w-100">Xóa Lọc</a>
                            </form>
                        </section>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="footer.jsp" %>

        <!-- Include your JavaScript files -->
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
