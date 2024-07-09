<%-- 
    Document   : CreateTypeOfVaccine
    Created on : May 23, 2024, 9:30:31 PM
    Author     : ADMIN
--%>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
        <style>
            .table-title{
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0px 0px;
            }
            .btn-secondary{
                background-color: white;
                color: black;
            }
            .button {
                margin-left: 3px;
                padding: 10px 30px;
                border: 0;
                border-radius: 100px;
                background-color: #2ba8fb;
                color: #ffffff;
                font-weight: Bold;
                transition: all 0.5s;
                -webkit-transition: all 0.5s;
            }

            .button:hover {
                background-color: #6fc5ff;
                box-shadow: 0 0 20px #6fc5ff50;
                transform: scale(1.1);
            }

            .button:active {
                background-color: #3d94cf;
                transition: all 0.25s;
                -webkit-transition: all 0.25s;
                box-shadow: none;
                transform: scale(0.98);
            }
            label{font-family:'Tilt Neon'};
        </style>

    </head>


    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="DoctorSideBar.jsp"/>
            <!--  Sidebar End -->

            <!--  Main wrapper -->
            <div class="body-wrapper">
                <jsp:include page="DoctorHeader.jsp"/>
                <div class="container-xl " data-aos="fade-up">

                    <div class="container-xl" data-aos="fade-up">
                        <div class="table-wrapper">
                            <div class=" pt-3 pb-3">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <h2 >Thêm hồ sơ bệnh nhân</h2>
                                    </div>
                                </div>
                            </div>
                            <form action="AddUserFileServlet" method="post">
                                <input type="hidden" class="form-control" id="userID" name="userID" value="${userID}" required>
                                <div class="mb-3">
                                    <label for="healthInsuranceCardNumber" class="form-label">Số thẻ bảo hiểm y tế</label>
                                    <input type="text" class="form-control" id="healthInsuranceCardNumber" name="healthInsuranceCardNumber" value="${healthInsuranceCardNumber}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="bloodType" class="form-label">Nhóm máu</label>
                                    <select class="form-control" id="bloodType" name="bloodType" required>
                                        <option value="">Chọn nhóm máu</option>
                                        <option value="A" ${bloodType == 'A' ? 'selected' : ''}>A</option>
                                        <option value="B" ${bloodType == 'B' ? 'selected' : ''}>B</option>
                                        <option value="AB" ${bloodType == 'AB' ? 'selected' : ''}>AB</option>
                                        <option value="O" ${bloodType == 'O' ? 'selected' : ''}>O</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="medicalHistory" class="form-label">Tiểu sử bệnh</label>
                                    <input type="text" class="form-control" id="medicalHistory" name="medicalHistory" value="${medicalHistory}" >
                                </div>
                                <div class="mb-3">
                                    <label for="historyOfDrugAllergies" class="form-label">Tiền sử dị ứng thuốc</label>
                                    <input type="text" class="form-control" id="historyOfDrugAllergies" name="historyOfDrugAllergies" value="${historyOfDrugAllergies}" >
                                </div>
                                <div style="color: red; font-family: 'Tilt Neon', sans-serif;">${errorMessage}</div><br>
                                <button type="submit" class="btn btn-primary button">Submit</button>
                                <a href="listUsers?searchTerm=&searchType=fullname" class="btn btn-secondary button" style="background-color: white; color:black; border:solid black 1px">Trở về</a>
                            </form>
                        </div>
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