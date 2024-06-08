<%-- 
    Document   : TypeOfVaccine
    Created on : May 23, 2024, 9:35:04 AM
    Author     : ADMIN
--%>

<%@page import="com.thdap.vaccine.model.Vaccine"%>
<%@page import="java.util.List"%>
<%@page import="com.thdap.vaccine.dao.VaccineDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Vesperr Bootstrap Template - Index</title>
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

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <<link rel="stylesheet" href="./assets/css/TypeOfVaccine.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">

    <body>
        <div class="container-fluid">
            <jsp:include page="header.jsp"/>
            <jsp:include page="banner.jsp"/>
            <div class="container">

                <div>
                    <label class="vaccine-label">Tên</label>
                    <p class="vaccine-value">${vaccine.name}</p>
                </div>
                <div>
                    <label class="vaccine-label">Tóm tắt</label>
                    <p class="vaccine-value">${vaccine.summary}</p>
                </div>
                <div>
                    <label class="vaccine-label">Nguồn</label>
                    <p class="vaccine-value">${vaccine.source}</p>
                </div>
                <div>
                    <label class="vaccine-label">Loại Vaccine</label>
                    <c:forEach var="type" items="${typeOfVaccine}">
                        <c:if test="${type.typeID == vaccine.typeID}">
                            <p class="vaccine-value">${type.name}</p>
                        </c:if>
                    </c:forEach>
                </div>
                <div>
<!--                    <label class="vaccine-label">Image:</label><br>-->
                    <img src="uploads/${vaccine.image}" alt="Image" class="vaccine-image">
                </div>
                <div>
                    <label class="vaccine-label">Lộ trình tiêm</label>
                    <p class="vaccine-value">${vaccine.injectionRoute}</</p>
                </div>
                <div>
                    <label class="vaccine-label">Chống chỉ định</label>
                    <p class="vaccine-value">${vaccine.contraindicated}</p>
                </div>
                <div>
                    <label class="vaccine-label">Hướng dẫn sử dụng</label>
                    <p class="vaccine-value">${vaccine.usingNote}</p>
                </div>
                <div>
                    <label class="vaccine-label">Tương tác thuốc</label>
                    <p class="vaccine-value">${vaccine.drugInteractions}</p>
                </div>
                <div>
                    <label class="vaccine-label">Tác dụng phụ</label>
                    <p class="vaccine-value">${vaccine.unwantedEffects}</p>
                </div>
                <div>
                    <label class="vaccine-label">Bảo quản</label>
                    <p class="vaccine-value">${vaccine.preserve}</p>
                </div>
                <div>
                    <label class="vaccine-label">Đối tượng sử dụng</label>
                    <p class="vaccine-value">${vaccine.objectOfUse}</p>
                </div>
                <div>
                    <label class="vaccine-label">Phác đồ tiêm</label>
                    <p class="vaccine-value">${vaccine.injectionRegimen}</p>
                </div>
                <div>
                    <label class="vaccine-label">Giá</label>
                    <p class="vaccine-value">${vaccine.price}</p>
                </div>
                <div>
                    <label class="vaccine-label">Đặt mua Vaccine</label>
                    <p class="vaccine-value">${vaccine.haveToOrder}</p>
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
        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
        </script>
        <!-- Initialize Swiper -->

    </body>
</html>
