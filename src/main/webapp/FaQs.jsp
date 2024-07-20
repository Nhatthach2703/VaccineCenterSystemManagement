<%-- 
    Document   : CreateVaccine
    Created on : May 23, 2024, 3:50:38 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Câu Hỏi Thường Gặp</title>
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
        <<link rel="stylesheet" href="assets/css/New.css"/>
    </head>
    <style>
        body{
            background-color: white;
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="main container-fluid"style="margin-top: 6%" data-aos="zoom-in">
            <!-- Sing in  Form -->

            <h1 style="font-weight: 700; font-family:Tilt Neon; padding-top: 3rem ; " class="form-title text-center mt-5">Danh Sách Câu Hỏi Thường Gặp</h1>

            <div class="row row-cols-1 row-cols-md-3 g-4 p-3 mb-5 mt-2">
                <c:forEach var="faq" items="${faqList}">
                    <div class="col">
                        <div class="card h-100" style="boder-radius: 1rem">

                            <img src="uploads/${faq.image}"  style=" object-fit: cover; position: relative;
                                 width: 100%" class="card-img-top" alt="${faq.shortenedQuestion}">  
                            <div class="card-body">
                                <h3>${faq.shortenedQuestion}</h3>
                                <button  class="button"  style="position: relative;
                                         overflow: hidden;
                                         height: 2rem;
                                         padding: 0 1.5rem;
                                         border-radius: 1rem;
                                         background: #3d3a4e;
                                         background-size: 400%;
                                         color: #fff;
                                         border: none;
                                         cursor: pointer;" >
                                    <a href="ViewFaQsSevlet?questionID=${faq.questionID}"><span class="button-content"  style="position: relative;color: #ffffff;
                                                                                                z-index: 1;" >Trả Lời</span></a>
                                    <style>
                                        .button:hover::before {
                                            transform: scaleX(1);
                                        }

                                        .button::before {
                                            content: "";
                                            position: absolute;
                                            top: 0;
                                            left: 0;
                                            transform: scaleX(0);
                                            transform-origin: 0 50%;
                                            width: 100%;
                                            height: inherit;
                                            border-radius: inherit;
                                            background: linear-gradient(90deg, rgba(99,249,255,1) 0%, rgba(52,152,219,1) 33%);
                                            transition: all 0.475s;
                                        }
                                    </style>   
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </section>

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
