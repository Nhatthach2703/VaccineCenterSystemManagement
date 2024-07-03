<%-- 
    Document   : userFileDetail
    Created on : Jun 30, 2024, 9:47:53 PM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />

        <title>Thêm hồ sơ bệnh nhân</title>
        <meta content="" name="description" />
        <meta content="" name="keywords" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon" />
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap" rel="stylesheet" />

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!--======-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            .table-title{
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0px 0px;
            }
            .btn-secondary{
                background-color: white;
                color: black;
            }
        </style>
    </head>
    <body>
        <jsp:include page="AdminHeader.jsp"/> <!-- Đổi lại header doctor -->
        <jsp:include page="banner.jsp"/>
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

                    <a href="EditUserFileServlet?userFileID=${userFile.userFileID}" class="btn btn-primary">Chỉnh sửa</a>
                    <form action="DeleteUserFileServlet" method="post" style="display:inline;">
                        <input type="hidden" name="userFileID" value="${userFile.userFileID}">
                        <input type="hidden" name="userID" value="${userFile.userID}">
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa hồ sơ bệnh án này?');">Xóa</button>
                    </form>
                    <a href="listUsers?searchTerm=&searchType=fullname" class="btn btn-secondary">Trở về</a>
                </div>
            </div>
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
    </body>
</html>