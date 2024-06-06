<%-- 
    Document   : AdminHeader
    Created on : May 23, 2024, 1:15:15 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
        <div class="logo">
            <h1><a href="AdminIndex.jsp">THDAP</a></h1>
            <a href="AdminIndex.jsp"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>
        </div>

        <nav id="navbar" class="navbar">
            <ul>
                <li>
                    <a class="nav-link scrollto active" href="AdminIndex.jsp">Trang chủ</a>
                </li>
                 <li class="dropdown">
                    <a href="#"
                       ><span>Quản lí Vaccine</span> <i class="bi bi-chevron-down"></i
                        ></a>
                    <ul>
                        <li><a href="CRUDTypeOfVaccineServlet">Danh mục Vaccine</a></li>
                        <li><a href="ListVaccineServlet">Vaccine</a></li>
                        
                    </ul>
                </li>
                <li><a class="nav-link scrollto" href="#services">Bảng giá</a></li>
                <li class="dropdown">
                    <a href="#"
                       ><span>Vaccine</span> <i class="bi bi-chevron-down"></i
                        ></a>
                    <ul>
                        <li><a href="#">Drop Down 1</a></li>
                        <li><a href="#">Drop Down 2</a></li>
                        <li><a href="#">Drop Down 3</a></li>
                        <li><a href="#">Drop Down 4</a></li>
                    </ul>
                </li>
                <li>
                    <a class="nav-link scrollto" href="#team"></a>
                </li>
                <li><a class="nav-link scrollto" href="#pricing"></a></li>
                <li><a class="nav-link scrollto" href="#pricing"></a></li>
                <li class="dropdown">
                    <a href="#"
                       ><span></span> <i class="bi bi-chevron-down"></i
                        ></a>
                    <ul>
                        <li><a href="#">Drop Down 1</a></li>
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
                        <li><a href="#">Drop Down 2</a></li>
                        <li><a href="#">Drop Down 3</a></li>
                        <li><a href="#">Drop Down 4</a></li>
                    </ul>
                </li>
                <li><a class="nav-link scrollto" href="#contact"></a></li>
                <c:if test="${sessionScope.account != null}">
                    <li class="dropdown">
                        <a
                            href="index.jsp"
                            class="getstarted scrollto dropdown-toggle"
                            data-toggle="dropdown"
                            >
                            Hello ${sessionScope.account.roleID == 'Admin' ? sessionScope.account.username : ''} <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="viewProfile.jsp">Xem hồ sơ</a></li>
                            <li><a href="logout">Đăng xuất</a></li>
                        </ul>
                    </li>
                </c:if>  
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav>

    </div>
</header>
