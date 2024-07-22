<%-- 
    Document   : CreateVaccine
    Created on : May 23, 2024, 3:50:38 PM
    Author     : ADMIN
--%>

<%@page import="com.thdap.vaccine.model.WorkLocation"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/css/style.css"/>
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
            <jsp:include page="IndexHeader.jsp"/>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <div class="main" data-aos="zoom-in">
                    <!-- Sing in  Form -->
                    <section class="sign-in" style="padding-top: 30px ">
                        <div class="container1" style="margin-bottom: 30px;">
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
                                            <input placeholder="Ngày sinh" type="date" id="doB" name="doB" max="2003-12-31" required>
                                        </div>

                                        <div class="form-group " style="display: flex">
                                            <img src="assets/img/tuongtac.svg" style="width: 1rem; margin-right: 1rem;"/>
                                            <input placeholder="Số Điện Thoại" type="text" id="" name="phoneNumber" pattern="0[0-9]{9,}" title="Số điện thoại phải ít nhất 10 số và bắt đầu bằng số 0!" required>
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
                                            <input placeholder="Năm Kinh Nghiệm" type="number" id="#" name="yearsOfExperience" min="0" required>
                                        </div>
                                        <div style="color: red; font-family: 'Tilt Neon', sans-serif;font-size:20px; height: 30px">${errorMessage}</div><br>
                                        <div class="form-group">
                                            
                                            <button style="margin-right: 1rem">Thêm</button>


                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </section>

                </div>

            </div>



        </div>
        <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/app.min.js"></script>
        <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
        <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
        <script src="./assets/js/dashboard.js"></script>
    </body>

</html>