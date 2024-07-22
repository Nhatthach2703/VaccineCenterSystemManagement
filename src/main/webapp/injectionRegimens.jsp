<%-- 
    Document   : injectionRegimens
    Created on : Jun 7, 2024, 10:30:38 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />


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


    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />


    <head>
        <meta charset="UTF-8">
        <title>THDAP</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                color: #333;
            }
            h2 {
                color: #007acc;
                border-bottom: 2px solid #007acc;
                padding-bottom: 5px;
                width: 80%;
                margin: 20px auto 10px;
                margin-top: 30px

            }
            h1 {
                color: #000000; /* Đổi màu chữ thành màu đen */
                font-weight: 700; /* In đậm chữ */
                padding-bottom: 5px;
                max-width: 800px;
                margin: 20px auto 10px;
                margin-top: 30px;
                text-align: center; /* Căn giữa nội dung của h1 */
            }

            
            table {
                width: 80%;
               
                margin: 0 auto 30px;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s, box-shadow 0.3s;
                margin-top: 30px;
                margin-bottom: 100px;
                
            }
         
            th, td {
                padding: 12px 15px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #8EACCD;
                color: #fff;
                font-weight: bold;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #D2E0FB;
            }
        </style>
    </head>
    <body>

        <!-- ======= Header ======= -->
       

        <!-- End Hero -->
        <div class="container-fluid">
             <jsp:include page="header.jsp"/>
            <div style="margin-top: 10%">
                 <h1>PHÁT ĐỒ TIÊM CHỦNG</h1>
                <c:forEach var="entry" items="${regimensMap}">
                    <h2> ${entry.key}</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Vắc xin</th>
                                <th>Độ Tuổi</th>
                                <th>Nội Dung</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="regimen" items="${entry.value}">
                                <tr>  <td>${regimen.diseasePreventionVaccine}</td>
                                    <td>${regimen.ageMilestone}</td>
                                    <td>${regimen.content}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:forEach>
            </div>
           
        </div>
             <jsp:include page="footer.jsp"/>

            

      
        <!-- Vendor JS Files -->
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