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
        <!--  Row 1 -->
<!--        <div class="row">
          <div class="col-lg-8 d-flex align-items-strech">
            <div class="card w-100">
              <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                  <div class="mb-3 mb-sm-0">
                    <h5 class="card-title fw-semibold">Sales Overview</h5>
                  </div>
                  <div>
                    <select class="form-select">
                      <option value="1">March 2023</option>
                      <option value="2">April 2023</option>
                      <option value="3">May 2023</option>
                      <option value="4">June 2023</option>
                    </select>
                  </div>
                </div>
                <div id="chart"></div>
              </div>
            </div>
          </div>-->
        <div class="row">
          <div class="col-lg-8 d-flex align-items-strech">
            <div class="card w-100">
              <div class="card-body">
                <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                    <form action="doctorIndexServlet" method="get" class="p-4">
                                <h1>Lựa chọn khoản thời gian</h1>
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
                                <input style="margin: 0 20px; padding: 5px 10px" type="date" id="startDate" name="startDate" value="<%= request.getAttribute("startDate") != null ? request.getAttribute("startDate") : startDate %>">
                                <label for="endDate">Ngày kết thúc:</label>
                                <input style="margin: 0 20px; padding: 5px 10px" type="date" id="endDate" name="endDate" value="<%= request.getAttribute("endDate") != null ? request.getAttribute("endDate") : endDate %>">
                                <input type="submit" value="Lọc" class="btn btn-primary m-3">
                            </form>
    
   
                </div>
                <div id="chart"></div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="row">
              <div class="col-lg-12">
                <!-- Yearly Breakup -->
                <div class="card overflow-hidden">
                  <div class="card-body p-4">
                    <h5 class="card-title mb-9 fw-semibold">Số khách tiêm</h5>
                    <div class="row align-items-center">
                      <div class="col-8">
                        <h4 class="fw-semibold mb-3">Cơ sở - tiêm</h4>
                        <div class="d-flex align-items-center mb-3">
                          <span
                            class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
<!--                            <i class="ti ti-arrow-up-left text-success"></i>-->
                          </span>
                          <p class="text-dark me-1 fs-3 mb-0">${totalVaccinations}</p>
                          <p class="fs-3 mb-0"></p>
                        </div>
                        <div class="d-flex align-items-center">
                          <div class="me-4">
                            <span class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2"></span>
                          </div>
                          <div>
                            <span class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2"></span>
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
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-12">
                <!-- Monthly Earnings -->
                <div class="card overflow-hidden">
                  <div class="card-body p-4">
                    <h5 class="card-title mb-9 fw-semibold">Số khách tư vấn</h5>
                    <div class="row align-items-center">
                      <div class="col-8">
                        <h4 class="fw-semibold mb-3">Cơ sở - tiêm</h4>
                        <div class="d-flex align-items-center mb-3">
                          <span
                            class="me-1 rounded-circle bg-light-success round-20 d-flex align-items-center justify-content-center">
<!--                            <i class="ti ti-arrow-up-left text-success"></i>-->
                          </span>
                          <p class="text-dark me-1 fs-3 mb-0">${totalConsultations}</p>
                          <p class="fs-3 mb-0"></p>
                        </div>
                        <div class="d-flex align-items-center">
                          <div class="me-4">
                            <span class="round-8 bg-primary rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2"></span>
                          </div>
                          <div>
                            <span class="round-8 bg-light-primary rounded-circle me-2 d-inline-block"></span>
                            <span class="fs-2"></span>
                          </div>
                        </div>
                      </div>
                      <div class="col-4">
                        <div class="d-flex justify-content-center">
                          <div id="breakup"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <div class="mb-4">
                  <h5 class="card-title fw-semibold">Recent Transactions</h5>
                </div>
                <ul class="timeline-widget mb-0 position-relative mb-n5">
                  <li class="timeline-item d-flex position-relative overflow-hidden">
                    <div class="timeline-time text-dark flex-shrink-0 text-end">09:30</div>
                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                      <span class="timeline-badge border-2 border border-primary flex-shrink-0 my-8"></span>
                      <span class="timeline-badge-border d-block flex-shrink-0"></span>
                    </div>
                    <div class="timeline-desc fs-3 text-dark mt-n1">Payment received from John Doe of $385.90</div>
                  </li>
                  <li class="timeline-item d-flex position-relative overflow-hidden">
                    <div class="timeline-time text-dark flex-shrink-0 text-end">10:00 am</div>
                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                      <span class="timeline-badge border-2 border border-info flex-shrink-0 my-8"></span>
                      <span class="timeline-badge-border d-block flex-shrink-0"></span>
                    </div>
                    <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">New sale recorded <a
                        href="javascript:void(0)" class="text-primary d-block fw-normal">#ML-3467</a>
                    </div>
                  </li>
                  <li class="timeline-item d-flex position-relative overflow-hidden">
                    <div class="timeline-time text-dark flex-shrink-0 text-end">12:00 am</div>
                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                      <span class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
                      <span class="timeline-badge-border d-block flex-shrink-0"></span>
                    </div>
                    <div class="timeline-desc fs-3 text-dark mt-n1">Payment was made of $64.95 to Michael</div>
                  </li>
                  <li class="timeline-item d-flex position-relative overflow-hidden">
                    <div class="timeline-time text-dark flex-shrink-0 text-end">09:30 am</div>
                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                      <span class="timeline-badge border-2 border border-warning flex-shrink-0 my-8"></span>
                      <span class="timeline-badge-border d-block flex-shrink-0"></span>
                    </div>
                    <div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">New sale recorded <a
                        href="javascript:void(0)" class="text-primary d-block fw-normal">#ML-3467</a>
                    </div>
                  </li>
                  <li class="timeline-item d-flex position-relative overflow-hidden">
                    <div class="timeline-time text-dark flex-shrink-0 text-end">09:30 am</div>
                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                      <span class="timeline-badge border-2 border border-danger flex-shrink-0 my-8"></span>
                      <span class="timeline-badge-border d-block flex-shrink-0"></span>
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