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
        <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
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

                    <div class="container-xl mt-5" data-aos="fade-up">
                        <div class="row">
                            <div class="col-lg-4">
                                <img src="uploads/${user.image}" alt="User Image" class="img-fluid rounded-circle img-thumbnail" style="width: 250px; height: 250px;">
                            </div>
                            <div class="col-lg-8">
                                <h3>Thông tin người dùng</h3>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Họ và tên</th>
                                        <td>${user.fullName}</td>
                                    </tr>
                                    <tr>
                                        <th>Giới tính</th>
                                        <td>${user.gender}</td>
                                    </tr>
                                    <tr>
                                        <th>Ngày sinh</th>
                                        <td>${user.doB}</td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td>${user.email}</td>
                                    </tr>
                                    <tr>
                                        <th>Số điện thoại</th>
                                        <td>${user.phoneNumber}</td>
                                    </tr>
                                    <tr>
                                        <th>Địa chỉ</th>
                                        <td>${user.address}</td>
                                    </tr>
                                </table>

                                <h3>Thông tin hồ sơ bệnh án</h3>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Thẻ bảo hiểm y tế</th>
                                        <td>${userFile.healthInsuranceCardNumber}</td>
                                    </tr>
                                    <tr>
                                        <th>Nhóm máu</th>
                                        <td>${userFile.bloodType}</td>
                                    </tr>
                                    <tr>
                                        <th>Tiền sử bệnh</th>
                                        <td>${empty userFile.medicalHistory ? 'Không có' : userFile.medicalHistory}</td>      
                                    </tr>
                                    <tr>
                                        <th>Dị ứng thuốc</th>
                                        <td>${empty userFile.historyOfDrugAllergies ? 'Không có' : userFile.historyOfDrugAllergies}</td>
                                    </tr>
                                </table>

                                <h3>Lịch sử tiêm</h3>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Ngày tiêm</th>
                                            <th>Vaccine</th>
                                            <th>Tình trạng bệnh nhân</th>
                                            <th>Ngày tiêm tiếp theo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="injectionInfo" items="${injectionInfos}">
                                            <tr>
                                                <td>${injectionInfo.injectionDate}</td>
                                                <td>
                                                    <c:forEach var="vaccine" items="${vaccines}">
                                                        <c:if test="${vaccine.vaccineID == injectionInfo.vaccineID}">
                                                            ${vaccine.name}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>${injectionInfo.patientStatus}</td>
                                                <td>${injectionInfo.dateOfNextInjection}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <a href="EditUserFileServlet?userFileID=${userFile.userFileID}" class="btn btn-primary button" style="background-color: #2ba8fb;">Chỉnh sửa</a>
                                <form action="DeleteUserFileServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="userFileID" value="${userFile.userFileID}">
                                    <input type="hidden" name="userID" value="${userFile.userID}">
                                    <button type="submit" class="btn btn-danger button" style="background-color: red;" onclick="return confirm('Bạn có chắc chắn muốn xóa hồ sơ bệnh án này?');">Xóa</button>
                                </form>
                                <a href="listUsers?searchTerm=&searchType=fullname" style="background-color: white; color:black; border:solid black 1px" class="btn btn-secondary button">Trở về</a>
                            </div>
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