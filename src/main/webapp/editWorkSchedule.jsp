<%@page import="com.thdap.vaccine.model.Vaccine"%>
<%@page import="com.thdap.vaccine.dao.VaccineDAO"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" href="assets/css/Admin_CreateUpdateVaccine.css"/>
        <style>


            button {
                padding: 10px 30px;
                border: 0;
                border-radius: 100px;
                background-color: #2ba8fb;
                color: #ffffff;
                font-weight: Bold;
                transition: all 0.5s;
                -webkit-transition: all 0.5s;
            }

            button:hover {
                background-color: #6fc5ff;
                box-shadow: 0 0 20px #6fc5ff50;
                transform: scale(1.1);
            }

            button:active {
                background-color: #3d94cf;
                transition: all 0.25s;
                -webkit-transition: all 0.25s;
                box-shadow: none;
                transform: scale(0.98);
            }
        </style>
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="AdminSideBar.jsp"/>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <jsp:include page="IndexHeader.jsp"/>
                <div data-aos="fade-up" class="container-fluid">
                    <div class="main"style="" data-aos="zoom-in">
                        <section class="sign-in" >
                            <div class="container1" >
                                <div class="signin-content input_content">
                                    <div class="signin-form">
                                        <h2 class="form-title mb-4">Chỉnh sửa lịch làm việc</h2>
                                        <form action="EditWorkScheduleServlet" method="post" class="register-form input_infor" id="login-form" accept-charset="UTF-8">
                                            <input type="hidden" name="workScheduleID" value="${workSchedule.workScheduleID}">
                                            <div>
                                                <img src="assets/img/hospital-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;"  />
                                                <select class="opttion_vaccine" id="roomID" name="roomID" required>
                                                    <c:forEach var="room" items="${rooms}">
                                                        <option value="${room.roomID}"<c:if test="${room.roomID == workSchedule.roomID}">selected</c:if>>${room.roomName} - 
                                                            <c:forEach var="workLocation" items="${workLocations}">
                                                                <c:if test="${workLocation.workLocationID == room.workLocationID}">
                                                                    ${workLocation.name}
                                                                </c:if>
                                                            </c:forEach>
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div>
                                                <img src="assets/img/clinic-history-clipboard-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;"  />
                                                <select class="opttion_vaccine" id="shiftID" name="shiftID" required>
                                                    <c:forEach var="shift" items="${shifts}">
                                                        <option value="${shift.shiftID}"<c:if test="${shift.shiftID == workSchedule.shiftID}">selected</c:if>>${shift.startTime} - ${shift.endTime}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div>
                                                <img src="assets/img/nurse-svgrepo-com.svg" style="width: 1rem; margin-right: 1rem;"  />
                                                <select class="opttion_vaccine" id="doctorID" name="doctorID" required>
                                                    <c:forEach var="doctor" items="${doctors}">
                                                        <option value="${doctor.doctorID}"<c:if test="${doctor.doctorID == workSchedule.doctorID}">selected</c:if>>${doctor.fullName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group" style="display: flex; align-items: center;">
                                                <img src="assets/img/pills-calendar-svgrepo-com.svg" style="width: 1rem; margin-right: 2.5rem;"  />
                                                <input placeholder="ngày" type="date" id="date" name="date" style="width: 300px; font-family: 'Josefin Sans', sans-serif;" value="${workSchedule.date}" required>
                                            </div>
                                            <div>
                                                <img src="assets/img/work-type-icon.svg" style="width: 1rem; margin-right: 1rem;" />
                                                <select class="opttion_vaccine" id="workType" name="workType" required>
                                                    <option value="" disabled="" selected="">Loại công việc</option>
                                                    <option value="1" <c:if test="${workSchedule.workType == 'Tiêm'}">selected</c:if>>Tiêm</option>
                                                    <option value="2" <c:if test="${workSchedule.workType == 'Tư vấn'}">selected</c:if>>Tư vấn</option>
                                                    </select>
                                                </div>
                                                <div style="color: red; font-family: 'Tilt Neon', sans-serif;">${errorMessage}</div><br>
                                            <div class="form-group">
                                                <button style="margin-right: 1rem" class="button_add" type="submit">sửa</button>
                                               
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </section>

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