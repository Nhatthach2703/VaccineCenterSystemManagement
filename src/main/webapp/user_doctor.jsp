<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>THDAP</title>
    <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="./assets/css/style.css"/>
    <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
    <link rel="stylesheet" href="./assets/css/AdminList.css">
    <style>
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

<body style="background-color:#fff ">
    <!-- Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
         data-sidebar-position="fixed" data-header-position="fixed">
        <!-- Sidebar Start -->
        <jsp:include page="AdminSideBar.jsp"/>
        <jsp:include page="IndexHeader.jsp"/>
        <!-- Sidebar End -->
        <!-- Main wrapper -->
        <div class="body-wrapper">
            <div data-aos="fade-up" class="container-fluid" style="padding-top: 30px">
                <!-- User Accounts -->
                <h2 class="mb-3">User Accounts</h2>
                <table id="userTable" class="table align-middle">
                    <thead>
                        <tr>
                            <th scope="col">User ID</th>
                            <th scope="col">Họ và Tên</th>
                            <th scope="col">Username</th>
                            <th scope="col">Ảnh</th>
                            <th scope="col">Email</th>
                            <th scope="col">Ngày sinh</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Địa chỉ</th>
                            <th scope="col">Giới tính</th>
                        </tr>
                    </thead>
                    <tbody id="userTableBody">
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${user.userID}</td>
                                <td>${user.fullName}</td>
                                <td>
                                    <c:forEach var="account" items="${accountList}">
                                        <c:if test="${user.accountID == account.accountID}">
                                            ${account.username}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><img src="uploads/${user.image}" alt="User Image" width="100px"></td>
                                <td>${user.email}</td>
                                <td>${user.doB}</td>
                                <td>${user.phoneNumber}</td>
                                <td>${user.address}</td>
                                <td>${user.gender}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="userPagination" class="pagination"></div>

                <!-- Doctor Accounts -->
                <h2 class="mb-3">Doctor Accounts</h2>
                <table id="doctorTable" class="table align-middle">
                    <thead>
                        <tr>
                            <th scope="col">Doctor ID</th>
                            <th scope="col">Họ và tên</th>
                            <th scope="col">Username</th>
                            <th scope="col">Ảnh</th>
                            <th scope="col">Email</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Địa chỉ</th>
                            <th scope="col">Nơi làm việc</th>
                            <th scope="col">Bằng cấp</th>
                            <th scope="col">Chức vụ</th>
                            <th scope="col">Kinh nghiệm</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody id="doctorTableBody">
                        <c:forEach var="doctor" items="${doctorList}">
                            <tr>
                                <td>${doctor.doctorID}</td>
                                <td>${doctor.fullName}</td>
                                <td>
                                    <c:forEach var="account" items="${accountList}">
                                        <c:if test="${doctor.accountID == account.accountID}">
                                            ${account.username}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><img src="uploads/${doctor.image}" alt="Doctor Image" width="100px"></td>
                                <td>${doctor.email}</td>
                                <td>${doctor.phoneNumber}</td>
                                <td>${doctor.address}</td>
                                <td>${doctor.workLocationID}</td>
                                <td>${doctor.degreeType}</td>
                                <td>${doctor.jobTitle}</td>
                                <td>${doctor.yearsOfExperience}</td>
                                <td>
                                    <c:forEach var="account" items="${accountList}">
                                        <c:if test="${doctor.accountID == account.accountID}">
                                            <c:choose>
                                                <c:when test="${account.status}">
                                                    <a href="LockAndUnlockAccountServlet?accountID=${account.accountID}&action=lock" class="settings" title="Khóa" data-toggle="tooltip"><img src="assets/img/lock-keyhole-minimalistic-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;" /></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="LockAndUnlockAccountServlet?accountID=${account.accountID}&action=unlock" class="settings" title="Mở khóa" data-toggle="tooltip"><img src="assets/img/key-minimalistic-square-3-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;" /></a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="doctorPagination" class="pagination"></div>
            </div>
        </div>

        <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/app.min.js"></script>
        <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
        <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
        <script src="./assets/js/dashboard.js"></script>
        <script src="assets/js/main.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                function paginateTable(tableId, paginationId, rowsPerPage) {
                    var table = document.querySelector(tableId);
                    var rows = table.querySelectorAll('tbody tr');
                    var rowsCount = rows.length;
                    var pageCount = Math.ceil(rowsCount / rowsPerPage);
                    var pagination = document.querySelector(paginationId);

                    // Xóa các liên kết phân trang cũ
                    pagination.innerHTML = '';
                    if (pageCount > 1) {
                        pagination.innerHTML += '<a href="#" class="page-number" data-page="1">First</a>';
                        pagination.innerHTML += '<a href="#" class="page-number" data-page="prev">Previous</a>';
                    }
                    for (var i = 1; i <= pageCount; i++) {
                        var pageClass = (i === 1) ? 'active' : '';
                        pagination.innerHTML += '<a href="#" class="page-number ' + pageClass + '" data-page="' + i + '">' + i + '</a>';
                    }
                    if (pageCount > 1) {
                        pagination.innerHTML += '<a href="#" class="page-number" data-page="next">Next</a>';
                        pagination.innerHTML += '<a href="#" class="page-number" data-page="' + pageCount + '">Last</a>';
                    }

                    function updateTable(page) {
                        var start = (page - 1) * rowsPerPage;
                        var end = start + rowsPerPage;
                        rows.forEach(function(row, index) {
                            row.style.display = (index >= start && index < end) ? '' : 'none';
                        });
                        pagination.querySelectorAll('a').forEach(function(link) {
                            link.classList.remove('active');
                        });
                        pagination.querySelector('a[data-page="' + page + '"]').classList.add('active');
                    }

                    pagination.addEventListener('click', function (e) {
                        e.preventDefault();
                        var page = e.target.dataset.page;
                        var currentPage = parseInt(pagination.querySelector('a.active').dataset.page);
                        if (page === 'prev') {
                            page = currentPage > 1 ? currentPage - 1 : 1;
                        } else if (page === 'next') {
                            page = currentPage < pageCount ? currentPage + 1 : pageCount;
                        }
                        var pageNumber = parseInt(page);
                        updateTable(pageNumber);
                    });

                    // Hiển thị trang đầu tiên
                    updateTable(1);
                }

                paginateTable('#userTable', '#userPagination', 10);
                paginateTable('#doctorTable', '#doctorPagination', 10);
            });
        </script>
    </body>
</html>
