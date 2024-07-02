<%-- 
    Document   : CRUDNews
    Created on : Jun 24, 2024, 3:43:18 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html><%@ page import="com.thdap.vaccine.model.News" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>Danh sách Tin Tức</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
        <link href="assets/css/style.css" rel="stylesheet" />
        <style>
            .table-title {
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0 0;
            }
            .btn-secondary {
                background-color: white;
                color: black;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <div class="container-xl mt-5" data-aos="fade-up">
            <div class="table-wrapper">
                <div class="table-title pt-3 pb-3">
                    <div class="row">
                        <div class="col-sm-5">
                            <h2 class="ml-4">Danh sách Tin Tức</h2>
                        </div>
                        <div class="col-sm-7">
                            <div style="text-align: right" class="mr-4">
                                <a href="/Vaccine/create-news" class="btn btn-secondary">
                                    <span>Thêm Tin Tức</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Tiêu Đề</th>
                            <th>Ảnh</th>
                            <th>Nội Dung</th>
                            <th>Bác Sĩ</th>
                            <th>Ngày</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="news" items="${newsList}">
                            <tr>
                                <td>${news.title}</td>
                                <td><img src="uploads/${news.image}" alt="News Image" width="100" height="80" /></td>
                                <td>${news.content}</td>
                                <td><c:forEach var="doctor" items="${doctors}">
                                        <c:if test="${doctor.doctorID == news.doctorID}">
                                            ${doctor.fullName}
                                        </c:if>
                                    </c:forEach></td>
                                <td>${news.date}</td>
                                <td>
                                    <a href="update-news?id=${news.newID}" class="settings" title="Edit" data-toggle="tooltip">
                                        <i class="material-icons" style="color: red">edit</i>
                                    </a>
                                    <a href="delete-news?id=${news.newID}" onclick="return confirm('Are you sure?')" class="delete" title="Delete" data-toggle="tooltip">
                                        <i class="material-icons">delete</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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
    </body>
</html>

