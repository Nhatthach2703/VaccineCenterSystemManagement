<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center">
      <div class="container d-flex align-items-center justify-content-between">
        <div class="logo">
          <h1><a href="index.jsp">THDAP</a></h1>
          <!-- Uncomment below if you prefer to use an image logo -->
          <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
        </div>

        <nav id="navbar" class="navbar">
          <ul>
            <li>
              <a class="nav-link scrollto active" href="index.jsp">Trang chủ</a>
            </li>
            <li class="dropdown">
              <a href="#"
                ><span>Vắc xin</span> <i class="bi bi-chevron-down"></i
              ></a>
              <ul>
                <li><a href="TypeOfVaccineServlet">Danh sách vaccine</a></li>
                <li><a href="PricelistVaccineServlet">Bảng giá</a></li>
                <li><a href="ChooseVaccineServlet">Đặt mua Vaccine</a></li>
                <li><a href="#">Drop Down 4</a></li>
              </ul>
            </li>
            <li>
              <a class="nav-link scrollto" href="doctorInfo">Thông tin chuyên gia</a>
            </li>
            <li><a class="nav-link scrollto" href="#pricing">Quy trình</a></li>
            <li><a class="nav-link scrollto" href="injectionRegimens">Phác đồ</a></li>
            <li class="dropdown">
                <a href="#"
                   ><span>Đặt lịch</span> <i class="bi bi-chevron-down"></i
                    ></a>
                <ul>
                    <li><a href="ConsultationScheduleServlet">Đặt lịch tư vấn</a></li>
                    <li><a href="InjectionScheduleServlet">Đặt lịch tiêm</a></li>
                    <li><a href="#">Drop Down 3</a></li>
                    <li><a href="#">Drop Down 4</a></li>
                </ul>
            </li>
            <li class="dropdown">
              <a href="#"
                ><span>Thông tin</span> <i class="bi bi-chevron-down"></i
              ></a>
              <ul>
                <li><a href="FaQsSevlet">Câu hỏi thường gặp</a></li>
                <li><a href="newsSevlet">Tin tức</a></li>
                <li class="dropdown">
                  <a href="#"
                    ><span>Deep Drop Down</span>
                    <i class="bi bi-chevron-right"></i
                  ></a>
                  <ul>
                    <li><a href="#">Deep Drop Down 1</a></li>
                    <li><a href="#">Deep Drop Down 2</a></li>
                    <li><a href="#">Deep Drop Down 3</a></li>
                    <li><a href="#">Deep Drop Down 4</a></li>
                    <li><a href="#">Deep Drop Down 5</a></li>
                  </ul>
                </li>
             
                <li><a href="ServiceReviewServlet">Xem đánh giá</a></li>
                <li><a href="#">Drop Down 4</a></li>
              </ul>
            </li>
            <li><a class="nav-link scrollto" href="#contact">Liên lạc</a></li>
            <c:if test="${sessionScope.account == null}">
              <li>
                <a class="getstarted scrollto" href="login.jsp">Đăng nhập</a>
              </li>
            </c:if>
            <c:if test="${sessionScope.account != null}">
              <li class="dropdown">
                <a
                  href="index.jsp"
                  class="getstarted scrollto dropdown-toggle"
                  data-toggle="dropdown"
                >
                  Hello ${sessionScope.account.username} <b class="caret"></b>
                </a>
                <!--Thử cho profile-->
                <!--<a href="index.jsp" class="getstarted scrollto dropdown-toggle" data-toggle="dropdown">Hello ${sessionScope.user.fullName} <b class="caret"></b></a> -->
                <ul class="dropdown-menu">
                  <li><a href="viewProfile.jsp">Xem hồ sơ</a></li>
                  <li><a href="ViewConsultationSchedulesServlet?userID=${sessionScope.user.userID}">Xem lịch sử lịch tư vấn</a></li>
                  <li><a href="ViewInjectionSchedulesServlet?userID=${sessionScope.user.userID}">Xem lịch sử lịch tiêm</a></li>
                  <li><a href="ViewVaccineOrderHistoryServlet?userID=${sessionScope.user.userID}">Xem lịch sử đặt vaccine</a></li>
                  <li><a href="logout">Đăng xuất</a></li>
                </ul>
              </li>
            </c:if>
                           

          </ul>
              
          <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>
        <!-- .navbar -->
      </div>
    </header>
    <!-- End Header -->