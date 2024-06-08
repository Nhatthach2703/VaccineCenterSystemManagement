<%-- 
    Document   : addConsultationSchedule
    Created on : Jun 6, 2024, 10:15:04 AM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đặt lịch tư vấn</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <!-- Main CSS -->

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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <<link rel="stylesheet" href="assets/css/Admin_CreateUpdateVaccine.css"/>
    </head>
    <body>
        <%--<jsp:include page="AdminHeader.jsp"/>--%>
        <jsp:include page="header.jsp"/>
        <div class="main"style="margin-top: 100px" data-aos="zoom-in">
            <!-- Sing in  Form -->
            <section class="sign-in" >
                <div class="container1" >
                    <div class="signin-content input_content">

                        <div class="signin-form">
                            <h2 class="form-title mb-4">Đặt lịch tư vấn</h2>
                            <form action="AddConsultationScheduleServlet" method="post" class="register-form input_infor" id="login-form" accept-charset="UTF-8">
                                <input type="hidden" name="userID" value="${sessionScope.user.userID}">
                                <div>
                                    <img src="assets/img/hospital-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;"  />
                                    <select class="opttion_vaccine" id="workLocationID" name="workLocationID" required> 
                                        <option value="" disabled="" selected="">Địa điểm tư vấn</option>
                                        <c:forEach var="workLocation" items="${workLocations}">
                                            <option value="${workLocation.workLocationID}">${workLocation.name}</option>
                                        </c:forEach>                                                                         
                                    </select>
                                </div>
                                <div>
                                    <img src="assets/img/clinic-history-clipboard-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;"  />
                                    <select class="opttion_vaccine" id="shiftID" name="shiftID" required>
                                        <option value="" disabled="" selected="">Thời gian</option>
                                        <c:forEach var="shift" items="${shifts}">
                                            <option value="${shift.shiftID}">${shift.startTime} - ${shift.endTime}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/pills-calendar-svgrepo-com.svg" style="width: 1rem; margin-right: 2.5rem;" />
                                    <input placeholder="ngày" type="date" id="date" name="date" style="width: 300px; font-family: 'Josefin Sans', sans-serif;"  required>
                                </div>
                                <div class="form-group">
                                    <button style="margin-right: 1rem" class="button_add">Thêm</button>
                                    <button class="button_add"><a href="index.jsp" style="color: white">Trở về</a></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>

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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="assets/js/main.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
        </script>
    </body>
</html>
