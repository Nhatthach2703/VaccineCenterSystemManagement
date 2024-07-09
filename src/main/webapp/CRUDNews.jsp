<%-- 
    Document   : CreateTypeOfVaccine
    Created on : May 23, 2024, 9:30:31 PM
    Author     : ADMIN
--%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" /> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">   
        <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
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

    </head>


    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="DoctorSideBar.jsp"/>
            <!--  Sidebar End -->
            <jsp:include page="DoctorHeader.jsp"/>
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <div class="container-xl" data-aos="fade-up">
                    <div class="table-wrapper">
                        <div class="table-title pt-3 pb-3">
                            <div class="row">
                                <div class="col-sm-5">
                                    <h2 class="ml-4" style=" font-family: 'Tilt Neon';font-weight: 700;color: white; margin-left: 2rem;">Danh sách Tin Tức</h2>
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

                                        <td>${news.date}</td>
                                        <td>
                                            <a href="update-news?id=${news.newID}" class="settings" title="Edit" data-toggle="tooltip">
                                                <i class="fas fa-edit" style="margin:0 7px; color:#299BE4;"></i>
                                            </a>
                                            <a href="delete-news?id=${news.newID}" onclick="confirmDelete(event, this)"  class="delete" title="Delete" data-toggle="tooltip">
                                                <i class="fas fa-trash" style="color: red"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script>
                                                $(document).ready(function () {
                                                    $('[data-toggle="tooltip"]').tooltip();
                                                });
        </script>

        <script>


            function confirmDelete(event, element) {
                event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết
                Swal.fire({
                    title: 'Bạn có chắc chắn?',

                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Vâng, xóa nó!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                                'Đã xóa tin tức thành công',
                                ).then(() => {
                            window.location.href = element.href; // Điều hướng đến liên kết sau khi xác nhận
                        });
                    }
                });
            }
        </script>


        <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/app.min.js"></script>
        <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
        <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
        <script src="./assets/js/dashboard.js"></script>
    </body>

</html>