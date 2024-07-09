<%@page import="com.thdap.vaccine.model.Vaccine"%>
<%@page import="com.thdap.vaccine.dao.VaccineDAO"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">   
        <style>
            

            button {
                padding: 10px 20px;
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
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="AdminSideBar.jsp"/>
            
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <jsp:include page="IndexHeader.jsp"/>
                <div data-aos="fade-up" class="container-fluid">
                    <div class="container-fluid">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title fw-semibold mb-4" style="font-size: 24px; ">Danh sách Vắc xin</h5>
                                <div class="col-sm-4 mb-3">
                                    <div style="text-justify: auto;text-align: left"class="mr-4">

                                        <button onclick="location.href = 'CreateVaccineServlet'">
                                            Thêm Vaccine
                                        </button>
                                    </div>

                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>IDVaccine</th>
                                            <th>Tên Vaccine</th>
                                            <th>Nguồn</th>
                                            <th>Loại Vaccine</th>
                                            <th>Ảnh</th>
                                            <th>Đối tượng Sử dụng</th>
                                            <th>Giá</th>
                                            <th>Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach var="vaccine" items="${vaccines}">
                                            <tr>
                                                <td>${vaccine.vaccineID}</td>
                                                <td>${vaccine.name}</td>
                                                <td>${vaccine.source}</td>
                                                <c:forEach var="typeOfVaccines" items="${typeOfVaccines}">
                                                    <c:if test="${typeOfVaccines.typeID == vaccine.typeID}">
                                                        <td> ${typeOfVaccines.name}</td>
                                                    </c:if>
                                                </c:forEach>
                                                <td><img <img src="uploads/${vaccine.image}" alt="Vaccine Image" width="100" height="80"/></td>
                                                <td>${vaccine.objectOfUse}</td>
                                                <td>${vaccine.price}</td>


                                                <td>
                                                    <a href="UpdateVaccineServlet?vaccineID=${vaccine.vaccineID}"
                                                       class="settings" title="Sửa" 
                                                       data-toggle="tooltip"><i class="fas fa-edit" style="margin:0 7px; color:#299BE4;"></i></a>

                                                    <a href="DeleteVaccineServlet?action=delete&id=${vaccine.vaccineID}" onclick="confirmDelete(event, this)" class="delete" title="Xóa" data-toggle="tooltip">
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
            </div>

        </div>
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
                                'Đã xóa vaccine thành công',
                                ).then(() => {
                            window.location.href = element.href; // Điều hướng đến liên kết sau khi xác nhận
                        });
                    }
                });
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/app.min.js"></script>
        <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
        <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
        <script src="./assets/js/dashboard.js"></script>
    </body>

</html>