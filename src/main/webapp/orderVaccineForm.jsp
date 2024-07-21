<%-- 
    Document   : orderVaccineForm
    Created on : Jul 2, 2024, 11:14:46 AM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />

        <title>Chọn vaccine</title>

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <!-- Favicons -->
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />

        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap"
            rel="stylesheet"
            />

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link
            href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

        <link href="assets/css/style.css" rel="stylesheet" />
        <!--======-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

        <style>
            .table-title{
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0px 0px;
            }
            .btn-secondary{
                background-color: white;
                color: black;
            }
            label{
                margin-bottom: 10px;
                margin-top: 10px;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container mt-5  mb-5" data-aos="fade-down" >
            <div class="row">
                <h1 style="margin-top: 10%;font-weight: 700;" class="mb-5">Đăng ký mũi tiêm</h1>
                <div class="col-lg-5">
                    <div class="card mb-2 "  style="width:80%">
                        <h3 class="card-header" style="background-color: rgb(52,152,219);color: white">Thông tin vaccine</h3>
                        <div class="card-body">
                            <h5 class="card-title">${vaccine.name}</h5>
                            <p class="card-text">${vaccine.summary}</p>
                            <p class="card-text"><small class="text-muted">Nguồn gốc: ${vaccine.source}</small></p>
                            <p class="card-text"><strong id="price-${vaccine.vaccineID}">${vaccine.price} VND</strong></p>
                            <img src="uploads/${vaccine.image}" class="card-img-top" alt="${vaccine.name}">
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 ">
                    <h2>Thông tin khách hàng</h2>
                    <form action="PaymentServlet" method="post">
                        <div class="form-group">
                            <label for="customerName">Họ và tên:</label>
                            <input type="text" class="form-control" id="customerName" name="customerName" value="${sessionScope.user.fullName}" readonly>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="customerDoB">Ngày sinh:</label>
                                <input type="date" class="form-control" id="customerDoB" name="customerDoB" value="${sessionScope.user.doB}" readonly>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="customerGender">Giới tính:</label>
                                <input type="text" class="form-control" id="customerGender" name="customerGender" value="${sessionScope.user.gender}" readonly>
                            </div>
                        </div>
                            <div class="row">
                            <div class="form-group col-md-6">
                                <label for="customerPhoneNum">Số điện thoại:</label>
                                <input type="text" class="form-control" id="customerPhoneNum" name="customerPhoneNum" value="${sessionScope.user.phoneNumber}" readonly>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="customerEmail">Email:</label>
                                <input type="text" class="form-control" id="customerEmail" name="customerEmail" value="${sessionScope.user.email}" readonly>
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="customerAddress">Địa chỉ:</label>
                            <input type="text" class="form-control" id="customerAddress" name="customerAddress" value="${sessionScope.user.address}" readonly>
                        </div>
                        <input type="hidden" name="vaccineID" value="${vaccine.vaccineID}">
                        <input type="hidden" name="totalPrice" value="${vaccine.price}">
                        <input type="hidden" name="userID" value="${sessionScope.user.userID}">
                        <div class="form-group">
                            <label for="dateWantToGetVaccinated">Ngày muốn tiêm:</label>
                            <input type="date" class="form-control" id="dateWantToGetVaccinated" name="dateWantToGetVaccinated" value="${dateWantToGetVaccinated}" required>
                        </div>
                        <div class="form-group">
                            <label for="workLocationID">Địa điểm muốn tiêm:</label>
                            <select class="form-control" id="workLocationID" name="workLocationID" required>
                                <option value="">Chọn cơ sở</option>
                                <c:forEach var="location" items="${workLocations}">
                                    <option value="${location.workLocationID}" <c:if test="${workLocationID == location.workLocationID}">selected</c:if>>${location.name} - ${location.address}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="color: red; font-family: 'Tilt Neon', sans-serif;">${errorMessage}</div><br>
                        <button type="submit" class="btn" style="background-color: rgb(52,152,219);color: white">Đăng ký</button>
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
        <script>
            function showLoginAlert() {
                Swal.fire({
                    icon: 'error',
                    title: 'Bạn cần đăng nhập!',
                    text: 'Bạn cần đăng nhập để đăng ký mũi tiêm!',
                    showCancelButton: true,
                    confirmButtonText: 'Đăng nhập',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'login.jsp';
                    }
                });
            }
            
            // Hàm định dạng số tiền với dấu phẩy
            function formatCurrency() {
                document.querySelectorAll('[id^="price-"]').forEach(function(el) {
                    var priceText = el.textContent.replace(' VND', '');
                    var formattedPrice = Number(priceText).toLocaleString('vi-VN');
                    el.textContent = formattedPrice + ' VND';
                });
            }

            // Gọi hàm định dạng khi trang tải xong
            window.onload = formatCurrency;
        </script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
