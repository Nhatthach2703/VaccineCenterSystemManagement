<%-- 
    Document   : chooseVaccine
    Created on : Jul 2, 2024, 10:23:09 AM
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
        <meta content="" name="description" />
        <meta content="" name="keywords" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon" />
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <section id="hero" class="d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div
                            class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center"
                            >
                            <h1 data-aos="fade-up">THDAP Hệ Thống Trung Tâm tiêm chủng</h1>

                            
                        </div>
                        <div
                            class="col-lg-6 order-1 order-lg-2 hero-img"
                            data-aos="fade-left"
                            data-aos-delay="200"
                            >
                            <img style="height: 90%"
                                src="./assets/img/gia_vaccine.png"
                                class="img-fluid animated mt-4"
                                alt=""
                                />
                        </div>
                    </div>
                </div>
            </section>
        <div class="container-xl mt-5 " data-aos="fade-up">
            <div class="row">
                <c:forEach var="vaccine" items="${vaccines}">
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <img src="uploads/${vaccine.image}" class="card-img-top" alt="${vaccine.name}">
                            <div class="card-body">
                                <h5 class="card-title">${vaccine.name}</h5>
                                <p class="card-text">${vaccine.summary}</p>
                                <p class="card-text"><small class="text-muted">Nguồn gốc: ${vaccine.source}</small></p>
                                <p class="card-text"><strong>${vaccine.price} VND</strong></p>
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
        </script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
