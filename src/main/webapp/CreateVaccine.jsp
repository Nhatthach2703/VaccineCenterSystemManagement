<%@page import="com.thdap.vaccine.model.Vaccine"%>
<%@page import="com.thdap.vaccine.dao.VaccineDAO"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="assets/css/Admin_CreateUpdateVaccine.css"/>
    </head>
    <style>
            button {
                padding: 10px 30px;
                border: 0;
                border-radius: 100px;
                background-color: #2ba8fb;
                color: #ffffff;
                font-weight: Bold;
                transition: all 0.5s;
                -webkit-transition: all 0.5s;
            }

            button:hover {
                background-color: #6fc5ff;
                box-shadow: 0 0 20px #6fc5ff50;
                transform: scale(1.1);
            }

            button:active {
                background-color: #3d94cf;
                transition: all 0.25s;
                -webkit-transition: all 0.25s;
                box-shadow: none;
                transform: scale(0.98);
            }
        </style>

    <body style="background: #ffffff;">
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="AdminSideBar.jsp"/>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
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
                                            <input placeholder="Tên vaccine" type="text" id="name" name="name" value="${param.name}" required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/Tom tat.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Tóm tắt" type="text" id="summary" name="summary" value="${param.summary}" required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/nguon goc.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Nguồn gốc" type="text" id="source" name="source" value="${param.source}" required>
                                        </div>

                                        <img src="assets/img/Loai vaccin.svg" style="width: 1rem; margin-right: 1rem;"  />

                                        <select class="opttion_vaccine" id="typeID" name="typeID" required>
                                            <option value="" disabled="" selected="">Loại vaccine</option>
                                            <c:forEach var="typeOfVaccine" items="${typeOfVaccines}">
                                                <option value="${typeOfVaccine.typeID}" ${param.typeID == typeOfVaccine.typeID ? 'selected' : ''}>${typeOfVaccine.name}</option>
                                            </c:forEach>
                                        </select>
                                        <!--                                </div>-->


                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/Hinhanh.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input type="file" id="image" name="image" placeholder="Ảnh Vaccine" value="${param.image}" required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/Lo trinh.svg" style="width: 1rem; margin-right: 1rem;"  />
                                            <input placeholder="Đường tiêm" type="text" id="injectionRoute" name="injectionRoute" value="${param.injectionRoute}"
                                                   required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/tuongtacthuoc.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Chống chỉ định" type="text" id="contraindicated"
                                                   name="contraindicated" value="${param.contraindicated}" required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/Tac dung phu.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Thận trọng khi sử dụng" type="text" id="usingNote" name="usingNote" value="${param.usingNote}"
                                                   required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/tuongtac.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Tương tác thuốc" type="text" id="drugInteractions"
                                                   name="drugInteractions" value="${param.drugInteractions}" required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/tacdungphu.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Tác dụng phụ" type="text" id="unwantedEffects"
                                                   name="unwantedEffects" value="${param.unwantedEffects}" required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/bao quan.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Bảo quản" type="text" id="preserve" name="preserve" value="${param.preserve}" required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/user.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Đối tượng sử dụng" type="text" id="objectOfUse" name="objectOfUse" value="${param.objectOfUse}"
                                                   required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/phacdotiem.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Phác đồ tiêm" type="text" id="injectionRegimen" value="${param.injectionRegimen}"
                                                   name="injectionRegimen" required>
                                        </div>
                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/gia.svg" style="width: 1rem; margin-right: 1rem;" />
                                            <input placeholder="Giá" type="number" id="price" name="price" required>
                                        </div>

                                        <div class="form-group " style="display: flex; align-items: center;">

                                            <label class="checkbox-container">
                                                <input class="custom-checkbox" checked="" type="checkbox" id="haveToOrder"
                                                       name="haveToOrder">
                                                <span class="checkmark"></span>
                                            </label>
                                            <div class="text" style="margin-left: 1.5rem;">Đặt mua Vaccine</div>
                                        </div>
                                        <div style="color: red;font-family: 'Tilt Neon', sans-serif;font-size:15px; height: 15px">${errorMessage}</div><br>
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


            </div>
        </div>
        <script>
            // JavaScript để giữ lại giá trị của các trường input sau khi load lại trang
            document.addEventListener('DOMContentLoaded', function () {
                const form = document.querySelector('.register-form'); // Chọn form bằng class
                const inputs = form.querySelectorAll('input'); // Chọn tất cả các input trong form

                inputs.forEach(input => {
                    input.value = localStorage.getItem(input.id); // Lấy giá trị từ localStorage nếu có
                    input.addEventListener('input', function () {
                        localStorage.setItem(input.id, input.value); // Lưu giá trị vào localStorage khi có sự thay đổi
                    });
                });
            });
        </script>
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
        <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/app.min.js"></script>
        <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
        <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
        <script src="./assets/js/dashboard.js"></script>
    </body>

</html>