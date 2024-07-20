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
        <link
            href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap"
            rel="stylesheet"
            />
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">   
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/ServiceReview.css"/>
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
    </head>
    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="AdminSideBar.jsp"/>
            <!-- Sidebar End -->

            <!-- Main wrapper -->
            <div class="body-wrapper">
                <jsp:include page="IndexHeader.jsp"/>
                <div data-aos="fade-up" class="container-fluid">
                    <div class="container-fluid">
                        <div class="container text-center">
                            <div class="row g-0">
                                <div class=" mb-5 text-center">
                                    <h1>Danh sách đánh giá dịch vụ</h1>
                                </div>

                                <div class="col-sm-6 col-md-8" data-aos="fade-up" >
                                    <c:if test="${not empty errorMessage}">
                                        <div class="alert alert-danger">${errorMessage}</div>
                                    </c:if>

                                    <c:forEach var="review" items="${serviceReviews}">
                                        <div class="row card-text rounded-4 mb-5" style="width: 85%; border: 3px solid black">
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
                                                <div class="rating" <input type="radio" id="star5-${review.reviewID}" name="rating-${review.reviewID}" value="5" ${review.rate == 5 ? 'checked' : ''} disabled>
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

                </div>
            </div>
        </div>




        <!-- Include your JavaScript files -->
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/app.min.js"></script>
        <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
        <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
        <script src="./assets/js/dashboard.js"></script>

        <script>
            AOS.init();
        </script>

    </body>
</html>
