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
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />

        <link rel="stylesheet" href="assets/css/Admin_UpdateTypeOfVaccine.css"/>
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="AdminSideBar.jsp"/>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
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
                    </section>

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