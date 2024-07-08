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
            .user-card {
                border: 1px solid #ddd;
                padding: 15px;
                margin: 15px;
                border-radius: 8px;
                background-color: #f9f9f9;
                text-align: center;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .user-info {
                margin-bottom: 15px;
            }
            .btn {
                padding: 5px 10px;
                border-radius: 5px;
                text-decoration: none;
                color: #fff;
            }
            .btn-primary {
                background-color: #007bff;
                border: none;
            }
            .btn-success {
                background-color: #28a745;
                border: none;
            }
            .container-xl {
                margin-top: 30px;
            }
            .form-inline {
                justify-content: center;
                margin-bottom: 30px;
            }
            .form-inline .form-control[name="searchTerm"] {
                width: 300px; /* Chỉnh kích thước ô tìm kiếm */
            }
            .form-inline .form-control[name="searchType"] {
                width: 150px; /* Chỉnh kích thước ô dropdown */
            }
            h1 {
                text-align: center;
                margin-bottom: 30px;
                font-family: 'Roboto', sans-serif;
            }
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
                <div class="container-xl">
                    <h1>Danh sách bệnh nhân</h1>
                    <form action="listUsers" method="get" class="form-inline">

                        <div class="form-group mx-sm-3 mb-2 ">
                            <input type="text" name="searchTerm" class="form-control" placeholder="Tên/SĐT/Số BHYT" value="${param.searchTerm}">
                        </div>
                        <div class="form-group mx-sm-3 mb-2 ">
                            <select name="searchType" class="form-control">
                                <option value="fullname" ${param.searchType == 'fullname' ? 'selected' : ''}>Tên</option>
                                <option value="healthInsuranceCardNumber" ${param.searchType == 'healthInsuranceCardNumber' ? 'selected' : ''}>Số BHYT</option>
                                <option value="phoneNumber" ${param.searchType == 'phoneNumber' ? 'selected' : ''}>Số Điện Thoại</option>
                            </select>
                        </div>


                        <button type="submit" class="btn btn-primary mb-2">Search</button>
                    </form>

                    <br>

                    <c:if test="${not empty errorMessage}">
                        <p style="color: red; text-align: center;">${errorMessage}</p>
                    </c:if>

                    <c:if test="${not empty users}">
                        <div class="row justify-content-center">
                            <c:forEach var="user" items="${users}">
                                <div class="col-md-3 user-card">
                                    <div class="user-info">
                                        <strong>Tên:</strong> ${user.fullName}<br>
                                        <strong>SĐT:</strong> ${user.phoneNumber}<br>
                                        <strong>Địa chỉ:</strong> ${user.address}
                                    </div>
                                    <c:choose>
                                        <c:when test="${userFileDAO.hasUserFile(user.userID)}">
                                            <a href="ViewUserFileDetailServlet?userID=${user.userID}" class="btn btn-primary">Xem hồ sơ bệnh nhân</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="AddUserFileServlet?userID=${user.userID}" class="btn btn-success">Tạo hồ sơ bệnh nhân</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>

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