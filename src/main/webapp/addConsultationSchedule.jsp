<%-- 
    Document   : addConsultationSchedule
    Created on : Jun 6, 2024, 10:15:04 AM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đặt lịch tư vấn</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <!-- Main CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <!-- Favicons -->
        <link rel="shortcut icon" type="image/png" href="./assets/images/logos/favicon.png" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap" rel="stylesheet" />
        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <link href="assets/css/style.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        <section id="hero" class="d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div
                            class="col-lg-6 pt-5 pt-lg-0 order-2 order-lg-1 d-flex flex-column justify-content-center"
                            >
                            <h1 data-aos="fade-up">THDAP Hệ Thống Trung Tâm tiêm chủng</h1>

                            
                        </div>
                        <div
                            class="col-lg-6 order-1 order-lg-2 hero-img"
                            data-aos="fade-left"
                            data-aos-delay="200"
                            >
                            <img style="height: 90%"
                                src="./assets/img/banner_vaccinedetail.png"
                                class="img-fluid animated mt-4"
                                alt=""
                                />
                        </div>
                    </div>
                </div>
            </section>
        <div class="container-xl mt-5 " data-aos="fade-up">
            <div class="table-wrapper">
                <div class="table-title pt-3 pb-3">
                    <div class="row">
                        <div class="col-sm-5">
                            <h2 class="mx-3">Lịch tư vấn</h2>
                        </div>
                        <div class="col-sm-7">
                            <div style="text-justify: auto; text-align: right" class="mr-4">
                                <form class="d-flex justify-content-between" method="get" action="ConsultationScheduleServlet">
                                    <!-- Tạo dropdown để lọc theo ngày -->
                                    <input class="mx-2" placeholder="ngày" type="date" id="filterDate" name="filterDate" style="width: 300px; font-family: 'Josefin Sans', sans-serif;" value="${filterDate}" >
                                    <!-- Tạo dropdown để lọc theo cơ sở -->
                                    <select name="filterWorkLocation" class="form-select mx-2" >
                                        <option value="">Chọn cơ sở</option>
                                        <c:forEach var="location" items="${workLocations}">
                                            <option value="${location.workLocationID}" <c:if test="${filterWorkLocation == location.workLocationID}">selected</c:if>>${location.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="submit" class="btn btn-light mx-2">Lọc</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Giờ</th>
                            <th>Ngày</th>
                            <th>Phòng</th>
                            <th>Bác sĩ</th>
                            <th>Cơ sở</th>
                            <th>Đặt lịch</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="consultationSchedule" items="${consultationSchedules}">
                            <tr>
                                <td class="start-end-time">
                                    <c:forEach var="userShift" items="${userShifts}" varStatus="shiftStatus">
                                        <c:if test="${userShift.userShiftID == consultationSchedule.userShiftID}">
                                            ${userShift.startTime} - ${userShift.endTime}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td class="schedule-date">
                                    <c:forEach var="workSchedule" items="${workSchedules}" varStatus="scheduleStatus">
                                        <c:if test="${workSchedule.workScheduleID == consultationSchedule.workScheduleID}">
                                            ${workSchedule.date}
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
                                <td>
                                    <c:if test="${consultationSchedule.userID == 0}">
                                        <c:choose>
                                            <c:when test="${empty sessionScope.user.userID}">
                                                <!-- User is not logged in -->
                                                <button type="button" class="btn btn-success" onclick="promptLogin()">Đặt lịch</button>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- User is logged in -->
                                                <form action="BookConsultationServlet" method="post">
                                                    <input type="hidden" name="consultationScheduleID" value="${consultationSchedule.scheduleID}">
                                                    <input type="hidden" name="userID" value="${sessionScope.user.userID}">
                                                    <button type="submit" class="btn btn-success" onclick="return confirmBooking(this)">Đặt lịch</button>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${consultationSchedule.userID != 0}">
                                        <button type="button" class="btn btn-secondary" disabled>Đã kín</button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div style="color: red; font-family: 'Tilt Neon', sans-serif;">${errorMessage}</div><br>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init();
            
            function promptLogin() {
                Swal.fire({
                    icon: 'info',
                    title: 'Bạn cần đăng nhập!',
                    text: 'Bạn cần đăng nhập để đặt lịch tư vấn.',
                    showCancelButton: true,
                    confirmButtonText: 'Đăng nhập',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'login.jsp';
                    }
                });
            }
            
            function confirmBooking(button) {
                const row = button.closest('tr');
                // Fetching data from specific cells within the row
                const time = row.querySelector('.start-end-time').textContent.trim();
                const date = row.querySelector('.schedule-date').textContent.trim();
                const room = row.querySelector('.room-name').textContent.trim();
                const doctor = row.querySelector('.doctor-name').textContent.trim();
                const location = row.querySelector('.work-location').textContent.trim();
//                console.log("Giờ: " + time);
//                console.log("Ngày: " + date);
//                console.log("Phòng: " + room);
//                console.log("Bác sĩ: " + doctor);
//                console.log("Cơ sở: " + location);
                const confirmationMessage = `Bạn có chắc chắn muốn đặt lịch tư vấn vào:\n\nGiờ: `+ time +`\nNgày: `+ date + `\nPhòng: ` + room + `\nBác sĩ: `+ doctor +`\nCơ sở: ` + location;
                return confirm(confirmationMessage);
            }
        </script>
    </body>
</html>
