<%-- 
    Document   : createNews
    Created on : Jun 24, 2024, 8:37:54 PM
    Author     : DELL
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                font-family: 'Tilt Neon', Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f9f9f9;
                color: #333;
            }
            .container1 {
                margin:30px 0px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .form-container {
                max-width: 600px;
                padding: 30px;
                margin-top: 20px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
                margin-bottom: 20px;
                padding-bottom: 20px;
                padding-top: 20px;
            }
            label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
            }
            input, textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            button {
                padding-top: 10px;
                padding: 10px;
                color: white;
                background: rgb(43, 166, 220);
                border: none;
                border-radius: 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo Tin Tức</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="assets/img/favicon.png" rel="icon" />
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />
        <link href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap" rel="stylesheet" />
        <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <link rel="stylesheet" href="assets/css/Admin_CreateUpdateVaccine.css"/>
    </head>
    <body>
        

        <h2>TẠO TIN TỨC</h2>

        <div class="container1">
            <div class="form-container" data-aos="fade-up">
                <form action="create-news" method="post" enctype="multipart/form-data">
                    <label for="title">Tiêu Đề:</label>
                    <input type="text" id="title" name="title" required>

                    <label for="content">Nội Dung:</label>
                    <textarea id="content" name="content" rows="6" required></textarea>

                    <label for="image">Tải Ảnh Minh Họa:</label>
                    <input type="file" id="image" name="image" accept="image/*">

                    <button type="submit">Tạo</button>
                </form>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>

<script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
            CKEDITOR.replace('content');
        </script>
    </body>
</html>
