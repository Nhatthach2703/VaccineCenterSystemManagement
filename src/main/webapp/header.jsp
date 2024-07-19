<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
        <div class="logo">
            <h1><a style="font-family: 'Tilt Neon'" href="homeIndex"><img style="    object-fit: fill;
                                         width: 37px;" src="assets/images/logos/favicon.png"> THDAP</a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!--           <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
        </div>

        <nav id="navbar" class="navbar">
            <ul>
                <li>
                    <a class="nav-link scrollto active" href="homeIndex" style="font-family: 'Tilt Neon'">Trang chủ</a>
                </li>
                <li class="dropdown" style="font-family: 'Tilt Neon'">
                    <a href="#" 
                       ><span style="font-family: 'Tilt Neon'">Vaccine</span> <i class="bi bi-chevron-down" ></i
                        ></a>
                    <ul>
                        <li><a style="font-family: 'Tilt Neon'" href="TypeOfVaccineServlet">Danh sách vaccine</a></li>
                        <li><a style="font-family: 'Tilt Neon'" href="PricelistVaccineServlet">Bảng giá</a></li>
                        <li><a style="font-family: 'Tilt Neon'" href="ChooseVaccineServlet">Đặt mua Vaccine</a></li>
                        <!--<li><a style="font-family: 'Tilt Neon'" href="#">Drop Down 4</a></li>-->
                    </ul>
                </li>
                <li>
                    <a class="nav-link scrollto" style="font-family: 'Tilt Neon'" href="doctorInfo">Thông tin chuyên gia</a>
                </li>
<!--                <li><a class="nav-link scrollto" style="font-family: 'Tilt Neon'" href="#pricing">Quy trình</a></li>
                <li><a class="nav-link scrollto" style="font-family: 'Tilt Neon'" href="injectionRegimens">Phác đồ</a></li>-->
                <li class="dropdown">
                    <a href="#"
                       ><span style="font-family: 'Tilt Neon'">Phác đồ tiêm chủng</span>
                        <i class="bi bi-chevron-down"></i
                        ></a>
                    <ul style="font-family: 'Tilt Neon'">

                        <li><a style="font-family: 'Tilt Neon'" href="injectionRegimens?object=Trẻ em">Cho trẻ em</a></li>
                        <li><a style="font-family: 'Tilt Neon'" href="injectionRegimens?object=Trẻ sơ sinh">Cho trẻ sơ sinh</a></li>
                        <li><a style="font-family: 'Tilt Neon'" href="injectionRegimens?object=Người lớn">Cho người lớn</a></li>
                       
                    </ul>
                </li>
                <li class="dropdown" style="font-family: 'Tilt Neon'">
                    <a href="#"
                       ><span style="font-family: 'Tilt Neon'">Đặt lịch</span> <i class="bi bi-chevron-down"></i
                        ></a>
                    <ul>
                        <li><a style="font-family: 'Tilt Neon'" href="ConsultationScheduleServlet">Đặt lịch tư vấn</a></li>
                        <li><a style="font-family: 'Tilt Neon'" href="InjectionScheduleServlet">Đặt lịch tiêm</a></li>
                       
                    </ul>
                </li>
                <li style="font-family: 'Tilt Neon'" class="dropdown">
                    <a href="#"
                       ><span style="font-family: 'Tilt Neon'">Thông tin</span> <i class="bi bi-chevron-down"></i
                        ></a>
                    <ul>
                        <li><a style="font-family: 'Tilt Neon'" href="FaQsSevlet">Câu hỏi thường gặp</a></li>
                        <li><a style="font-family: 'Tilt Neon'" href="newsSevlet">Tin tức</a></li>
                        

                        <li><a style="font-family: 'Tilt Neon'" href="ServiceReviewServlet">Xem đánh giá</a></li>
                        <li><a style="font-family: 'Tilt Neon'" href="workLocationServlet">Tìm địa chỉ trung tâm</a></li>
                    </ul>
                </li>
               
                    <c:if test="${sessionScope.account == null}">
                    <li>
                        <a class="getstarted scrollto"  style="font-family: 'Tilt Neon'"href="login.jsp">Đăng nhập</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <li class="dropdown" style="font-family: 'Tilt Neon'">
                        <a
                            href="homeIndex"
                            class="getstarted scrollto dropdown-toggle"
                            data-toggle="dropdown"
                            >
                            Hello ${sessionScope.account.username} <b class="caret"></b>
                        </a>
                        <!--Thử cho profile-->
                        <!--<a href="index.jsp" class="getstarted scrollto dropdown-toggle" data-toggle="dropdown">Hello ${sessionScope.user.fullName} <b class="caret"></b></a> -->
                        <ul class="dropdown-menu" style="font-family: 'Tilt Neon'">
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