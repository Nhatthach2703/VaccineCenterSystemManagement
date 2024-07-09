 
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./assets/css/style.css" />
<div class="userID mt-3" >
    <div class="navbar">

        <div class="navbar-collapse"  id="navbarNav" style="    margin-right: 20px;
             display: flex;
             justify-content: end;">

            <li class="nav-item dropdown" style="list-style: none; width: auto">
                <a href="" class="getstarted scrollto dropdown-toggle" data-toggle="dropdown">Hello ${sessionScope.doctor.fullName} <b class="caret"></b></a> 
                <ul class="dropdown-menu">
                    <li><a href="logout">Đăng xuất</a></li>
                </ul>

            </li>

        </div>
    </div>
</div>