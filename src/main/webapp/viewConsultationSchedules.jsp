<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />

        <title>Lịch sử tư vấn</title>
        <meta content="" name="description" />
        <meta content="" name="keywords" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon" />
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap"
            rel="stylesheet"
            />

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link
            href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!--======-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            .table-title{
                background-color: rgb(52,152,219);
                border-radius: 8px 8px 0px 0px;
            }
            .btn-secondary{
                background-color: white;
                color: black;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="banner.jsp"/>
        <div class="container-xl mt-5 " data-aos="fade-up">
            <div class="table-wrapper">
                <div class="table-title pt-3 pb-3">
                    <div class="row">
                        <div class="col-sm-5">
                            <h2 class="ml-4">Lịch sử đặt lịch tư vấn</h2>
                        </div>
                        <div class="col-sm-7">
                            <div style="text-justify: auto;text-align: right"class="mr-4">
                                <a href="ConsultationScheduleServlet" class="btn btn-secondary" <span>Đặt lịch tư vấn</span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Ngày</th>
                            <th>Giờ</th>
                            <th>Phòng</th>
                            <th>Cơ sở</th>
                            <th>Bác sĩ</th>
                            <th>Tình trạng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="consultationSchedule" items="${consultationSchedules}">
                            <tr>
                                <td class="schedule-date">
                                    <c:forEach var="workSchedule" items="${workSchedules}">
                                        <c:if test="${workSchedule.workScheduleID == consultationSchedule.workScheduleID}">
                                            ${workSchedule.date}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td class="start-end-time">
                                    <c:forEach var="userShift" items="${userShifts}">
                                        <c:if test="${userShift.userShiftID == consultationSchedule.userShiftID}">
                                            ${userShift.startTime} - ${userShift.endTime}
                                        </c:if>
                                    </c:forEach>
                                </td>

                                <td class="room-name">
                                    <c:forEach var="workSchedule" items="${workSchedules}">
                                        <c:if test="${workSchedule.workScheduleID == consultationSchedule.workScheduleID}">
                                            <c:forEach var="room" items="${rooms}">
                                                <c:if test="${room.roomID == workSchedule.roomID}">
                                                    ${room.roomName}
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </td>                           
                                <td class="work-location">
                                    <c:forEach var="workSchedule" items="${workSchedules}">
                                        <c:if test="${workSchedule.workScheduleID == consultationSchedule.workScheduleID}">
                                            <c:forEach var="location" items="${workLocations}">
                                                <c:if test="${location.workLocationID == workSchedule.workLocationID}">
                                                    ${location.name}
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td class="doctor-name">
                                    <c:forEach var="workSchedule" items="${workSchedules}">
                                        <c:if test="${workSchedule.workScheduleID == consultationSchedule.workScheduleID}">
                                            <c:forEach var="doctor" items="${doctors}">
                                                <c:if test="${doctor.doctorID == workSchedule.doctorID}">
                                                    ${doctor.fullName}
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${consultationSchedule.status == true}">
                                            <div class="alert alert-success d-inline-block p-1" role="alert">
                                                Đã Hoàn Thành
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="alert alert-danger d-inline-block p-1" role="alert">
                                                Chưa Hoàn Thành
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>

        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
