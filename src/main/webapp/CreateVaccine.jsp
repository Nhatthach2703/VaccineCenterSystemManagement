<%-- 
    Document   : CreateVaccine
    Created on : May 23, 2024, 3:50:38 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <jsp:include page="AdminHeader.jsp"/>
        <div class="main"style="margin-top: 100px" data-aos="zoom-in">
            <!-- Sing in  Form -->
            <section class="sign-in" >
                <div class="container1" >
                    <div class="signin-content input_content">

                        <div class="signin-form">
                            <h2 class="form-title mb-4">Thêm Vaccine</h2>
                            <form action="CreateVaccineServlet" method="post" class="register-form input_infor" id="login-form" enctype="multipart/form-data" accept-charset="UTF-8">

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/phacdotiem.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Tên vaccine" type="text" id="name" name="name" required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/Tom tat.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Tóm tắt" type="text" id="summary" name="summary" required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/nguon goc.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Nguồn gốc" type="text" id="source" name="source" required>
                                </div>
                                
                                <img src="assets/img/Loai vaccin.svg" style="width: 1rem; margin-right: 1rem;"  />
                                
                                <select class="opttion_vaccine" id="typeID" name="typeID" required>
                                    <!--<option>Loại vaccine</option>-->
                                    <option value="" disabled="" selected="">Loại vaccine</option>
                                    <c:forEach var="typeOfVaccine" items="${typeOfVaccines}">
                                        <option value="${typeOfVaccine.typeID}">${typeOfVaccine.name}</option>
                                    </c:forEach>
                                </select>
                                <!--                                </div>-->


                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/Hinhanh.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input type="file" id="image" name="image" placeholder="Ảnh Vaccine" required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/Lo trinh.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Đường tiêm" type="text" id="injectionRoute" name="injectionRoute"
                                           required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/tuongtacthuoc.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Chống chỉ định" type="text" id="contraindicated"
                                           name="contraindicated" required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/Tac dung phu.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Thận trọng khi sử dụng" type="text" id="usingNote" name="usingNote"
                                           required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/tuongtac.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Tương tác thuốc" type="text" id="drugInteractions"
                                           name="drugInteractions" required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/tacdungphu.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Tác dụng phụ" type="text" id="unwantedEffects"
                                           name="unwantedEffects" required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/bao quan.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Bảo quản" type="text" id="preserve" name="preserve" required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/user.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Đối tượng sử dụng" type="text" id="objectOfUse" name="objectOfUse"
                                           required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/phacdotiem.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Phác đồ tiêm" type="text" id="injectionRegimen"
                                           name="injectionRegimen" required>
                                </div>

                                <script>
                                    function previewImage() {
                                        const imageInput = document.getElementById('vaccine_image');
                                        const imagePreview = document.getElementById('vaccine-preview');

                                        if (imageInput.files && imageInput.files[0]) {
                                            const reader = new FileReader();
                                            reader.onload = function (e) {
                                                imagePreview.setAttribute('src', e.target.result);
                                                imagePreview.style.display = 'block';
                                                imagePreview.setAttribute('accept', 'image/*');
                                            };
                                            reader.readAsDataURL(imageInput.files[0]);
                                        } else {
                                            imagePreview.style.display = 'none';
                                        }
                                    }

                                    document.getElementById('vaccine_image').addEventListener('change', previewImage);
                                </script>

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/gia.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Giá" type="text" id="price" name="price" required>
                                </div>

                                <div class="form-group " style="display: flex; align-items: center;">

                                    <label class="checkbox-container">
                                        <input class="custom-checkbox" checked="" type="checkbox" id="haveToOrder"
                                               name="haveToOrder">
                                        <span class="checkmark"></span>
                                    </label>
                                    <div class="text" style="margin-left: 1.5rem;">Đặt mua Vaccine</div>
                                </div>
                                <div style="color: red;font-family: 'Tilt Neon', sans-serif;font-size:20px; height: 30px">${error}</div><br>
                                <div class="form-group">
                                   
                                    <button style="margin-right: 1rem" class="button_add">Thêm</button>

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
