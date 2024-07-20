<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>THDAP</title>
    <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
    <style>
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
            width: 40%;
            padding: 1.5%;
            margin-left: 60%;
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
        <jsp:include page="DoctorSideBar.jsp"/>
        <!-- Sidebar End -->

        <!-- Main wrapper -->
        <div class="body-wrapper">
            <jsp:include page="DoctorHeader.jsp"/>
            <div class="container-xl" data-aos="fade-up">

                <div class="table-wrapper">
                    <div class="table pt-3 pb-3">

                        <div style="text-justify: auto;text-align: right" class="container card">
                            <div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h2>Danh sách Vaccine</h2>
                                    </div>
                                    <div class="col-sm-8">
                                        <form action="VaccineWarehouseServlet" method="post">
                                            <div>
                                                <c:set var="selectedWorkLocationId" value="${param.workLocationId}" />
                                                <c:if test="${selectedWorkLocationId == null || selectedWorkLocationId.isEmpty()}">
                                                    <c:if test="${sessionScope.doctor != null}">
                                                        <c:set var="selectedWorkLocationId" value="${sessionScope.doctor.workLocationID}" />
                                                    </c:if>
                                                </c:if>

                                                <select id="workLocationId" name="workLocationId" onchange="this.form.submit()" class="form-select">
                                                    <option value="">--   Cơ sở   --</option>
                                                    <c:forEach var="workLocation" items="${workLocations}">
                                                        <option value="${workLocation.workLocationID}"
                                                                ${workLocation.workLocationID == selectedWorkLocationId ? 'selected' : ''}>
                                                            ${workLocation.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <table id="vaccine-table" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID Vắc xin</th>
                                            <th>Tên vắc xin</th>
                                            <th>Nguồn gốc</th>
                                            <th>Loại</th>
                                            <th>Số lượng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="vaccine-table-body">
                                        <c:forEach var="warehouse" items="${warehouses}">
                                            <c:forEach var="vaccine" items="${vaccines}">
                                                <c:if test="${warehouse.vaccineID eq vaccine.vaccineID}">
                                                    <c:if test="${warehouse.workLocationID eq selectedWorkLocationId}">
                                                        <tr>
                                                            <td>${warehouse.vaccineID}</td>
                                                            <td>${vaccine.name}</td>
                                                            <td>${vaccine.source}</td>
                                                            <td>${vaccine.typeID}</td>
                                                            <td>${warehouse.quantity}</td>
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

        <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/app.min.js"></script>
        <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
        <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
        <script src="./assets/js/dashboard.js"></script>

        <script>
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
