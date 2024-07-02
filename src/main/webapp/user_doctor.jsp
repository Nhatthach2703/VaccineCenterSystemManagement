<%-- 
    Document   : CreateTypeOfVaccine
    Created on : May 23, 2024, 9:30:31 PM
    Author     : ADMIN
--%>

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
        <link rel="stylesheet" href="./assets/css/AdminList.css">
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="AdminSideBar.jsp"/>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper " ">
                <div data-aos="fade-up" class="container-fluid" >
                    <div class="card">
                    <!-- User Accounts -->
                    <section class="sign-in">
                        <div class="container-fluid">
                            <div class="signin-content">
                                <div class="signin-form">
                                    <table id="initialTable" class="table align-middle">
                                        <h2 class="form-title">User Accounts</h2>
                                        <thead>
                                            <tr>
                                                <th scope="col">User ID</th>
                                                <th scope="col">Họ và Tên</th>
                                                <th scope="col">Username</th>
                                                <th scope="col">Ảnh</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Ngày sinh</th>
                                                <th scope="col">Số điện thoại</th>
                                                <th scope="col">Địa chỉ</th>
                                                <th scope="col">Giới tính</th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${userList}">
                                                <tr>
                                                    <td>${user.userID}</td>
                                                    <td>${user.fullName}</td>
                                                    <td> <c:forEach var="account" items="${accountList}">
                                                            <c:if test="${user.accountID == account.accountID}">
                                                                ${account.username}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td><img src="uploads/${user.image}" alt="User Image" width="100px"></td>
                                                    <td>${user.email}</td>
                                                    <td>${user.doB}</td>
                                                    <td>${user.phoneNumber}</td>
                                                    <td>${user.address}</td>
                                                    <td>${user.gender}</td>


                                                </c:forEach>
                                        </tbody>
                                    </table>

                                    <!-- Doctor Accounts -->
                                    <table id="newTable" class="table align-middle">
                                        <h2 class="form-title">Doctor Accounts</h2>
                                        <thead>
                                            <tr>
                                                <th scope="col">Doctor ID</th>
                                                <th scope="col">Họ và tên</th>
                                                <th scope="col">Usename</th>
                                                <th scope="col">Ảnh</th>
                                                <th scope="col">Email</th>
                                                <!--                                        <th scope="col">Ngày sinh</th>-->
                                                <th scope="col">Số điện thoại</th>
                                                <th scope="col">Địa chỉ</th>
                                                <!--                                        <th scope="col">Giới tính</th>-->
                                                <th scope="col">Nơi làm việc</th>
                                                <th scope="col">Bằng cấp</th>
                                                <th scope="col">Chức vụ</th>
                                                <th scope="col">Kinh nghiệm</th>
                                                <th scope="col">Thao tác</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="doctor" items="${doctorList}">
                                                <tr>
                                                    <td>${doctor.doctorID}</td>
                                                    <td>${doctor.fullName}</td>
                                                    <td> <c:forEach var="account" items="${accountList}">
                                                            <c:if test="${doctor.accountID == account.accountID}">
                                                                ${account.username}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td><img src="uploads/${doctor.image}" alt="Doctor Image" width="100px"></td>
                                                    <td>${doctor.email}</td>
        <!--                                            <td>${doctor.doB}</td>-->
                                                    <td>${doctor.phoneNumber}</td>
                                                    <td>${doctor.address}</td>
        <!--                                            <td>${doctor.gender}</td>-->
                                                    <td>${doctor.workLocationID}</td>
                                                    <td>${doctor.degreeType}</td>
                                                    <td>${doctor.jobTitle}</td>
                                                    <td>${doctor.yearsOfExperience}</td>
                                                    <td>
        <!--                                                <a href="LockAndUnlockAccountServlet?accountID=${doctor.accountID}"
                                                           class="settings" title="Sửa" 
                                                           data-toggle="tooltip"> <img src="assets/img/lock-keyhole-minimalistic-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;" /></a>-->
                                                        <c:forEach var="account" items="${accountList}">
                                                            <c:if test="${doctor.accountID == account.accountID}">
                                                                <c:choose>
                                                                    <c:when test="${account.status}">
                                                                        <a href="LockAndUnlockAccountServlet?accountID=${account.accountID}&action=lock" class="settings" title="Khóa" data-toggle="tooltip"><img src="assets/img/lock-keyhole-minimalistic-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;" /></a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                        <a href="LockAndUnlockAccountServlet?accountID=${account.accountID}&action=unlock" class="settings" title="Mở khóa" data-toggle="tooltip"><img src="assets/img/key-minimalistic-square-3-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;" /></a>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:if>
                                                            </c:forEach>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                   
                                </div>
                            </div>
                        </div>
                    </section>
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
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>