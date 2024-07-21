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
    <jsp:include page="DoctorSideBar.jsp"/>
    <div class="body-wrapper">
        <!--  Header Start -->
        <jsp:include page="DoctorHeader.jsp"/>
        <!--  Header End -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 ">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                                <form action="doctorIndexServlet" method="get" class="p-4">
                                    <h2>Lựa chọn khoản thời gian</h2>
                                    <%
                                        Calendar calendar = Calendar.getInstance();
                                        // Set to the first day of the week (Sunday in US locale)
                                        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
                                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                        String startDate = dateFormat.format(calendar.getTime());

                                        // Set to the last day of the week (Saturday in US locale)
                                        calendar.add(Calendar.DAY_OF_WEEK, 6);
                                        String endDate = dateFormat.format(calendar.getTime());
                                    %>
                                    <label for="startDate">Ngày bắt đầu:</label>
                                    <input style="margin: 0 20px; padding: 5px 10px" type="date" id="startDate" name="startDate" value="<%= request.getAttribute("startDate") != null ? request.getAttribute("startDate") : startDate%>">
                                    <label for="endDate">Ngày kết thúc:</label>
                                    <input style="margin: 0 20px; padding: 5px 10px" type="date" id="endDate" name="endDate" value="<%= request.getAttribute("endDate") != null ? request.getAttribute("endDate") : endDate%>">
                                    <input type="submit" value="Lọc" class="btn btn-primary m-3">
                                </form>
                            </div>
                        </div>
                    </div>
                            
                </div>
            </div>
            <div class="col-lg-8">
                <div class="row d-flex">
                    <div class="col-lg-6">
                        <div class="card overflow-hidden">
                            <div class="card-body p-4">
                                <h5 class="card-title mb-9 fw-semibold">Số khách tiêm</h5>
                                <c:choose>
                                    <c:when test="${totalVaccinations1 != null && totalVaccinations1 > 50}">
                                        <span class="badge bg-success rounded-3 fw-semibold">${totalVaccinations} khách</span>
                                    </c:when>
                                    <c:when test="${totalVaccinations1 != null && totalVaccinations1 > 20}">
                                        <span class="badge bg-secondary rounded-3 fw-semibold">${totalVaccinations} khách</span>
                                    </c:when>
                                    <c:when test="${totalVaccinations1 != null && totalVaccinations1 > 10}">
                                        <span class="badge bg-primary rounded-3 fw-semibold">${totalVaccinations} khách</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger rounded-3 fw-semibold">${totalVaccinations} khách</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card overflow-hidden">
                            <div class="card-body p-4">
                                <h5 class="card-title mb-9 fw-semibold">Số khách tư vấn</h5>
                                <div class="col-8">
                                    <c:choose>
                                        <c:when test="${totalConsultations != null && totalConsultations > 50}">
                                            <span class="badge bg-success rounded-3 fw-semibold">${totalConsultations} khách</span>
                                        </c:when>
                                        <c:when test="${totalVaccinations1 != null && totalVaccinations1 > 20}">
                                            <span class="badge bg-secondary rounded-3 fw-semibold">${totalConsultations} khách</span>
                                        </c:when>
                                        <c:when test="${totalVaccinations1 != null && totalVaccinations1 > 10}">
                                            <span class="badge bg-primary rounded-3 fw-semibold">${totalConsultations} khách</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger rounded-3 fw-semibold">${totalConsultations} khách</span>
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