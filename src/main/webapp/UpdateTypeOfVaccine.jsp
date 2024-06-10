<%-- 
    Document   : CreateTypeOfVaccine
    Created on : May 23, 2024, 9:30:31 PM
    Author     : ADMIN
--%>
<%@page import="com.thdap.vaccine.dao.TypeOfVaccineDAO"%>
<%@page import="com.thdap.vaccine.model.TypeOfVaccine"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Chỉnh Sửa Thông Tin Loại Vaccine</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <!-- Template Main CSS File -->
    <!--    <link rel="stylesheet" href="assets/css/adminUI.css"/>-->
    <link href="assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/Admin_UpdateTypeOfVaccine.css"/>



    <body>

        <jsp:include page="AdminHeader.jsp"/>
        <div class=" mt-5">
            <section class="container1"data-aos="flip-left"  >
                <div class="container">
                    <div class="signin-content infor_conetnt">
                        <div class="signin-form infor_form">
                            <h2 class="title">Chỉnh Sửa Thông Tin Loại Vaccine</h2>
                            <form action="UpdateTypeOfVaccineServlet" method="post" class="register-form" id="login-form">
                                <div class="form-group" style="display: flex">
                                    <img src="assets/img/Loai vaccin.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input class="input_infor" type="text" name="typeID" id="vaccine_id" placeholder="Loại Vaccine"
                                           value="${typeOfVaccine.typeID}" readonly/>
                                </div>
                                <div class="form-group" style="display: flex">
                                    <img src="assets/img/phacdotiem.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input class="input_infor" placeholder="Tên Vaccine" type="text" id="ir" name="name"
                                           value="${typeOfVaccine.name}" required>
                                </div>
                                 <div class="m-3" style="color: red;font-family: 'Tilt Neon', sans-serif;font-size:15px; height: 10px">${errorMessage}</div>
                                <button style="margin-right: 1rem" class="button_save">Sửa</button>
                                <button style="margin-right: 1rem" class="button_save"><a href="CRUDTypeOfVaccineServlet" style="color: white">Trở về</a></button>
                            </form>
                        </div>
                    </div>
                </div>
            </section

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
