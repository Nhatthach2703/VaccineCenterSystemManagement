<%-- 
    Document   : CreateVaccine
    Created on : May 23, 2024, 3:50:38 PM
    Author     : ADMIN
--%>

<%@page import="com.thdap.vaccine.model.WorkLocation"%>
<%@page import="java.util.List"%>
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
                            <h2 class="form-title mb-4">Thêm Bác Sĩ</h2>
                            <form action="AddDoctor" method="post" class="register-form input_infor" id="login-form" enctype="multipart/form-data" accept-charset="UTF-8">

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/Tom tat.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <input placeholder="Tên Đăng Nhập" type="text" id="#" name="username" required>
                                </div>

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/nguon goc.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <input placeholder="Mật Khẩu" type="password" id="#" name="password" required>
                                </div>

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/Loai vaccin.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <input placeholder="Email" type="email" name="email" id="#" />
                                </div>


                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/nguon goc.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input placeholder="Tên Bác Sĩ" type="text" id="#" name="fullName" required>
                                </div>

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/Hinhanh.svg" style="width: 1rem; margin-right: 1rem;" />
                                    <input type="file" id="image" name="image" accept="image/*" placeholder="Ảnh Bác Sĩ" required>
                                </div>

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/Tac dung phu.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <input placeholder="Ngày sinh" type="date" id="doB" name="doB" required>
                                </div>

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/tuongtac.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <input placeholder="Số Điện Thoại" type="number" id="" name="phoneNumber" required>
                                </div>

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/tacdungphu.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <input placeholder="Địa Chỉ" type="text" id="#" name="address" required>
                                </div>

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/user.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <select class="opttion_vaccine" name="gender" id="gender">
                                        <option value="" disabled="" selected="">Giới tính</option>
                                        <option value="Nam">Nam</option>
                                        <option value="Nữ">Nữ</option>
                                        <option value="Khác">Khác</option>
                                    </select>
                                </div>
                                <img src="assets/img/Loai vaccin.svg" style="width: 1rem; margin-right: 1rem;"  />

                                <select class="opttion_vaccine" id="" name="workLocationID" required>
                                    <option value="" disabled selected>Địa Chỉ Làm Việc</option>
                                    <%
                                        List<WorkLocation> workLocations = (List<WorkLocation>) request.getAttribute("workLocations");
                                        if (workLocations != null) {
                                            for (WorkLocation location : workLocations) {
                                    %>
                                    <option value="<%= location.getWorkLocationID()%>">
                                        <%= location.getName()%> - <%= location.getAddress()%>
                                    </option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/gia.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <input placeholder="Loại Bằng Cấp" type="text" id="#" name="degreeType" required>
                                </div>
                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/gia.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <input placeholder="Chức Vụ" type="text" id="#" name="jobTitle" required>
                                </div>

                                <div class="form-group " style="display: flex">
                                    <img src="assets/img/gia.svg" style="width: 1rem; margin-right: 1rem;"/>
                                    <input placeholder="Năm Kinh Nghiệm" type="number" id="#" name="yearsOfExperience" required>
                                </div>
                                <div style="color: red;font-family: 'Tilt Neon', sans-serif;font-size:20px; height: 30px">${error}</div><br>
                                <div class="form-group">

                                    <button style="margin-right: 1rem" class="button_add">Thêm</button>

                                    <button class="button_add"><a href="AddDoctor" style="color: white">Trở về</a></button>

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
