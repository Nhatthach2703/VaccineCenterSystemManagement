<%-- 
    Document   : addUserFile
    Created on : Jun 30, 2024, 9:47:11 PM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm hồ sơ bệnh nhân</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <!-- Main CSS -->
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
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <link href="assets/css/style.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/> <!-- Đổi thành header của bác sĩ -->
        <jsp:include page="banner.jsp"/>
        <div class="container-xl mt-5 " data-aos="fade-up">
            <div class="table-wrapper">
                <div class="table-title pt-3 pb-3">
                    <div class="row">
                        <div class="col-sm-5">
                            <h2 class="mx-3">Thêm hồ sơ bệnh nhân</h2>
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
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <a href="listUsers?searchTerm=&searchType=fullname" class="btn btn-secondary">Trở về</a>
                </form>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
        </script>
    </body>
</html>
