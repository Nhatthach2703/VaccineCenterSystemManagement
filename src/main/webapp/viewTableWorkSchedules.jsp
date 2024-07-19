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
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
        <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">-->
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <style>
            .table-title{
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0px 0px;
            }
            .btn-secondary{
                background-color: white;
                color: black;
            }

            .custom-select,
            .custom-input {
                background-color: white;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
                color: #495057;
                padding: 0.375rem 0.75rem;
                margin-right: 10px;
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
                    <div class="container-xl" data-aos="fade-up">
                        <div class="table-wrapper">
                            <div class="table-title pt-3 pb-3">
                                <div class="row">
                                    <div class="col-sm-5 mt-2">
                                        <h2 class="ml-4" style=" font-family: 'Tilt Neon';font-weight: 700;color: white; margin-left: 2rem;">Lịch làm việc</h2>
                                    </div>
                                    <div class="col-sm-7">
                                        <form class="d-flex justify-content-around" action="ViewTableWorkSchedulesServlet" method="get" class="form-inline" style="text-align: right; margin-right: 2rem;">
                                            <select name="doctorID" class="form-control mr-2 custom-select">
                                                <option value="" >Chọn bác sĩ</option>
                                                <c:forEach var="doctor" items="${doctors}">
                                                    <option value="${doctor.doctorID}" 
                                                            <c:if test="${doctor.doctorID == param.doctorID}">selected</c:if>>
                                                        ${doctor.fullName}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <input type="date" name="date" class="form-control mr-2 custom-input" value="${param.date}">
                                            <button type="submit" class="btn btn-secondary ">Lọc</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Phòng</th>
                                        <th>Ca làm việc</th>
                                        <th>Bác sĩ</th>
                                        <th>Địa điểm làm việc</th>
                                        <th>Ngày</th>
                                        <th>Công việc</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="workSchedule" items="${workSchedules}">
                                        <tr>
                                            <td>${workSchedule.workScheduleID}</td>
                                            <td>
                                                <c:forEach var="room" items="${rooms}">
                                                    <c:if test="${room.roomID == workSchedule.roomID}">
                                                        ${room.roomName}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach var="shift" items="${shifts}">
                                                    <c:if test="${shift.shiftID == workSchedule.shiftID}">
                                                        ${shift.startTime} - ${shift.endTime}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach var="doctor" items="${doctors}">
                                                    <c:if test="${doctor.doctorID == workSchedule.doctorID}">
                                                        ${doctor.fullName}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach var="workLocation" items="${workLocations}">
                                                    <c:if test="${workLocation.workLocationID == workSchedule.workLocationID}">
                                                        ${workLocation.name}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>${workSchedule.date}</td>
                                            <td>${workSchedule.workType}</td>
                                            <td>
                                                <a href="EditWorkScheduleServlet?workScheduleID=${workSchedule.workScheduleID}"
                                                   class="settings" title="Sửa" 
                                                   data-toggle="tooltip"><i class="fas fa-edit" style="margin:0 7px;color:#299BE4;" ></i></a>
                                                <a href="DeleteWorkScheduleServlet?workScheduleID=${workSchedule.workScheduleID}" 
                                                   onclick="confirmDelete(event, this)" class="delete" title="Xóa" 
                                                   data-toggle="tooltip"><i class="fas fa-trash" style="color: red"></i>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <script>

                function confirmDelete(event, element) {
                    event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết
                    Swal.fire({
                        title: 'Bạn có chắc chắn?',

                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Vâng, xóa nó!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire(
                                    'Đã xóa lịch làm việc thành công',
                                    ).then(() => {
                                window.location.href = element.href; // Điều hướng đến liên kết sau khi xác nhận
                            });
                        }
                    });
                }
            </script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
            <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
            <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
            <script src="./assets/js/sidebarmenu.js"></script>
            <script src="./assets/js/app.min.js"></script>
            <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
            <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
            <script src="./assets/js/dashboard.js"></script>
    </body>

</html>