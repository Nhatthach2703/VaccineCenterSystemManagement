<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <style>
            h1, h2{
                font-weight: 700;
            } 
            
        </style>
    </head>

    <body>

        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">

            <jsp:include page="AdminSideBar.jsp"/>
            <div class="body-wrapper">
                <jsp:include page="IndexHeader.jsp"/>

                <div class="container-fluid">
                    <!-- Row 1 -->
                    <div class="row">
                        <div class="col-lg-8 ">
                            <div class="card">
                               <form action="AdminIndexServlet" method="post" class="p-4">
                            <h1>Lựa chọn khoản thời gian</h1>
                            <%
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                Calendar calendar = Calendar.getInstance();
                                
                                String startDate = (request.getAttribute("startDate") != null) ? request.getAttribute("startDate").toString() : dateFormat.format(calendar.getTime());
                                
                                calendar.add(Calendar.DAY_OF_WEEK, 7);
                                String endDate = (request.getAttribute("endDate") != null) ? request.getAttribute("endDate").toString() : dateFormat.format(calendar.getTime());
                            %>
                            <label for="startDate">Ngày bắt đầu:</label>
                            <input style="margin: 0 20px; padding: 5px 10px" type="date" id="startDate" name="startDate" value="<%= startDate %>">
                            <label for="endDate">Ngày kết thúc:</label>
                            <input style="margin: 0 20px; padding: 5px 10px" type="date" id="endDate" name="endDate" value="<%= endDate %>">
                            <input type="submit" value="Lọc" class="btn btn-primary m-3">
                        </form>
                            </div>
                        </div>
                    </div>
                                
                    <div class="row">
                        <div class="col-lg-12">
                                    <h2>Số tiền kiếm được của từng cơ sở</h2>
                                    <div class="row g-3 " >
                                        <div class="col-lg-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <!-- Cơ sở 1 -->
                                                <h5 class="card-title fw-semibold">Cơ sở 1</h5>
                                                <c:choose>
                                                    <c:when test="${totalPrice1 != null && totalPrice1 > 1000000}">
                                                        <span class="badge bg-success rounded-3 fw-semibold">
                                                            <fmt:formatNumber value="${totalPrice1}" type="number"
                                                                groupingUsed="true" /> VND
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${totalPrice1 != null && totalPrice1 > 500000}">
                                                        <span class="badge bg-secondary rounded-3 fw-semibold">
                                                            <fmt:formatNumber value="${totalPrice1}" type="number"
                                                                groupingUsed="true" /> VND
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${totalPrice1 != null && totalPrice1 > 100000}">
                                                        <span class="badge bg-primary rounded-3 fw-semibold">
                                                            <fmt:formatNumber value="${totalPrice1}" type="number"
                                                                groupingUsed="true" /> VND
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-danger rounded-3 fw-semibold">
                                                            <fmt:formatNumber value="${totalPrice1}" type="number"
                                                                groupingUsed="true" /> VND
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                        <!-- Cơ sở 2 -->
                                    <div class="col-lg-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title fw-semibold">Cơ sở 2</h5>
                                                <c:choose>
                                                    <c:when test="${totalPrice2 != null && totalPrice2 > 500000}">
                                                        <span class="badge bg-success rounded-3 fw-semibold">
                                                            <fmt:formatNumber value="${totalPrice2}" type="number"
                                                                groupingUsed="true" /> VND
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${totalPrice2 != null && totalPrice2 > 200000}">
                                                        <span class="badge bg-secondary rounded-3 fw-semibold">
                                                            <fmt:formatNumber value="${totalPrice2}" type="number"
                                                                groupingUsed="true" /> VND
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${totalPrice2 != null && totalPrice2 > 100000}">
                                                        <span class="badge bg-primary rounded-3 fw-semibold">
                                                            <fmt:formatNumber value="${totalPrice2}" type="number"
                                                                groupingUsed="true" /> VND
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-danger rounded-3 fw-semibold">
                                                            <fmt:formatNumber value="${totalPrice2}" type="number"
                                                                groupingUsed="true" /> VND
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                
                        </div> 
                    </div>

                    <!-- Additional rows -->
                    <div class="row">
                        <div >
                            <h2>Số khách tiêm</h2>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title fw-semibold">Cơ sở 1 - Tiêm</h5>
                                    <c:choose>
                                        <c:when test="${totalVaccinations1 != null && totalVaccinations1 > 50}">
                                            <span class="badge bg-success rounded-3 fw-semibold">${totalVaccinations1} khách</span>
                                        </c:when>
                                        <c:when test="${totalVaccinations1 != null && totalVaccinations1 > 20}">
                                            <span class="badge bg-secondary rounded-3 fw-semibold">${totalVaccinations1} khách</span>
                                        </c:when>
                                        <c:when test="${totalVaccinations1 != null && totalVaccinations1 > 10}">
                                            <span class="badge bg-primary rounded-3 fw-semibold">${totalVaccinations1} khách</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger rounded-3 fw-semibold">${totalVaccinations1} khách</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title fw-semibold">Cơ sở 2 - Tiêm</h5>
                                    <c:choose>
                                        <c:when test="${totalVaccinations2 != null && totalVaccinations2 > 50}">
                                            <span class="badge bg-success rounded-3 fw-semibold">${totalVaccinations2} khách</span>
                                        </c:when>
                                        <c:when test="${totalVaccinations2 != null && totalVaccinations2 > 20}">
                                            <span class="badge bg-secondary rounded-3 fw-semibold">${totalVaccinations2} khách</span>
                                        </c:when>
                                        <c:when test="${totalVaccinations2 != null && totalVaccinations2 > 10}">
                                            <span class="badge bg-primary rounded-3 fw-semibold">${totalVaccinations2} khách</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger rounded-3 fw-semibold">${totalVaccinations2} khách</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <h2>Số khách tư vấn</h2>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title fw-semibold">Cơ sở 1 - Tư Vấn</h5>
                                    <c:choose>
                                        <c:when test="${totalConsultations1 != null && totalConsultations1 > 50}">
                                            <span class="badge bg-success rounded-3 fw-semibold">${totalConsultations1} khách</span>
                                        </c:when>
                                        <c:when test="${totalConsultations1 != null && totalConsultations1 > 20}">
                                            <span class="badge bg-secondary rounded-3 fw-semibold">${totalConsultations1} khách</span>
                                        </c:when>
                                        <c:when test="${totalConsultations1 != null && totalConsultations1 > 10}">
                                            <span class="badge bg-primary rounded-3 fw-semibold">${totalConsultations1} khách</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger rounded-3 fw-semibold">${totalConsultations1} khách</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title fw-semibold">Cơ sở 2 - Tư vấn</h5>
                                    <c:choose>
                                        <c:when test="${totalConsultations2 != null && totalConsultations2 > 50}">
                                            <span class="badge bg-success rounded-3 fw-semibold">${totalConsultations2} khách</span>
                                        </c:when>
                                        <c:when test="${totalConsultations2 != null && totalConsultations2 > 20}">
                                            <span class="badge bg-secondary rounded-3 fw-semibold">${totalConsultations2} khách</span>
                                        </c:when>
                                        <c:when test="${totalConsultations2 != null && totalConsultations2 > 10}">
                                            <span class="badge bg-primary rounded-3 fw-semibold">${totalConsultations2} khách</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger rounded-3 fw-semibold">${totalConsultations2} khách</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <h2>Số đơn hàng</h2>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title fw-semibold">Cơ sở 1 - đơn hàng</h5>
                                    <c:choose>
                                        <c:when test="${confirmedOrders1 != null && confirmedOrders1 > 50}">
                                            <span class="badge bg-success rounded-3 fw-semibold">${confirmedOrders1} đơn</span>
                                        </c:when>
                                        <c:when test="${confirmedOrders1 != null && confirmedOrders1 > 20}">
                                            <span class="badge bg-secondary rounded-3 fw-semibold">${confirmedOrders1} đơn</span>
                                        </c:when>
                                        <c:when test="${confirmedOrders1 != null && confirmedOrders1 > 10}">
                                            <span class="badge bg-primary rounded-3 fw-semibold">${confirmedOrders1} đơn</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger rounded-3 fw-semibold">${confirmedOrders1} đơn</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title fw-semibold">Cơ sở 2 - đơn hàng</h5>
                                    <c:choose>
                                        <c:when test="${confirmedOrders2 != null && confirmedOrders2 > 50}">
                                            <span class="badge bg-success rounded-3 fw-semibold">${confirmedOrders2} đơn</span>
                                        </c:when>
                                        <c:when test="${confirmedOrders2 != null && confirmedOrders2 > 20}">
                                            <span class="badge bg-secondary rounded-3 fw-semibold">${confirmedOrders2} đơn</span>
                                        </c:when>
                                        <c:when test="${confirmedOrders2 != null && confirmedOrders2 > 10}">
                                            <span class="badge bg-primary rounded-3 fw-semibold">${confirmedOrders2} đơn</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger rounded-3 fw-semibold">${confirmedOrders2} đơn</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
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
    </body>

</html>