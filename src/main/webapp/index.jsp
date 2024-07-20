<%-- Document : index Created on : May 18, 2024, 9:51:00 AM Author : DELL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>THDAP</title>
  
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
    <link rel="stylesheet" href="./assets/css/homeIndex.css"/>
    <link rel="stylesheet" href="./assets/css/ServiceReview.css"/>

    <!-- =======================================================
      * Template Name: Vesperr
      * Template URL: https://bootstrapmade.com/vesperr-free-bootstrap-template/
      * Updated: Mar 17 2024 with Bootstrap v5.3.3
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->

    <body>
        <!-- ======= Header ======= -->
        <jsp:include page="header.jsp"/>
        <jsp:include page="banner.jsp"/>
        <!-- End Hero -->

        <main id="main">
            <!-- ======= Clients Section ======= -->
            <section id="clients" class="clients clients">
                <div class="container">
                    <div class="row" data-aos="zoom-in">
                        <div class="col-lg-2 col-md-4 col-6">
                            <img
                                src="assets/img/clients/unicef.png"
                                class="img-fluid"
                                style="width: 37%"
                                alt=""

                                />
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img
                                src="assets/img/clients/Logo-Long-Chau.png"
                                class="img-fluid"
                                alt=""
                                style="width: 40%"

                                />
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img
                                src="assets/img/clients/vnvc-logo-h.png"
                                class="img-fluid"
                                alt=""
                                style="width: 60%"

                                />
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img
                                src="assets/img/clients/johnson-johnson-logo.png"
                                class="img-fluid"
                                style="width: 80%"
                                alt=""

                                />
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img
                                src="assets/img/clients/Pfizer.png"
                                class="img-fluid"
                                alt=""
                                style="width: 40%"

                                />
                        </div>

                        <div class="col-lg-2 col-md-4 col-6">
                            <img
                                src="assets/img/clients/astrazeneca-logo.png"
                                class="img-fluid mb-2"
                                alt=""
                                style="width: 60%"

                                />
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Clients Section -->

            <!-- ======= About Us Section ======= -->
            <section id="about" class="about">
                <div class="container">
                    <div class="section-title" data-aos="fade-up">
                        <h2>Giới thiệu</h2>
                    </div>

                    <div class="row content">
                        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="150">
                            <p>
                                Trung tâm tiêm chủng THDAP là cơ sở y tế cộng đồng được tổ chức
                                để cung cấp dịch vụ tiêm chủng cho cộng đồng. Hệ thống trung tâm
                                tiêm chủng của chúng tôi với trách nhiệm quan trọng trong việc
                                bảo vệ sức khỏe của cộng đồng bằng cách cung cấp và quản lý các
                                loại vắc xin để phòng ngừa các bệnh truyền nhiễm.
                            </p>
                            <ul>
                                <li><i class="ri-check-double-line"></i>An toàn</li>
                                <li><i class="ri-check-double-line"></i>Chất lượng</li>
                                <li><i class="ri-check-double-line"></i>Uy tín</li>
                                <li><i class="ri-check-double-line"></i>Tận tâm</li>
                            </ul>
                        </div>
                        <div
                            class="col-lg-6 pt-4 pt-lg-0"
                            data-aos="fade-up"
                            data-aos-delay="300"
                            >
                            <p>
                                Dịch vụ tiêm chủng: Trung tâm tiêm chủng cung cấp dịch vụ tiêm
                                chủng cho các loại vắc xin cần thiết, bao gồm cả các vắc xin
                                phòng ngừa bệnh trẻ em như vắc xin phòng viêm gan B, vắc xin
                                phòng viêm gan A, vắc xin phòng viêm màng não, vắc xin phòng
                                viêm cúm, và các loại vắc xin khác dành cho người lớn.
                            </p>

                        </div>
                    </div>
                </div>
            </section>
            <!-- End About Us Section -->

            <!-- ======= Counts Section ======= -->

            <!--            </div>-->
            <section id="testimonials" class="testimonials section-bg">
                <div class="container">
                    <div class="section-title" data-aos="fade-up">
                        <h2>Vaccine</h2>

                    </div>

                    <div
                        class="testimonials-slider swiper"
                        data-aos="fade-up"
                        data-aos-delay="100">
                        <div class="swiper-wrapper">
                            <c:forEach var="vaccines" items="${vaccine}">

                                <div class="card h-100 p-3 swiper-slide"style="width: 25rem;border-width: 2px;border-color: black">

                                    <a href="VaccineDetailsServlet?vaccineID=${vaccines.vaccineID}">

                                        <div class="image-content">


                                            <img class="card-img-top" src="uploads/${vaccines.image}" alt="Vaccine Image" width="50" height="200"/>

                                        </div>
                                        <div class="card-content mt-2">
                                            <h4 class="title" style="font-family: 'Tilt Neon', sans-serif;font-weight: bold">${vaccines.name}</h4>               
                                            <p class="description">Nguồn gốc: ${vaccines.source}</p>
                                            <p class="description text-justify text-dark" style="text-align: left">${fn:substring(vaccines.summary, 0, 200)}<span>...</span></p>
                                        </div>
                                    </a>

                                </div>

                            </c:forEach>

                        </div>
                         <div class="swiper-pagination"></div>
                    </div>
                    
                </div>
            </section>

            <section id="more-services" class="more-services">
                <div class="container">
                    <div class="row">
                        <c:forEach items="${listNews}" var="o">
                            <div class="col-md-6 d-flex align-items-stretch mt-4">
                                <div
                                    class="card"
                                    style="background-image: url('uploads/${o.image}')"
                                    data-aos="fade-up"
                                    data-aos-delay="100"
                                    >
                                    <div class="card-body">
                                        <h5 class="card-title"><a href="">${o.title}</a></h5>

                                        <p class= "card-text">${fn:substring(o.content, 0, 250)}<span>...</span></p>
                                        <div class="read-more">
                                            <a href="viewnewsevlet?idnew=${o.newID}"><i class="bi bi-arrow-right"></i>Xem tin</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


            </section>
            <!-- End Features Section -->

            <!-- ======= Testimonials Section ======= -->
            <section id="testimonials" class="testimonials section-bg">
                <div class="container">
                    <div class="section-title" data-aos="fade-up">
                        <h2>Đánh giá dịch vụ</h2>

                    </div>

                    <div
                        class="testimonials-slider swiper"
                        data-aos="fade-up"
                        data-aos-delay="100"
                        >
                        <div class="swiper-wrapper">
                            <c:forEach var="review" items="${serviceReviews}">
                                <div class="swiper-slide">
                                    <div class="testimonial-wrap">
                                        <div class="testimonial-item">
                                            <c:forEach var="user" items="${users}">
                                                <c:if test="${user.userID == review.userID}">
                                                    <c:if test="${empty user.image}">
                                                        <img
                                                            src="uploads/stockAvata.png"
                                                            alt="user Avatar"
                                                            class="testimonial-img"
                                                            />
                                                    </c:if>
                                                    <c:if test="${not empty user.image}">
                                                        <img
                                                            src="uploads/${user.image}"
                                                            alt="user Avatar"
                                                            class="testimonial-img"
                                                            />
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>

                                            <c:forEach var="user" items="${users}">
                                                <c:if test="${user.userID == review.userID}">
                                                    <c:forEach var="account" items="${accounts}">
                                                        <c:if test="${user.accountID == account.accountID}">
                                                            <h3>${account.username}</h3>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>

                                            <h4><strong>Loại:</strong> ${review.getType()}</h4>
                                            <div class="col-md-8">

                                                <div class="rating">
                                                    <input type="radio" id="star5-${review.reviewID}" name="rating-${review.reviewID}" value="5" ${review.rate == 5 ? 'checked' : ''} disabled>
                                                    <label for="star5-${review.reviewID}"></label>
                                                    <input type="radio" id="star4-${review.reviewID}" name="rating-${review.reviewID}" value="4" ${review.rate == 4 ? 'checked' : ''} disabled>
                                                    <label for="star4-${review.reviewID}"></label>
                                                    <input type="radio" id="star3-${review.reviewID}" name="rating-${review.reviewID}" value="3" ${review.rate == 3 ? 'checked' : ''} disabled>
                                                    <label for="star3-${review.reviewID}"></label>
                                                    <input type="radio" id="star2-${review.reviewID}" name="rating-${review.reviewID}" value="2" ${review.rate == 2 ? 'checked' : ''} disabled>
                                                    <label for="star2-${review.reviewID}"></label>
                                                    <input type="radio" id="star1-${review.reviewID}" name="rating-${review.reviewID}" value="1" ${review.rate == 1 ? 'checked' : ''} disabled>
                                                    <label for="star1-${review.reviewID}"></label>
                                                </div>
                                                <p>${review.content}</p>                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- End testimonial item -->


                            <!-- End testimonial item -->
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </section>
            <!-- End Testimonials Section -->


            <!-- ======= Team Section ======= -->
            <section id="team" class="team section-bg">
                <div class="container mt-5">
                    <div class="section-title" data-aos="fade-up">
                        <h2>THÔNG TIN CHUYÊN GIA</h2>
                        <p>Những người bảo vệ sức khỏe với chuyên môn vững vàng và lòng nhiệt huyết.</p>
                    </div>

                    <div class="row g-4">
                        <c:forEach var="doctor" items="${doctors}">
                            <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                                <div class="member" data-aos="fade-up" data-aos-delay="100">
                                    <div class="member-img">
                                        <c:if test="${empty doctor.image}">
                                            <img
                                                src="uploads/stockAvata.png"
                                                alt="Doctor Avatar"
                                                class="img-fluid"
                                                />
                                        </c:if>
                                        <c:if test="${not empty doctor.image}">
                                            <img
                                                src="uploads/${doctor.image}"
                                                alt="Doctor Avatar"
                                                class="img-fluid"
                                                />
                                        </c:if>
                                        <div class="social">
                                            <a href=""><i class="bi bi-twitter"></i></a>
                                            <a href=""><i class="bi bi-facebook"></i></a>
                                            <a href=""><i class="bi bi-instagram"></i></a>
                                            <a href=""><i class="bi bi-linkedin"></i></a>
                                        </div>
                                    </div>
                                    <div class="member-info">
                                        <h4>${doctor.fullName}</h4>
                                        <span>${doctor.jobTitle}</span>
                                        <p>${doctor.degreeType}</p>
                                        <c:forEach var="workLocation" items="${workLocations}">
                                            <c:if test="${doctor.workLocationID == workLocation.workLocationID}">
                                                <p>${workLocation.name}</p>

                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- End Team Section -->
            <!-- ======= F.A.Q Section ======= -->


            <!-- ======= Contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container">
                    <div class="section-title" data-aos="fade-up">
                        <h2>Contact Us</h2>
                    </div>

                    <div class="row">
                        <div
                            class="col-lg-4 col-md-6"
                            data-aos="fade-up"
                            data-aos-delay="100"
                            >
                            <div class="contact-about">
                                <h3>THDAP</h3>
                                <p>
                                    We are committed to supporting the community by providing
                                    educational materials, vaccination guides, vaccination
                                    schedules, and the latest disease and vaccine news.
                                </p>
                                <div class="social-links">
                                    <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                                    <a href="#" class="facebook"
                                       ><i class="bi bi-facebook"></i
                                        ></a>
                                    <a href="#" class="instagram"
                                       ><i class="bi bi-instagram"></i
                                        ></a>
                                    <a href="#" class="linkedin"
                                       ><i class="bi bi-linkedin"></i
                                        ></a>
                                </div>
                            </div>
                        </div>

                        <div
                            class="col-lg-3 col-md-6 mt-4 mt-md-0"
                            data-aos="fade-up"
                            data-aos-delay="200"
                            >
                            <div class="info">
                                <div>
                                    <i class="ri-map-pin-line"></i>
                                    <p>Da Nang</p>
                                </div>

                                <div>
                                    <i class="ri-mail-send-line"></i>
                                    <p>TrungTamTiemTHDAP@gmail.com</p>
                                </div>

                                <div>
                                    <i class="ri-phone-line"></i>
                                    <p>012345678</p>
                                </div>
                            </div>
                        </div>

                        <div
                            class="col-lg-5 col-md-12"
                            data-aos="fade-up"
                            data-aos-delay="300"
                            >
                            <form
                                action="forms/contact.php"
                                method="post"
                                role="form"
                                class="php-email-form"
                                >
                                <div class="form-group">
                                    <input
                                        type="text"
                                        name="name"
                                        class="form-control"
                                        id="name"
                                        placeholder="Your Name"
                                        required
                                        />
                                </div>
                                <div class="form-group">
                                    <input
                                        type="email"
                                        class="form-control"
                                        name="email"
                                        id="email"
                                        placeholder="Your Email"
                                        required
                                        />
                                </div>
                                <div class="form-group">
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="subject"
                                        id="subject"
                                        placeholder="Subject"
                                        required
                                        />
                                </div>
                                <div class="form-group">
                                    <textarea
                                        class="form-control"
                                        name="message"
                                        rows="5"
                                        placeholder="Message"
                                        required
                                        ></textarea>
                                </div>
                                <div class="my-3">
                                    <div class="loading">Loading</div>
                                    <div class="error-message"></div>
                                    <div class="sent-message">
                                        Your message has been sent. Thank you!
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button type="submit">Send Message</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Contact Section -->
        </main>
        <!-- End #main -->

        <!-- ======= Footer ======= -->
        <jsp:include page="footer.jsp"/>
        <!-- End Footer -->

        <a
            href="#"
            class="back-to-top d-flex align-items-center justify-content-center"
            ><i class="bi bi-arrow-up-short"></i
            ></a>

        <!-- Vendor JS Files -->
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
