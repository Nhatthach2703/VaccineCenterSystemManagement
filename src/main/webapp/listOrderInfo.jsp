<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>List Order Info</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">-->
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
        <style>
            .table-title {
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0px 0px;
            }
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
            <jsp:include page="AdminSideBar.jsp"/>
            <jsp:include page="IndexHeader.jsp"/>

            <div class="body-wrapper">
                <div data-aos="fade-up" class="container-fluid">
                    <div class="container-xl mt-5" data-aos="fade-up">
                        <div class="table-wrapper">
                            <div class="table-title pt-3 pb-3">
                                <div class="row">
                                    <div class="col-sm-5 mt-2">
                                        <h2 class="ml-4" style="font-family: 'Tilt Neon';font-weight: 700;color: white; margin-left: 2rem;">Danh sách đơn hàng</h2>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Mã đơn</th>
                                        <th>Người đặt</th>
                                        <th>Ngày đặt</th>
                                        <th>Ngày muốn tiêm</th>
                                        <th>Địa điểm tiêm</th>
                                        <th>Vaccine</th>
                                        <th>Giá tiền</th>
                                        <th>Tình trạng thanh toán</th>
                                        <th>Tình trạng xác nhận</th>
                                    </tr>
                                </thead>
                                <tbody id="order-table-body">
                                    <c:forEach items="${orders}" var="order">
                                        <tr>
                                            <td>${order.orderInfoID}</td>
                                            <td>
                                                <c:forEach items="${users}" var="user">
                                                    <c:if test="${order.userID == user.userID}">
                                                        ${user.fullName}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td><script>document.write(moment('${order.createDate}').format('DD/MM/YYYY'))</script></td>
                                            <td><script>document.write(moment('${order.dateWantToGetVaccinated}').format('DD/MM/YYYY'))</script></td>
                                            <td>
                                                <c:forEach items="${workLocations}" var="location">
                                                    <c:if test="${order.workLocationID == location.workLocationID}">
                                                        ${location.name}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach items="${vaccines}" var="vaccine">
                                                    <c:if test="${order.vaccineID == vaccine.vaccineID}">
                                                        ${vaccine.name}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td><p id="price-${order.totalPrice}">${order.totalPrice} VND</p></td>
                                            
                                            <td>
                                                <c:choose>
                                                    <c:when test="${order.paymentStatus == 'PAID'}">
                                                        <div class="alert alert-success d-inline-block p-0" role="alert">
                                                            Đã thanh toán
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="alert alert-danger d-inline-block p-0" role="alert">
                                                            Chưa thanh toán
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            
                                            <td>
                                                <c:if test="${order.confirmStatus}">
                                                    Đã xác nhận
                                                </c:if>
                                                <c:if test="${!order.confirmStatus}">
                                                    <form action="${pageContext.request.contextPath}/listOrderInfo" method="post">
                                                        <input type="hidden" name="action" value="updateConfirmStatus">
                                                        <input type="hidden" name="orderInfoID" value="${order.orderInfoID}">
                                                        <input type="hidden" name="confirmStatus" value="true">
                                                        <button type="submit" ${order.paymentStatus != 'PAID' ? 'disabled' : ''}>Xác nhận</button>
                                                    </form>
                                                </c:if>
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
        </div>

        <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
        <script>
            $(document).ready(function () {
                function paginateTable(rowsPerPage) {
                    var rows = $('#order-table-body tr');
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
                        rows.hide();
                        rows.slice(start, end).show();
                        pagination.find('a').removeClass('active');
                        $(this).addClass('active');
                    });

                    // Hiển thị hàng cho trang đầu tiên
                    rows.hide();
                    rows.slice(0, rowsPerPage).show();
                    pagination.find('a:first').addClass('active');
                }

                // Gọi hàm phân trang với số lượng hàng trên mỗi trang
                paginateTable(10); // Điều chỉnh số lượng hàng mỗi trang nếu cần
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
                        Swal.fire('Đã xóa vaccine thành công').then(() => {
                            window.location.href = element.href; // Điều hướng đến liên kết sau khi xác nhận
                        });
                    }
                });
            }
            
            // Hàm định dạng số tiền với dấu phẩy
            function formatCurrency() {
                document.querySelectorAll('[id^="price-"]').forEach(function(el) {
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