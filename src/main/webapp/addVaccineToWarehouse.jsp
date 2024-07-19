<%-- 
    Document   : addVaccineToWarehouse
    Created on : Jul 6, 2024, 5:43:54 PM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">-->
        <link rel="stylesheet" href="assets/css/Admin_CreateUpdateVaccine.css"/>
        <link rel="stylesheet" href="./assets/css/style.css"/>


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
    </head>

    <body style="background-color: #fff">
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="AdminSideBar.jsp"/>
            
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                 <jsp:include page="IndexHeader.jsp"/>
                <div data-aos="fade-up" class="container-fluid">
                    <div class="main"style="margin-top: 100px" data-aos="zoom-in">
                        <section class="sign-in" >
                            <div class="container1" >
                                <div class="signin-content input_content">
                                    <div class="signin-form">
                                        <h2 class="form-title mb-4">Thêm vaccine vào kho</h2>
                                        <form action="AddVaccineToWarehouseServlet" method="post" class="register-form input_infor" id="login-form" accept-charset="UTF-8">
                                            <div>
                                                <img src="assets/img/hospital-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;" />
                                                <select class="opttion_vaccine" id="vaccineID" name="vaccineID" required>
                                                    <option value="" disabled="" selected="">Chọn vaccine</option>
                                                    <c:forEach var="vaccine" items="${vaccines}">
                                                        <option value="${vaccine.vaccineID}" ${vaccineID == vaccine.vaccineID ? 'selected' : ''}>${vaccine.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div>
                                                <img src="assets/img/hospital-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;" />
                                                <select class="opttion_vaccine" id="workLocationID" name="workLocationID" required >
                                                    <option value="" disabled="" selected="" >Chọn kho của cơ sở</option>
                                                    <c:forEach var="workLocation" items="${workLocations}">
                                                        <option  value="${workLocation.workLocationID}" ${workLocationID == workLocation.workLocationID ? 'selected' : ''}>${workLocation.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div style="display: flex;
                                                 justify-content: space-between;">
                                                <img src="assets/img/gia.svg" style="width: 1rem; margin-right: 1rem;" />
                                                <input placeholder="Số lượng" type="number" id="quantity" name="quantity" value="${quantity}" required style="width: 92.5%">
                                            </div>
                                            <div style="color: red; font-family: 'Tilt Neon';">${errorMessage}</div><br>
                                            <!-- Other form fields -->
                                            <div class="form-group">
                                                <button >Thêm</button>
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
