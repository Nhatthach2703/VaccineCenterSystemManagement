<%-- Document : index Created on : May 18, 2024, 9:51:00 AM Author : DELL --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Thông Tin Chuyên Gia</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />
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

    <!-- =======================================================
      * Template Name: Vesperr
      * Template URL: https://bootstrapmade.com/vesperr-free-bootstrap-template/
      * Updated: Mar 17 2024 with Bootstrap v5.3.3
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->

    <body>
        <!-- ======= Header ======= -->
        <jsp:include page="header.jsp"/>

        <!-- End Hero -->

        <main id="main">
            
           
            <!-- ======= DoctorInfo Section ======= -->
<section id="team" class="team section-bg">
    <div class="container mt-5">
        <div class="section-title" data-aos="fade-up">
            <h2>THÔNG TIN CHUYÊN GIA</h2>
            <p>Những người bảo vệ sức khỏe với chuyên môn vững vàng và lòng nhiệt huyết.</p>
        </div>

        <div class="row g-4">
            <c:forEach var="doctor" items="${doctors}">
                <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                    <div class="member" data-aos="fade-up" data-aos-delay="100">
                        <div class="member-img">
                            <c:if test="${empty doctor.image}">
                                <img
                                  src="uploads/stockAvata.png"
                                  alt="Doctor Avatar"
                                  class="img-fluid"
                                />
                            </c:if>
                            <c:if test="${not empty doctor.image}">
                                <img
                                  src="uploads/${doctor.image}"
                                  alt="Doctor Avatar"
                                  class="img-fluid"
                                />
                            </c:if>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>${doctor.fullName}</h4>
                            <span>${doctor.jobTitle}</span>
                            <p>${doctor.degreeType}</p>
                            <c:forEach var="workLocation" items="${workLocations}">
                                <c:if test="${doctor.workLocationID == workLocation.workLocationID}">
                                    <p>${workLocation.name}</p>
                                    
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- End Section -->

       >

        </main>
        <!-- End #main -->

        <!-- ======= Footer ======= -->
        <jsp:include page="footer.jsp"/>
        <!-- End Footer -->

        <a
            href="#"
            class="back-to-top d-flex align-items-center justify-content-center"
            ><i class="bi bi-arrow-up-short"></i
            ></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
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
