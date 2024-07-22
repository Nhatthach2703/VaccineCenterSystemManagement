<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <title>THDAP</title>
    <meta content="" name="description"/>
    <meta content="" name="keywords"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <!-- Favicons -->
    <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png"/>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap" rel="stylesheet"/>

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet"/>
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet"/>
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet"/>
    <!--======-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <style>
        .table-title {
            background-color: rgb(52, 152, 219);
            border-radius: 8px 8px 0 0;
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
<jsp:include page="header.jsp"/>

<div class="container-xl " data-aos="fade-up" style="margin-top: 10%; margin-bottom: 10%">
    <div class="table-wrapper">
        <div class="table-title pt-3 pb-3">
            <div class="row">
                <div class="col-sm-5">
                    <h2 class="ml-4 text-light" style="margin-left: 5%;font-weight: 700">Lịch sử đặt vaccine</h2>
                </div>
                <div class="col-sm-7">
                    <div style="text-justify: auto;text-align: right;margin-right: 7%">
                        <a href="ChooseVaccineServlet" class="btn btn-secondary"><span>Đặt vaccine</span></a>
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>Ngày đặt</th>
                <th>Ngày muốn tiêm</th>
                <th>Cơ sở</th>
                <th>Vaccine</th>
                <th>Tình trạng thanh toán</th>
                <th>Tình trạng xác nhận</th>
                <th>Giá</th>
            </tr>
            </thead>
            <tbody id="orderHistoryTableBody">
            <c:forEach var="order" items="${orderHistory}">
                <tr>
                    <td><script>document.write(moment('${order.createDate}').format('DD/MM/YYYY'))</script></td>
                    <td><script>document.write(moment('${order.dateWantToGetVaccinated}').format('DD/MM/YYYY'))</script></td>
                    <td>
                        <c:forEach var="location" items="${workLocations}">
                            <c:if test="${location.workLocationID == order.workLocationID}">
                                ${location.name}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach var="vaccine" items="${vaccines}">
                            <c:if test="${vaccine.vaccineID == order.vaccineID}">
                                ${vaccine.name}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${order.paymentStatus == 'PAID'}">
                                PAID
                            </c:when>
                            <c:when test="${order.paymentStatus == 'NOT PAID'}">
                                <a href="${sessionScope.checkoutUrl}" class="btn btn-primary">Thanh toán</a>
                            </c:when>
                            <c:otherwise>
                                ${order.paymentStatus}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${order.confirmStatus == true}">
                                <div class="alert alert-success d-inline-block p-1" role="alert">
                                    Đã xác nhận
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-danger d-inline-block p-1" role="alert">
                                    Chưa Xác nhận
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="price"id="price-${order.totalPrice}">${order.totalPrice} VND</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div id="pagination" class="pagination"></div>
    </div>
</div>
<jsp:include page="footer.jsp"/>


<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>
<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var rowsPerPage = 10; // Số lượng hàng trên mỗi trang
        var rows = document.querySelectorAll('#orderHistoryTableBody tr');
        var rowsCount = rows.length;
        var pageCount = Math.ceil(rowsCount / rowsPerPage);
        var pagination = document.getElementById('pagination');

        // Tạo các liên kết phân trang
        for (var i = 1; i <= pageCount; i++) {
            var pageClass = (i === 1) ? 'active' : '';
            var link = document.createElement('a');
            link.href = '#';
            link.className = 'page-number ' + pageClass;
            link.textContent = i;
            pagination.appendChild(link);
        }

        // Xử lý sự kiện nhấp vào phân trang
        pagination.addEventListener('click', function (e) {
            if (e.target && e.target.matches('a.page-number')) {
                e.preventDefault();
                var page = parseInt(e.target.textContent);
                var start = (page - 1) * rowsPerPage;
                var end = start + rowsPerPage;

                // Ẩn tất cả các hàng
                rows.forEach(function (row, index) {
                    row.style.display = 'none';
                });

                // Hiển thị hàng cho trang hiện tại
                for (var i = start; i < end; i++) {
                    if (rows[i]) {
                        rows[i].style.display = '';
                    }
                }

                // Cập nhật liên kết phân trang
                document.querySelectorAll('a.page-number').forEach(function (link) {
                    link.classList.remove('active');
                });
                e.target.classList.add('active');
            }
        });

        // Hiển thị hàng của trang đầu tiên
        var start = 0;
        var end = rowsPerPage;
        for (var i = start; i < end; i++) {
            if (rows[i]) {
                rows[i].style.display = '';
            }
        }
    });
    // Hàm định dạng số tiền với dấu phẩy
                                            function formatCurrency() {
                                                document.querySelectorAll('[id^="price-"]').forEach(function (el) {
                                                    var priceText = el.textContent.replace(' VND', '');
                                                    var formattedPrice = Number(priceText).toLocaleString('vi-VN');
                                                    el.textContent = formattedPrice + ' VND';
                                                });
                                            }

                                            // Gọi hàm định dạng khi trang tải xong
                                            window.onload = formatCurrency;
</script>
</body>
</html>
