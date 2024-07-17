<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
                    <div class="col-lg-8">
                        <div class="card">
                             <form action="AdminIndexServlet" method="post" class="p-4">
                                <%
                                    Calendar calendar = Calendar.getInstance();
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                    String today = dateFormat.format(calendar.getTime());
                                %>
                                <label for="startDate">Start Date:</label>
                                <input type="date" id="startDate" name="startDate" value="<%= request.getAttribute("startDate") != null ? request.getAttribute("startDate") : today %>">
                                <label for="endDate">End Date:</label>
                                <input type="date" id="endDate" name="endDate" value="<%= request.getAttribute("endDate") != null ? request.getAttribute("endDate") : today %>">
                                <input type="submit" value="Filter" class="btn btn-primary mt-3">
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="row g-3">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title fw-semibold">Cơ sở 1</h5>
                                        <p class="card-text">$<%= request.getAttribute("totalPrice1")%></p>
                                        <!-- Additional content -->
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title fw-semibold">Cơ sở 2</h5>
                                        <p class="card-text">$<%= request.getAttribute("totalPrice2")%></p>
                                        <!-- Additional content -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Additional rows -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title fw-semibold">Cơ sở 1 - Tiêm</h5>
                                <p class="card-text"><%= request.getAttribute("totalVaccinations1")%> khách</p>
                                <!-- Additional content -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title fw-semibold">Cơ sở 2 - Tiêm</h5>
                                <p class="card-text"><%= request.getAttribute("totalVaccinations2")%> khách</p>
                                <!-- Additional content -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title fw-semibold">Cơ sở 1 - Tư Vấn</h5>
                                <p class="card-text"><%= request.getAttribute("totalConsultations1")%> khách</p>
                                <!-- Additional content -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title fw-semibold">Cơ sở 2 - Tư vấn</h5>
                                <p class="card-text"><%= request.getAttribute("totalConsultations2")%> khách</p>
                                <!-- Additional content -->
                            </div>
                        </div>
                    </div>
                </div>
                                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title fw-semibold">Cơ sở 1 - đơn hàng</h5>
                                <p class="card-text"><%= request.getAttribute("confirmedOrders1")%> đơn</p>
                                <!-- Additional content -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title fw-semibold">Cơ sở 2 - đơn hàng</h5>
                                <p class="card-text"><%= request.getAttribute("confirmedOrders2")%> đơn</p>
                                <!-- Additional content -->
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