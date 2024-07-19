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
        <style>
            .table-title{
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0px 0px;
            }
        </style>
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
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <jsp:include page="AdminSideBar.jsp"/>
            <jsp:include page="IndexHeader.jsp"/>

            <div class="body-wrapper">
                <div data-aos="fade-up" class="container-fluid">
                    <div class="container-xl mt-5 " data-aos="fade-up">
                        <div class="table-wrapper">
                            <div class="table-title pt-3 pb-3">
                                <div class="row">
                                    <div class="col-sm-5 mt-2">
                                        <h2 class="ml-4" style=" font-family: 'Tilt Neon';font-weight: 700;color: white; margin-left: 2rem;">Danh sách đơn hàng</h2>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover">
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
                                        <td>${order.createDate}</td>
                                        <td>${order.dateWantToGetVaccinated}</td>
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


                                        <td>${order.totalPrice}</td>
                                        <td>${order.paymentStatus}</td>
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
                            </table>
                        </div>
                    </div>
                </div>
            </div>

    </body>
</html>
