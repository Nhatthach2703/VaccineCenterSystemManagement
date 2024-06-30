<%-- 
    Document   : editUserFile
    Created on : Jun 30, 2024, 9:49:24 PM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />

        <title>Chỉnh sửa thông tin bệnh án</title>
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
                <div class="col-lg-8">
                    <h2>Chỉnh sửa hồ sơ bệnh án</h2>
                    <form action="EditUserFileServlet" method="POST">
                        <input type="hidden" name="userFileID" value="${userFile.userFileID}">
                        <input type="hidden" name="userID" value="${userFile.userID}">
                        <!-- Các trường chỉnh sửa của userFile -->
                        <div class="form-group">
                            <label for="healthInsuranceCardNumber">Thẻ bảo hiểm y tế:</label>
                            <input type="text" id="healthInsuranceCardNumber" name="healthInsuranceCardNumber" class="form-control" value="${userFile.healthInsuranceCardNumber}" required>
                        </div>
                        <div class="mb-3">
                            <label for="bloodType" class="form-label">Nhóm máu</label>
                            <select class="form-control" id="bloodType" name="bloodType" required>
                                <option value="">Chọn nhóm máu</option>
                                <option value="A" ${userFile.bloodType == 'A' ? 'selected' : ''}>A</option>
                                <option value="B" ${userFile.bloodType == 'B' ? 'selected' : ''}>B</option>
                                <option value="AB" ${userFile.bloodType == 'AB' ? 'selected' : ''}>AB</option>
                                <option value="O" ${userFile.bloodType == 'O' ? 'selected' : ''}>O</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="medicalHistory">Tiền sử bệnh:</label>
                            <textarea id="medicalHistory" name="medicalHistory" class="form-control" rows="3">${userFile.medicalHistory}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="historyOfDrugAllergies">Dị ứng thuốc:</label>
                            <textarea id="historyOfDrugAllergies" name="historyOfDrugAllergies" class="form-control" rows="3">${userFile.historyOfDrugAllergies}</textarea>
                        </div>
                        <div style="color: red; font-family: 'Tilt Neon', sans-serif;">${errorMessage}</div><br>
                        <!-- Nút Submit -->
                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                        <!-- Nút Trở về -->
                        <a href="ViewUserFilesServlet" class="btn btn-secondary">Trở về</a> <!-- Thay đổi URL tùy theo trang của bạn -->
                    </form>
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

