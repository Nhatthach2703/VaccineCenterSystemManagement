<%-- 
    Document   : user_doctor
    Created on : Jun 6, 2024, 5:47:08 PM
    Author     : PC
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>User and Doctor List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Font Icon -->
        <!-- <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"> -->

        <!-- Main css -->
        <link rel="stylesheet" href="./assets/css/AdminList.css">
    </head>
    <body>
        <div class="main">
            <!-- User Accounts -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-form">
                            <table id="initialTable" class="table align-middle">
                                <h2 class="form-title">User Accounts</h2>
                                <thead>
                                    <tr>
                                        <th scope="col">User ID</th>
                                        <th scope="col">Họ và Tên</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Date Of Birth</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Gender</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${userList}">
                                        <tr>
                                            <td>${user.userID}</td>
                                            <td>${user.fullName}</td>
                                            <td> <c:forEach var="account" items="${accountList}">
                                                    <c:if test="${user.accountID == account.accountID}">
                                                        ${account.username}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td><img src="uploads/${user.image}" alt="User Image" width="100px"></td>
                                            <td>${user.email}</td>
                                            <td>${user.doB}</td>
                                            <td>${user.phoneNumber}</td>
                                            <td>${user.address}</td>
                                            <td>${user.gender}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <!-- Doctor Accounts -->
                            <table id="newTable" class="table align-middle">
                                <h2 class="form-title">Doctor Accounts</h2>
                                <thead>
                                    <tr>
                                        <th scope="col">Doctor ID</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Usename</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Date Of Birth</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Work Location ID</th>
                                        <th scope="col">Degree Type</th>
                                        <th scope="col">Job Title</th>
                                        <th scope="col">YoE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="doctor" items="${doctorList}">
                                        <tr>
                                            <td>${doctor.doctorID}</td>
                                            <td>${doctor.fullName}</td>
                                            <td> <c:forEach var="account" items="${accountList}">
                                                    <c:if test="${doctor.accountID == account.accountID}">
                                                        ${account.username}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td><img src="uploads/${doctor.image}" alt="Doctor Image" width="100px"></td>
                                            <td>${doctor.email}</td>
                                            <td>${doctor.doB}</td>
                                            <td>${doctor.phoneNumber}</td>
                                            <td>${doctor.address}</td>
                                            <td>${doctor.gender}</td>
                                            <td>${doctor.workLocationID}</td>
                                            <td>${doctor.degreeType}</td>
                                            <td>${doctor.jobTitle}</td>
                                            <td>${doctor.yearsOfExperience}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="form-group">
                                <button>
                                    <span class="circle1"></span>
                                    <span class="circle2"></span>
                                    <span class="circle3"></span>
                                    <span class="circle4"></span>
                                    <span class="circle5"></span>
                                    <span class="text">Trở Về</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
