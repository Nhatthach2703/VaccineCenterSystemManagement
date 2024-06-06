<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.thdap.vaccine.model.Vaccine" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Vaccine</title>
        <!-- Font Icon -->
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
        <<link rel="stylesheet" href="assets/css/Admin_CreateUpdateVaccine.css"/>

    </head>
    <body>
        <jsp:include page="AdminHeader.jsp"/>
        <div class="main" data-aos="zoom-in-left">
            <!-- Sign in Form -->
            <section class="sign-in" >
                <div class="container1" >
                    <div class="signin-content input_content" >
                        <div class="signin-form">
                            <h2 class="form-title mb-4">Chỉnh Sửa Thông Tin Vaccine</h2>

                            <form class="register-form input_infor" id="login-form" action="UpdateVaccineServlet" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/Loai vaccin.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Id Vaccine" type="text" id="vaccineID" name="vaccineID" value="${vaccine.vaccineID}" readonly>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/phacdotiem.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Tên Vaccine" type="text" id="name" name="name" value="${vaccine.name}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/Tom tat.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Tóm tắt" type="text" id="summary" name="summary" value="${vaccine.summary}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/nguon goc.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Nguồn gốc" type="text" id="source" name="source" value="${vaccine.source}" required>
                                </div>
                                <select id="typeID" name="typeID" class="opttion_vaccine" required>
                                    <!--<option>Loại vaccine</option>-->
                                    <c:forEach var="typeOfVaccine" items="${typeOfVaccines}">
                                        <option value="${typeOfVaccine.typeID}"<c:if test="${typeOfVaccine.typeID == vaccine.typeID}">selected</c:if>>${typeOfVaccine.name}</option>
                                    </c:forEach>
                                </select>
                                
            
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/Hinhanh.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <c:if test="${not empty vaccine.image}">
                                        <input type="hidden" name="existingImage" value="${vaccine.image}">
                                        <img src="uploads/${vaccine.image}" alt="Vaccine Image" style="width: 100px; height: 80px; margin-right: 1rem;" required>
                                    </c:if>
                                    <input type="file" id="image" name="image" placeholder="Ảnh Vaccine">
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/Lo trinh.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Lộ trình tiêm" type="text" id="injectionRoute" name="injectionRoute" value="${vaccine.injectionRoute}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/tuongtacthuoc.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Chống chỉ định" type="text" id="contraindicated" name="contraindicated" value="${vaccine.contraindicated}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/Tac dung phu.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Hướng dẫn sử dụng" type="text" id="usingNote" name="usingNote" value="${vaccine.usingNote}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/tuongtac.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Tương tác thuốc" type="text" id="drugInteractions" name="drugInteractions" value="${vaccine.drugInteractions}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/tacdungphu.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Tác dụng phụ" type="text" id="unwantedEffects" name="unwantedEffects" value="${vaccine.unwantedEffects}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/bao quan.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Bảo quản" type="text" id="preserve" name="preserve" value="${vaccine.preserve}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/user.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Đối tượng sử dụng" type="text" id="objectOfUse" name="objectOfUse" value="${vaccine.objectOfUse}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/phacdotiem.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Phác đồ tiêm" type="text" id="injectionRegimen" name="injectionRegimen" value="${vaccine.injectionRegimen}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <img src="assets/img/gia.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Giá" type="text" id="price" name="price" value="${vaccine.price}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <label class="checkbox-container">
                                        <input class="custom-checkbox" type="checkbox" id="haveToOrder" name="haveToOrder" ${vaccine.haveToOrder ? "checked" : ""}>
                                        <span class="checkmark"></span>
                                    </label>
                                    <div class="text" style="margin-left: 1.5rem;">Đặt mua Vaccine</div>
                                </div>
                                <div class="form-group" style=" margin-top: 2%">
                                     <button style="margin-right: 1rem" class="button_add">Sửa</button>

                                    <button class="button_add"><a href="ListVaccineServlet" style="color: white">Trở về</a></button>
                                    
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
