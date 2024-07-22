<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>THDAP</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <!-- Main CSS -->

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

        <!-- Template Main CSS File -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <link href="assets/css/style.css" rel="stylesheet" />
        <!--        <<link rel="stylesheet" href="assets/css/New.css"/>-->
        <style>
            body{background-color: white;}
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container" style="margin-top: 100px" data-aos="zoom-in">
            <div class="row mb-4">
                 <div class="col-md-6">
                    <img src="uploads/${news.image}" alt="${news.title}" style="width: 100%; height: auto; object-fit: contain; margin-bottom: 1rem;">
                </div>
                <div class="col-md-6">
                    <h1 class="mb-3">${news.title}</h1>
                    <p style="font-size: 20px">
                        <c:forEach var="doctor" items="${doctors}">
                            <c:if test="${doctor.doctorID == news.doctorID}">
                                Người Đăng: ${doctor.fullName}
                            </c:if>
                        </c:forEach>
                    </p>
                    <p>Date: ${news.date}</p>
                    <p style="font-size: 16px;">${news.content}</p>
                </div>
               
            </div>


        </div>
        <jsp:include page="footer.jsp"/>
        <script src="assets/js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
        </script>
    </body>
</html>
