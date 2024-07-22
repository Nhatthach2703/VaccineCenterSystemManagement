<%-- 
    Document   : paymentSuccess
    Created on : Jul 2, 2024, 12:44:52 PM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
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
            .card-mes {
                background-color: #fefefe; /* Màu nền nhạt */
                border: 1px solid #fafafa; /* Viền nhẹ */
                border-radius: 10px; /* Bo góc */
                box-shadow: 0 3px 10px #d4e9f7; /* Đổ bóng nhẹ */
                padding: 40px; /* Khoảng đệm bên trong */
                margin: 20px auto; /* Căn giữa */
                max-width: 600px; /* Độ rộng tối đa */
                text-align: center; /* Căn giữa văn bản */
            }

            .card-mes h1 {
                font-size: 2em; /* Kích thước chữ lớn */
                color: #3498db; /* Màu xanh lá cây để chỉ thành công */
                margin-bottom: 20px; /* Khoảng cách dưới */
            }

            .card-mes p {
                font-family: 'Tilt Neon';
                font-size: 1.2em; /* Kích thước chữ trung bình */
                color: #333; /* Màu chữ xám đậm */
                margin-bottom: 15px; /* Khoảng cách dưới */
            }

            .card-mes .btn {
                font-family: 'Tilt Neon';
                padding: 10px 20px; /* Khoảng đệm nút */
                margin: 10px 5px; /* Khoảng cách giữa các nút */
                border-radius: 5px; /* Bo góc nút */
                text-decoration: none; /* Loại bỏ gạch chân */
            }

            .card-mes .btn-primary {
                background-color: #3498db; /* Màu nền xanh dương */
                border: none; /* Loại bỏ viền */
                color: white; /* Màu chữ trắng */
            }
            .card-mes .btn-primary:hover {
                background-color: #5cace2;
                
                transform: scale(1.0);
            }

            .card-mes .btn-danger {
                font-family: 'Tilt Neon';
                background-color: #e74c3c; /* Màu nền đỏ */
                border: none; /* Loại bỏ viền */
                color: white; /* Màu chữ trắng */
                
                
            }
            .card-mes .btn-danger:hover{
                background-color: #eb6f63;
                
                transform: scale(1.0);
                
                
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container" data-aos="fade-up" style="margin: 285px auto">
            <div class="card-mes success-message text-center">
                <h1><span><i class='bx bxs-check-circle' style="color: rgba(4, 117, 4, 0.858); margin-right: 10px;"></i></span>Giao  dịch thành công!</h1>
                <p>Cảm ơn vì đã chọn dịch vụ của chúng tôi.</p>    
                <p>Bạn có thể xem lại lịch sử mua vaccine của mình.</p>
                <div class="row">
                    <div class="col-md-6">
                        <a href="homeIndex" class="btn btn-primary mt-4">Trang chủ</a>
                    </div>
                    <div class="col-md-6">
                        <a href="ViewVaccineOrderHistoryServlet?userID=${sessionScope.user.userID}" class="btn btn-danger mt-4">Lịch sử mua vaccine</a>
                    </div>
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
    </body>
</html>
