<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>THDAP</title>
    <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="./assets/css/style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>
        .table-title {
            background-color: rgb(52,152,219);
            border-radius: 8px 8px 0px 0px;
        }
        .btn-secondary {
            background-color: white;
            color: black;
            transition: ease-in-out 0.25s;
        }
        .btn-secondary:hover {
            border: none;
            background-color: #6fc5ff;
            box-shadow: 0 0 20px #6fc5ff50;
            transform: scale(1.0);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgb(52,152,219);
            border-radius: 8px 8px 0px 0px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            background-color: white;
            color: black;
        }
        .form-select {
            color: rgb(54, 153, 219);
            border-radius: 8px;
        }
        th {
            background-color: rgb(54, 153, 219);
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
                            <h5 class="card-title fw-semibold mb-4" style="font-size: 24px;">Danh sách Vaccine trong kho</h5>
                            <div class="col-sm-4 mb-3 d-flex">
                                <form action="ManagementVaccineInWarehouseServlet" method="get" class="mx-3">
                                    <div>
                                        <select id="workLocationId" name="workLocationId" onchange="this.form.submit()" class="form-select">
                                            <option value="">--   Cơ sở   --</option>
                                            <c:forEach var="workLocation" items="${workLocations}">
                                                <option value="${workLocation.workLocationID}"
                                                        ${workLocation.workLocationID == param.workLocationId ? 'selected' : ''}>
                                                    ${workLocation.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <table class="table-striped">
                                <thead>
                                    <tr>
                                        <th>Vaccine</th>
                                        <th>Nguồn gốc</th>
                                        <th>Loại</th>
                                        <th>Số lượng</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody id="vaccine-table-body">
                                    <c:forEach var="warehouse" items="${warehouses}">
                                        <c:forEach var="vaccine" items="${vaccines}">
                                            <c:if test="${warehouse.vaccineID eq vaccine.vaccineID}">
                                                <c:if test="${warehouse.workLocationID eq param.workLocationId}">
                                                    <tr>
                                                        <td>${vaccine.name}</td>
                                                        <td>${vaccine.source}</td>
                                                        <td>
                                                            <c:forEach var="typeOfVaccines" items="${typeOfVaccines}">
                                                                <c:if test="${typeOfVaccines.typeID == vaccine.typeID}">
                                                                    ${typeOfVaccines.name}
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td>${warehouse.quantity}</td>
                                                        <td class="d-flex">
                                                            <a href="EditVaccineInWarehouseServlet?warehouseID=${warehouse.warehouseID}"
                                                               class="settings" title="Sửa" 
                                                               data-toggle="tooltip"><i class="fas fa-edit" style="margin:0 7px; color:#299BE4;"></i>
                                                            </a>
                                                            <a href="DeleteVaccineInWarehouseServlet?warehouseID=${warehouse.warehouseID}" onclick="confirmDelete(event, this)" class="delete" title="Xóa" data-toggle="tooltip">
                                                                <i class="fas fa-trash" style="color: red"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div id="pagination" class="pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/sidebarmenu.js"></script>
    <script src="./assets/js/app.min.js"></script>
    <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
    <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
    <script src="./assets/js/dashboard.js"></script>
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

        $(document).ready(function () {
            function paginateTable(rowsPerPage) {
                var rows = $('#vaccine-table-body tr');
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
    </script>
</body>
</html>
