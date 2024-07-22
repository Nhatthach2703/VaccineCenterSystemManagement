<%-- 
    Document   : TypeOfVaccine
    Created on : May 23, 2024, 9:35:04 AM
    Author     : ADMIN
--%>

<%@page import="com.thdap.vaccine.model.Vaccine"%>
<%@page import="java.util.List"%>
<%@page import="com.thdap.vaccine.dao.VaccineDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>THDAP</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />
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
    <link href="assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="./assets/css/TypeOfVaccine.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <link rel="stylesheet" href="./assets/css/VaccineDetail.css"/>
<!--    <style>
        .sidebar {
    
    position: sticky;
    top: 14%; /* Adjust this value as needed */
   
}
    </style>-->
    <body>
        <div class="container-fluid">
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
                            <img
                                src="./assets/img/banner_vaccinedetail.png"
                                class="img-fluid animated"
                                alt=""
                                />
                        </div>
                    </div>
                </div>
            </section>


            <!--=========================banner==========================================-->
            <div class="container">

                <h1  class="vaccine-value mt-5">${vaccine.name} (${vaccine.source})</h1>
            </div>
            
            <div class=" row mt-5 mb-5 "data-aos="fade-up" data-aos-delay="800">
                
                <div class=" col-sm-4 fixed-sidebar"style="width:18rem;margin-left:7% ">
                    <div class="sidebar">
                        
                        <a class="btn btn-light mb-4 rounded-4" href="#contraindicated"><p>1. Chống chỉ định</p></a><br>
                        <a class="btn btn-light mb-4 rounded-4" href="#drugInteractions"><p>2. Tương tác thuốc</p></a><br>
                        <a class="btn btn-light mb-4 rounded-4" href="#objectOfUse"><p>3. Đối tượng</p></a><br>
                        <a class="btn btn-light mb-4 rounded-4" href="#injectionRegimen"><p>4. Phác đồ tiêm</p></a><br>
                        <a class="btn btn-light mb-4 rounded-4" href="#price"><p>5. Xem bảng giá</p></a><br>
                        <a class="btn btn-light mb-4 rounded-4" href="#injectionRegimen"><p>6. Một số câu hỏi thường gặp</p></a><br>
                        <a class="btn btn-light mb-4 rounded-4" href="#vaccine"><p>7. Các loại vaccine khác</p></a><br>
                    

                    </div>
                       

                </div>
                <div class="card p-4 col-sm-8 card_inforDetail" style="width: 60rem ;border-width: 3px; border-color: black" data-aos="fade-up" data-aos-delay="1000">
                    <div class="mb-3 mt-3 ">
                        <h2 class="text-center rounded-4 pt-3 pb-3">Thông tin Vaccine</h2>
                    </div>
                    <div class="card-body ">

                        <div>

                            <p id="summary" class="vaccine-value text-justify">${vaccine.summary}</p>
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

                            <img src="uploads/${vaccine.image}" alt="Image" class="vaccine-image">
                        </div>
                        <div>
                            <label class="vaccine-label">Lộ trình tiêm</label>
                            <p class="vaccine-value">${vaccine.injectionRoute}</</p>
                        </div>
                        <div>
                            <label id="contraindicated" class="vaccine-label">Chống chỉ định</label>
                            <p class="vaccine-value">${vaccine.contraindicated}</p>
                        </div>
                        <div>
                            <label class="vaccine-label text-justify">Hướng dẫn sử dụng</label>
                            <p class="vaccine-value">${vaccine.usingNote}</p>
                        </div>
                        <div>
                            <label id="drugInteractions" class="vaccine-label">Tương tác thuốc</label>
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
                            <label id="objectOfUse" class="vaccine-label">Đối tượng sử dụng</label>
                            <p class="vaccine-value">${vaccine.objectOfUse}</p>
                        </div>
                        <div>
                            <label id="injectionRegimen" class="vaccine-label">Phác đồ tiêm</label>
                            <p class="vaccine-value">${vaccine.injectionRegimen}</p>
                        </div>
                        <div>
                            <label id="price" class="vaccine-label">Giá</label>
                            <p class="vaccine-value">${vaccine.price}</p>
                        </div>
                    </div> 
                </div>

            </div>

            <div class="slide-container pt-4 pb-4 container text-center mb-5"id="vaccine">
                <div class="slide-content swiper mySwiper mt-5 mb-4">
                    <div class="card-wrapper swiper-wrapper ">
                        <c:forEach var="vaccine" items="${vaccines}">

                            <div class="card h-100 p-3 swiper-slide"style="width: 25rem;border-width: 2px;border-color: black">

                                <a href="VaccineDetailsServlet?vaccineID=${vaccine.vaccineID}">

                                    <div class="image-content">


                                        <img class="card-img-top" src="uploads/${vaccine.image}" alt="Vaccine Image" width="400" height="180"/>

                                    </div>
                                    <div class="card-content mt-2">
                                        <h4 class="title" style="font-family: 'Tilt Neon', sans-serif">${vaccine.name}</h4>               
                                        <p class="description">Nguồn gốc: ${vaccine.source}</p>
                                        <p class="description text-justify text-dark">${fn:substring(vaccine.summary, 0, 200)}<span>...</span></p>
                                    </div>
                                </a>

                            </div>

                        </c:forEach>
                    </div>

                    <div class="swiper-button-next swiper-navBtn"></div>
                    <div class="swiper-button-prev swiper-navBtn"></div>
                    <div class="swiper-pagination"></div>    
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
        <script>
            var swiper = new Swiper(".mySwiper", {
                slidesPerView: 3,
                spaceBetween: 20,
                loop: true,
                centerSlide: 'true',
                fade: 'true',
                grabCursor: 'true',
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                    dynamicBullets: true,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                breakpoints: {
                    0: {
                        slidesPerView: 1,
                    },
                    520: {
                        slidesPerView: 2,
                    },
                    950: {
                        slidesPerView: 3,
                    },

                },
            });

        </script>
        <script src="js/extention/choices.js"></script>
    </body>
</html>
