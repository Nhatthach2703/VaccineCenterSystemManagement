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
  <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
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

        <body style="background-color: #fff">
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <jsp:include page="AdminSideBar.jsp"/>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
          <div class="main" data-aos="zoom-in-left">
            <!-- Sign in Form -->
            <section class="sign-in" >
                <div class="container1" style="margin: 30px auto" >
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
                                    <input placeholder="Giá" type="number" id="price" name="price" value="${vaccine.price}" required>
                                </div>
                                <div class="form-group" style="display: flex; align-items: center;">
                                    <label class="checkbox-container">
                                        <input class="custom-checkbox" type="checkbox" id="haveToOrder" name="haveToOrder" ${vaccine.haveToOrder ? "checked" : ""}>
                                        <span class="checkmark"></span>
                                    </label>
                                    <div class="text" style="margin-left: 1.5rem;">Đặt mua Vaccine</div>
                                </div>
                                         <div style="color: red;font-family: 'Tilt Neon', sans-serif;font-size:15px; height: 10px">${errorMessage}</div>
                                <div class="form-group" style=" margin-top: 2%">
                                     <button style="margin-right: 1rem">Sửa</button>

                                    <button><a href="ListVaccineServlet" style="color: white">Trở về</a></button>
                                    
                                </div>
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