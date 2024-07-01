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
                            <img
                                src="./assets/img/flat-hand-drawn-coronavirus-vaccine-illustration.png"
                                class="img-fluid animated"
                                alt=""
                                />
                        </div>
                    </div>
                </div>
            </section>

            <div class="container mt-5">

                <div class="row row-cols-1 row-cols-md-3 g-5">
                    <c:forEach var="vaccine" items="${vaccine}">
                        <div class="col mb-4 "data-aos="fade-up" data-aos-delay="800">
                            <div class="card h-100 p-3 rounded-4" style="width: 25rem;border-width: 2px;border-color: black">
                                <a href="VaccineDetailsServlet?vaccineID=${vaccine.vaccineID}">
                                    <div class="card-body icon-box"  data-aos-delay="100" style="color: black">
                                        <img class="card-img-top" src="uploads/${vaccine.image}" alt="Vaccine Image" width="300" height="180"/>
                                        <h4 class="title" style="font-family: 'Tilt Neon', sans-serif">${vaccine.name}</h4>
                                        <p class="description">Nguồn gốc: ${vaccine.source}</p>
                                        <p class="description">Price: ${vaccine.price} .000 đồng</p>

                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
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
