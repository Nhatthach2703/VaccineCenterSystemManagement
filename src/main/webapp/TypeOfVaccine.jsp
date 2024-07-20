<%-- 
    Document   : TypeOfVaccine
    Created on : May 23, 2024, 9:35:04 AM
    Author     : ADMIN
--%>

<%@page import="com.thdap.vaccine.model.Vaccine"%>
<%@page import="java.util.List"%>
<%@page import="com.thdap.vaccine.dao.VaccineDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
     <style>
        .pagination a {
            padding: 8px 16px;
            margin: 0 4px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-decoration: none;
            color: #007bff;
        }

        .pagination a.active {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }

        .pagination a:hover {
            background-color: #ddd;
        }

        .card-img {
            max-width: 100%;
            height: auto;
        }
    </style>

<body>
    <div class="container-fluid" data-aos="fade-down">
        <jsp:include page="header.jsp"/>

        <!-- Type of Vaccine -->
        <div class="wapper mt-5">
            <div class="slide-container pt-4 pb-4 border border-dark rounded-4 p-3">
                <h1 class="text-center mb-5" style="font-family: 'Tilt Neon', sans-serif; color: rgb(55,153,220)">Thông tin sản phẩm Vaccine</h1>
                <div class="card-title">
                    <form action="TypeOfVaccineServlet" method="post">
                        <div class="basic-search text-center search-wrapper" id="searchWrapper" style="height: 200px">
                            <div class="container input-field">
                                <input class="rounded-pill" type="text" name="searchValue" id="searchValue" placeholder="Tìm kiếm" value="${param.searchValue}">
                                <div class="icon-wrap">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                        <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                                    </svg>
                                </div>
                            </div>
                            <div id="searchDropdowns" class="search-dropdowns">
                                <!-- Dropdowns for vaccine types and sources -->
                                <div class="container px-4 text-center mt-4" style="width: 90%">
                                    <div class="row gx-5">
                                        <div class="col">
                                            <select class="p-3 form-select form-select-sm rounded-4" name="typeName" id="typeName">
                                                <option value="">--Loại Vaccine--</option>
                                                <c:forEach items="${typeOfVaccines}" var="type">
                                                    <option value="${type.name}" ${type.name == param.typeName ? 'selected' : ''}>${type.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <select class="p-3 form-select form-select-sm rounded-4" name="source" id="source">
                                                <option value="">--Nguồn gốc--</option>
                                                <c:forEach items="${uniqueSources}" var="source">
                                                    <option value="${source}" ${source == param.source ? 'selected' : ''}>${source}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mt-4 d-flex justify-content-end">
                                        <input class="search" type="submit" value="Tìm">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="slide-content swiper mySwiper mt-3 mb-5">
                    <div class="card-wrapper swiper-wrapper">
                        <c:forEach var="typeOfVaccines" items="${typeOfVaccines}">
                            <div class="swiper-slide">
                                <a href="TypeOfVaccineServlet?typeID=${typeOfVaccines.typeID}">
                                    <div class="image-content">
                                        <div class="card-image">
                                            <img src="./assets/img/Business_1645_2_Converted.png" class="card-img"/>
                                        </div>
                                    </div>
                                    <div class="card-content">
                                        <p class="name">${typeOfVaccines.name}</p>
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

        <!-- Vaccine List -->
        <div class="container mt-5" data-aos="fade-up">
            <div class="row row-cols-1 row-cols-md-3 g-5">
                <c:forEach var="vaccine" items="${vaccines}">
                    <div class="col mb-4" data-aos-delay="800">
                        <div class="card h-100 p-3" style="width: 25rem; border-width: 2px; border-color: black">
                            <a href="VaccineDetailsServlet?vaccineID=${vaccine.vaccineID}">
                                <div class="card-body icon-box" data-aos-delay="100" style="color: black">
                                    <img class="card-img-top" src="uploads/${vaccine.image}" alt="Vaccine Image" width="300" height="180"/>
                                    <h4 class="title" style="font-family: 'Tilt Neon', sans-serif">${vaccine.name}</h4>
                                    <p class="description">Nguồn gốc: ${vaccine.source}</p>
                                    <p class="description">${fn:substring(vaccine.summary, 0, 200)}<span>...</span></p>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- Pagination -->
            <div class="pagination">
                <c:if test="${pageNum > 1}">
                    <a href="?page=${pageNum - 1}">&laquo; Previous</a>
                </c:if>
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <a href="?page=${i}" class="${i == pageNum ? 'active' : ''}">${i}</a>
                </c:forEach>
                <c:if test="${pageNum < totalPages}">
                    <a href="?page=${pageNum + 1}">Next &raquo;</a>
                </c:if>
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
    <script src="assets/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    
    <script>
        AOS.init();
    </script>
    
    <script>
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 4,
            spaceBetween: 25,
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
                1200: {
                    slidesPerView: 4,
                },
            },
        });
    </script>
    
    <script src="js/extention/choices.js"></script>
    <script>
        const customSelects = document.querySelectorAll("select");
        const deleteBtn = document.getElementById('delete');
        const choices = new Choices('select', {
            searchEnabled: false,
            itemSelectText: '',
            removeItemButton: true,
        });

        for (let i = 0; i < customSelects.length; i++) {
            customSelects[i].addEventListener('addItem', function (event) {
                let parent = this.parentNode.parentNode;
                if (event.detail.value) {
                    parent.classList.add('valid');
                    parent.classList.remove('invalid');
                } else {
                    parent.classList.add('invalid');
                    parent.classList.remove('valid');
                }
            }, false);
        }

        deleteBtn.addEventListener("click", function (e) {
            e.preventDefault();
            const deleteAll = document.querySelectorAll('.choices__button');
            for (let i = 0; i < deleteAll.length; i++) {
                deleteAll[i].click();
            }
        });
    </script>
    
</body>
</html>