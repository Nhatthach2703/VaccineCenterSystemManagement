<%-- 
    Document   : PricelistVaccine
    Created on : May 30, 2024, 12:41:57 AM
    Author     : ADMIN
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
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />

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
        <style>
            .custom-table thead th {
                background-color: rgb(51, 152, 219);
                color: white;
                padding: 20px;

            }

        </style>
    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="header.jsp"/>
            <section id="hero" class="d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div
                            class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center"
                            >
                            <h1 data-aos="fade-up">THDAP Hệ Thống Trung Tâm tiêm chủng</h1>


                        </div>
                        <div
                            class="col-lg-6 order-1 order-lg-2 hero-img"
                            data-aos="fade-left"
                            data-aos-delay="200"
                            >
                            <img style="height: 90%"
                                 src="./assets/img/gia_vaccine.png"
                                 class="img-fluid animated mt-4"
                                 alt=""
                                 />
                        </div>
                    </div>
                </div>
            </section>

            <div class="container mt-5" data-aos="fade-up" data-aos-delay="800">

                <table class="table table-striped custom-table">
                    <thead >
                        <tr>
                            <th>Vaccine</th>
                            <th>Nguồn gốc</th>
                            <th>Giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vaccine" items="${vaccine}">
                            <tr>
                                <td><a href="VaccineDetailsServlet?vaccineID=${vaccine.vaccineID}">${vaccine.name}</a></td>
                                <td>${vaccine.source}</td>
                                <td>${vaccine.price} đồng</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>



        </div>
        <jsp:include page="footer.jsp"/>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
