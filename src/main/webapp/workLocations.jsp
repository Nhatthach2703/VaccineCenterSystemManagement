<%-- 
    Document   : workLocations
    Created on : Jun 26, 2024, 11:45:05 PM
    Author     : Tran HaF
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <link rel="stylesheet" href="./assets/css/worklocation.css"/>
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel" style="margin-top: 150px;">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="4" aria-label="Slide 5"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <img src="./assets/img/worklocation/slide1.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="./assets/img/worklocation/slide2.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="./assets/img/worklocation/slide3.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="./assets/img/worklocation/slide4.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="./assets/img/worklocation/slide5.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <div class="container">
            <div class="row img_highlight vvvv">
                <div class="col-xs-6 col-sm-4 wrap_item_image_httc">
                    <img  class="img-responsive img_highlight_httc lazyload " style="width: 100%; margin: 30px 0px;" src="./assets/img/worklocation/intro1.png"/>
                </div>




                <div class="col-xs-6 col-sm-4 wrap_item_image_httc">
                    <img  class="img-responsive img_highlight_httc lazyload" style="width: 100%; margin: 30px 0px;" src="./assets/img/worklocation/intro2.png"/>
                </div>




                <div class="col-xs-6 col-sm-4 wrap_item_image_httc">
                    <img  class="img-responsive img_highlight_httc lazyload" style="width: 100%; margin: 30px 0px;" src="./assets/img/worklocation/intro3.png"/>
                </div>




                <div class="col-xs-6 col-sm-4 wrap_item_image_httc">
                    <img  class="img-responsive img_highlight_httc lazyload" style="width: 100%; margin: 30px 0px;" src="./assets/img/worklocation/intro4.png"/>
                </div>




                <div class="col-xs-6 col-sm-4 wrap_item_image_httc">
                    <img  class="img-responsive img_highlight_httc lazyload" style="width: 100%; margin: 30px 0px;" src="./assets/img/worklocation/intro5.png"/>
                </div>




                <div class="col-xs-6 col-sm-4 wrap_item_image_httc">
                    <img  class="img-responsive img_highlight_httc lazyload" style="width: 100%; margin: 30px 0px;" src="./assets/img/worklocation/intro6.png"/>
                </div>




            </div>


            <div class="row intro_page_httc">
                <div class="col-xs-12 col-sm-12">
                    <p class="intro_httc" style="font-family:'Tilt Neon', sans-serif;"> <p>Là trung tâm tiêm chủng cho trẻ em và người lớn chất lượng hàng đầu, VNVC đang mở rộng hệ thống các trung tâm giúp mang chất lượng dịch vụ tốt nhất với giá cực kỳ ưu đãi đến người dân trên khắp cả nước. Tại hệ thống tiêm chủng VNVC, chúng tôi luôn mong muốn đem lại sự thuận tiện, thoải mái và yên tâm cho khách hàng.<br />
                        Khách hàng sẽ được Bác sĩ chuyên khoa kiểm tra sức khỏe và tư vấn các mũi tiêm phù hợp với lứa tuổi.<br />
                        Đội ngũ điều dưỡng được đào tạo chuyên biệt về tiêm chủng cùng với sự chu đáo và nhiệt tình chăm sóc trẻ.<br />
                        Phòng tiêm với đầy đủ các trang thiết bị y tế đạt chuẩn cao cấp. Không gian phòng chờ trước tiêm và sau tiêm rộng rãi, thoáng mát, đầy màu sắc cuốn hút, tạo sự thân thiện với trẻ.</p>
                    <div id="top_line"></div>
                    <p>Ngoài ra mẹ và bé còn có khu vực riêng cho con bú, phòng thay tã, phòng pantry… để con được thoải mái như đang ở nhà.<br />
                        Với cơ sở vật chất và chất lượng dịch vụ 5 sao, giá vắc xin tại VNVC cực kỳ cạnh tranh và đặc biệt, chỉ tính phí vắc xin, các tiện ích kèm theo đều được miễn phí như: khám sàng lọc trước tiêm, gửi xe, khu vui chơi, nước uống, wifi, các phòng riêng cho mẹ và bé...</p>
                    </p>
                </div>
            </div>
            <div class="card-container">
                <div class="row">
                    <div class="col-md-6">
                        <c:forEach var="o" items="${workLocations}">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">${o.name}</h5>
                                    <p class="card-text">Địa chỉ: ${o.address}</p>
                                    <p class="card-text">Giờ làm việc:</p>
                                    <ul class="list-unstyled">
                                        <li>Thứ 2 đến 6: Từ 7h30 đến 17h00</li>
                                        <li>Thứ 7 & CN: Từ 7h00 đến 17h00</li>
                                    </ul>
                                    <button class="btn btn-primary" onclick="viewMap('${o.map}')">Xem trên map</button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-md-6">
                        <div id="map-container" class="card">
                            <iframe id="map-frame" width="100%" height="510px" frameborder="0" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
            </div>    

            <jsp:include page="footer.jsp"/>
            <script>
                function viewMap(mapUrl) {
                    document.getElementById('map-frame').src = mapUrl;
                }
                document.addEventListener("DOMContentLoaded", function () {
                    const defaultMapUrl = "${defaultLocation.map}";
                    document.getElementById('map-frame').src = defaultMapUrl;
                });
            </script>
        </script>
        <script src="./assets/js/worklocation.js"></script>
        <script src="./assets/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
