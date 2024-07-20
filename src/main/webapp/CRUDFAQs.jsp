<%@page import="com.thdap.vaccine.model.Vaccine"%>
<%@page import="com.thdap.vaccine.dao.VaccineDAO"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="keywords" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <style>
            .table-title {
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0px 0px;
            }
            .btn-secondary {
                background-color: white;
                color: black;
            }
            .pagination {
                display: flex;
                justify-content: center;
                margin: 20px 0;
            }
            .pagination a {
                color: #007bff;
                padding: 8px 16px;
                text-decoration: none;
                border: 1px solid #ddd;
                margin: 0 4px;
                border-radius: 4px;
                font-size: 16px;
            }
            .pagination a.active {
                background-color: #007bff;
                color: white;
                border: 1px solid #007bff;
            }
            .pagination a:hover {
                background-color: #0056b3;
                color: white;
                border: 1px solid #0056b3;
            }
            .pagination a.disabled {
                color: #6c757d;
                cursor: not-allowed;
                pointer-events: none;
            }
        </style>
    </head>
    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="DoctorSideBar.jsp"/>
            <!-- Sidebar End -->
            <!-- Main wrapper -->
            <div class="body-wrapper">
                <jsp:include page="DoctorHeader.jsp"/>
                <div class="container-xl" data-aos="fade-up">
                    <div class="table-wrapper">
                        <div class="table-title pt-3 pb-3">
                            <div class="row">
                                <div class="col-sm-5">
                                    <h2 class="ml-4" style="font-family: 'Tilt Neon'; font-weight: 700; color: white; margin-left: 2rem;">Câu Hỏi Thường Gặp</h2>
                                </div>
                                <div class="col-sm-7">
                                    <div style="text-justify: auto; text-align: right" class="mr-4">
                                        <a href="/Vaccine/create-faq" class="btn btn-secondary">
                                            <span>Thêm Câu Hỏi Thường Gặp</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Câu Hỏi Ngắn</th>
                                    <th>Câu Hỏi</th>
                                    <th>Trả Lời</th>
                                    <th>Ảnh</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody id="faq-table-body">
                                <c:forEach var="faq" items="${faqs}">
                                    <tr>
                                        <td>${faq.shortenedQuestion}</td>
                                        <td>${faq.question}</td>
                                        <td>${faq.answer}</td>
                                        <td><img src="uploads/${faq.image}" alt="FAQ Image" width="100" height="80"/></td>
                                        <td>
                                            <a href="update-faq?id=${faq.questionID}" class="settings" title="Edit" data-toggle="tooltip">
                                                <i class="fas fa-edit" style="margin:0 7px; color:#299BE4;"></i>
                                            </a>
                                            <a href="delete-faq?id=${faq.questionID}" onclick="confirmDelete(event, this)" class="delete" title="Delete" data-toggle="tooltip">
                                                <i class="fas fa-trash" style="color: red"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div id="pagination" class="pagination"></div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
        <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/app.min.js"></script>
        <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
        <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
        <script src="./assets/js/dashboard.js"></script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                
                function paginateTable(rowsPerPage) {
                    var rows = $('#faq-table-body tr');
                    var rowsCount = rows.length;
                    var pageCount = Math.ceil(rowsCount / rowsPerPage);
                    var pagination = $('#pagination');

                    // Xóa các liên kết phân trang cũ
                    pagination.empty();
                    for (var i = 1; i <= pageCount; i++) {
                        var pageClass = (i === 1) ? 'active' : '';
                        pagination.append('<a href="#" class="page-number ' + pageClass + '">' + i + '</a>');
                    }

                    // Sự kiện khi nhấp vào liên kết phân trang
                    pagination.on('click', 'a', function (e) {
                        e.preventDefault();
                        var page = $(this).text();
                        var start = (page - 1) * rowsPerPage;
                        var end = start + rowsPerPage;
                        rows.hide().slice(start, end).show();
                        pagination.find('a').removeClass('active');
                        $(this).addClass('active');
                    });

                    // Hiển thị trang đầu tiên
                    rows.hide().slice(0, rowsPerPage).show();
                }

                // Số lượng hàng mỗi trang
                paginateTable(10);
            });

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
                        Swal.fire('Đã xóa câu hỏi thành công!').then(() => {
                            window.location.href = element.href; // Điều hướng đến liên kết sau khi xác nhận
                        });
                    }
                });
            }
        </script>
    </body>
</html>
