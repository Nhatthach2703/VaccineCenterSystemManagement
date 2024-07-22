<%-- 
    Document   : chooseVaccine
    Created on : Jul 2, 2024, 10:23:09 AM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />

        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap" rel="stylesheet" />

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet" />

        <link href="assets/css/style.css" rel="stylesheet" />
        <!-- External CSS and JS -->

        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <!--        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">-->
        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">-->
        <style>
            .table-title {
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0px 0px;
            }
            .btn-secondary {
                background-color: white;
                color: black;
            }
            a{
                text-decoration: none;
            }
 

        </style>

    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="container mt-5" data-aos="fade-down" >
            <h1 style="margin-top: 10%;font-weight: 700;" class="mb-5 text-center">Đặt mua Vaccine</h1>
            <div class="row">
                <c:forEach var="vaccine" items="${vaccines}">
                    <div class="col-md-3">
                        <div class="card mb-4">
                            <img src="uploads/${vaccine.image}" class="card-img-top" alt="${vaccine.name}">
                            <div class="card-body">
                                <h5 class="card-title">${vaccine.name}</h5>
                                <p class="card-text">${fn:substring(vaccine.summary, 0, 100)}...</p>
                                
                                <p class="card-text"><small class="text-muted"><strong>Nguồn gốc:</strong> ${vaccine.source}</small></p>
                               
                                <div>
                                    <p class="card-text mt-2 mb-3"><strong id="price-${vaccine.vaccineID}">${vaccine.price} VND</strong></p>
                                </div>
                                <a href="VaccineDetailsServlet?vaccineID=${vaccine.vaccineID}" class="btn btn-light">Chi tiết</a>
                                <c:choose>
                                    <c:when test="${sessionScope.user == null}">
                                        <a href="#" class="btn btn-primary" onclick="showLoginAlert()">Đăng ký mũi tiêm</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="PaymentServlet?vaccineID=${vaccine.vaccineID}" class="btn btn-primary">Đăng ký mũi tiêm</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <!--        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>-->
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
                                                document.querySelectorAll('[id^="price-"]').forEach(function (el) {
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
