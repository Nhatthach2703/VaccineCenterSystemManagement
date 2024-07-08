<%-- 
    Document   : IndexHeader
    Created on : Jul 8, 2024, 2:31:56 PM
    Author     : Tran HaF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="userID mt-3" >
    <div class="navbar">

        <div class="navbar-collapse"  id="navbarNav" style="    margin-right: 20px;
             display: flex;
             justify-content: end;">

            <li class="nav-item dropdown" style="list-style: none; width: auto">
                <a href="AdminIndexServlet" style="font-family: 'Tilt Neon'" class="getstarted scrollto dropdown-toggle" data-toggle="dropdown">Hello ${sessionScope.admin.fullName} <b class="caret"></b></a> 
                <ul class="dropdown-menu">
                    <li><a href="logout">Đăng xuất</a></li>
                </ul>

            </li>

        </div>
    </div>
</div>
