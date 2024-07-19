<%-- 
    Document   : updateFAQ.jsp
    Created on : Jun 23, 2024, 9:43:34 PM
    Author     : DELL
--%>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            form {
                max-width: 600px;
                margin: auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
            }
            label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
            }
            input, textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
              button {
                padding: 10px 30px;
                border: 0;
                border-radius: 100px;
                background-color: #2ba8fb;
                color: #ffffff;
                font-weight: Bold;
                transition: all 0.5s;
                -webkit-transition: all 0.5s;
            }

            button:hover {
                background-color: #6fc5ff;
                box-shadow: 0 0 20px #6fc5ff50;
                transform: scale(1.1);
            }

            button:active {
                background-color: #3d94cf;
                transition: all 0.25s;
                -webkit-transition: all 0.25s;
                box-shadow: none;
                transform: scale(0.98);
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
    </head>
    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="DoctorSideBar.jsp"/>
            <!--  Sidebar End -->

            <!--  Main wrapper -->
            <div class="body-wrapper">
                <jsp:include page="DoctorHeader.jsp"/>
                <div class="container">
                      <h2 class="mt-3 mb-4 text-center">Cập Nhật Câu Hỏi Thường Gặp</h2>
                <form action="update-faq" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${faq.questionID}">

                    <label for="shortenedQuestion">Câu Hỏi:</label>
                    <input type="text" id="shortenedQuestion" name="shortenedQuestion" value="${faq.shortenedQuestion}" required>

                    <label for="question">Câu Hỏi Chi Tiết:</label>
                    <textarea id="question" name="question" rows="4" required>${faq.question}</textarea>

                    <label for="answer">Câu Trả Lời:</label>
                    <textarea id="answer" name="answer" rows="6" required>${faq.answer}</textarea>

                    <label for="image">Tải Ảnh Minh Họa:</label>
                    <input type="file" id="image" name="image" accept="image/*">
                    <img src="uploads/${faq.image}" alt="Current FAQ Image" width="100" height="80"></br>

                    <button type="submit" style=" border-radius: 100px;">Cập Nhật</button>
                </form
                </div>
              
            </div>>
        </div>>

    </body>
</html>
