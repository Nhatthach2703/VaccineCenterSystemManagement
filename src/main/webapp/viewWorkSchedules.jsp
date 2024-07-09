<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="./assets/css/calendar.css" />

    </head>
    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="AdminSideBar.jsp"/>
            
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <jsp:include page="IndexHeader.jsp"/>
                <div class="container-fluid calender" >
                    <div class="schedule-table">
                        <div class="d-flex justify-content-around mb-3" >
                            <select id="year" name="year" onchange="updateWeeks()"class="form-select">
                                <option value="">--Năm--</option>
                            </select>
                            <select id="week" name="week" onchange="updateDates()"class="form-select">
                                <option value="">--Tuần--</option>
                            </select>
                            <select id="doctor" class="form-select">
                                <option value="0" disabled="" selected="">--Bác sĩ--</option>
                                <c:forEach var="doctor" items="${doctors}">
                                    <option value="${doctor.doctorID}">${doctor.fullName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div id="date-range" class="mb-3"></div>
                        <table class="table bg-white" >
                      
                            <thead>
                                <tr class="time">
                                    <th>Ngày</th>
                                    <th class="">7h-11h30</th>
                                    <th class="">1h-5h</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="time_tr week">
                                    <td>Thứ hai,<span id="monday" class="monday-date"></span></td>
                                    <td class="monday-slot slot"></td>
                                    <td class="monday-slot-afternoon slot"></td>
                                </tr>
                                <tr class="time_tr week">
                                   <td>Thứ ba,<span class="tuesday-date"></span></td>
                                    <td class="tuesday-slot slot"></td>
                                    <td class="tuesday-slot-afternoon slot"></td>
                                </tr>
                                <tr class="time_tr week">
                                    <td>Thứ tư,<span class="wednesday-date"></span></td>
                                    <td class="wednesday-slot slot"></td>
                                    <td class="wednesday-slot-afternoon slot"></td>
                                </tr>
                                <tr class="time_tr week">
                                    <td>Thứ năm,<span class="thursday-date"></span></td>
                                    <td class="thursday-slot slot"></td>
                                    <td class="thursday-slot-afternoon slot"></td>
                                </tr>
                                <tr class="time_tr week">
                                     <td>Thứ sáu, <span class="friday-date"></span></td>
                                    <td class="friday-slot slot"></td>
                                    <td class="friday-slot-afternoon slot"></td>
                                </tr>
                                <tr class="time_tr week">
                                    <td>Thứ bảy, <span class="saturday-date"></span></td>
                                    <td class="saturday-slot slot"></td>
                                    <td class="saturday-slot-afternoon slot"></td>
                                </tr>
                                <tr class="time_tr week">
                                    <td>Chủ nhật, <span id="sunday" class="sunday-date"></span></td>
                                    <td class="sunday-slot slot"></td>
                                    <td class="sunday-slot-afternoon slot"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--            <button onclick="updateScheduleTable()">hi</button>-->
                </div>

            </div>

        </div>


        <script src="./assets/js/calendar.js"></script>
        <script>
                                var doctors = '${doctor}';
                                var rooms = '${room}';
                                var workLocations = '${workLocation}';
                                var work_Schedules = '${workSchedules}';
                                var work_Schedules_Array = JSON.parse(work_Schedules);

                                document.getElementById('week').addEventListener('change', function () {
                                    updateScheduleTable();
                                });

                                document.getElementById('doctor').addEventListener('change', function () {
                                    updateScheduleTable();
                                });

                                document.addEventListener('DOMContentLoaded', function () {
                                    console.log(format_Date(monday));
                                    console.log("aaaa" + monday);

                                    updateScheduleTable();
                                    console.log(work_Schedules_Array);
                                    // Hàm để cập nhật lịch làm việc vào bảng

                                });
// Hàm để định dạng ngày

                                function format_Date(date) {
                                    const d = new Date(date);
                                    const day = ('0' + d.getDate()).slice(-2);
                                    const month = ('0' + (d.getMonth() + 1)).slice(-2);
                                    const year = d.getFullYear();
                                    return year + "-" + month + "-" + day;
                                }


                                function updateScheduleTable() {
                                    const monday = document.getElementById("monday").textContent;
                                    const sunday = document.getElementById("sunday").textContent;

                                    const doctorSelect = document.getElementById("doctor").value;
                                    console.log(doctorSelect);

                                    document.querySelectorAll('.time_tr .slot').forEach(function (cell) {
                                        cell.innerHTML = '';
                                    });
                                    const [day1, month1, year1] = monday.split('/').map(Number);
                                    const mondate = new Date(year1, month1 - 1, day1);

                                    const [day2, month2, year2] = sunday.split('/').map(Number);
                                    const sundate = new Date(year2, month2 - 1, day2);

                                    console.log(mondate + " " + sundate);
                                    work_Schedules_Array.forEach(schedule => {

                                        const scheduleDate = format_Date(schedule.date);
                                        const curdate = new Date(scheduleDate);
                                        console.log(curdate);
                                        if (mondate <= curdate && curdate <= sundate) {

                                            const timeSlot = schedule.shiftID;
                                            const doctorID = schedule.doctorID;
                                            const roomID = schedule.roomID;
                                            const workLocationID = schedule.workLocationID;
                                            const workScheduleID = schedule.workScheduleID;
                                            const doctorName = getDoctorNameByID(doctorID);
                                            const roomName = getRoomNameByID(roomID);
                                            const workLocationName = getWorkLocationNameByID(workLocationID);
                                            const workType = getWorkTypeByID(workScheduleID);

                                            // Xác định vị trí ô dựa trên ngày và timeSlot
                                            let columnClass = '';
                                            switch (new Date(scheduleDate).getDay()) {
                                                case 1:
                                                    columnClass = '.monday-slot';
                                                    console.log(2);
                                                    break;
                                                case 2:
                                                    columnClass = '.tuesday-slot';
                                                    console.log(3);
                                                    break;
                                                case 3:
                                                    columnClass = '.wednesday-slot';
                                                    console.log(4);
                                                    break;
                                                case 4:
                                                    columnClass = '.thursday-slot';
                                                    console.log(5);
                                                    break;
                                                case 5:
                                                    columnClass = '.friday-slot';
                                                    console.log(6);
                                                    break;
                                                case 6:
                                                    columnClass = '.saturday-slot';
                                                    console.log(7);
                                                    break;
                                                case 0:
                                                    columnClass = '.sunday-slot';
                                                    console.log(3);
                                                    break;
                                            }

                                            if (timeSlot === 2) {
                                                columnClass += '-afternoon';
                                            }
                                            console.log(columnClass);
                                            // Chèn dữ liệu vào bảng
                                            const cell = document.querySelector(columnClass);
                                            if (cell && doctorSelect === '0') {
                                                cell.innerHTML += `
                                    <h6 style=" text-align: left; font-size:15px">Bác sĩ: ` + doctorName + `</h6>                  
                `;
                                            } else if (cell && doctorID.toString() === doctorSelect) {
                                                cell.innerHTML += `
                                            <div class="" style="text-align:left; font-size:15px">
                                                <p>Phòng: ` + roomName + `</p>
                                                <p>Bác sĩ: ` + workLocationName + `</p>
                                                <p>Công việc :` + workType + `</p>
                                            </div>
                                   

                                          
                `;
                                            }
                                        }
                                    });
                                }

                                function getDoctorNameByID(doctorID) {

                                    const doctors_Array = JSON.parse(doctors);
                                    const doctor = doctors_Array.find(d => d.doctorID === doctorID);
                                    console.log(doctors_Array);
                                    return doctor ? doctor.fullName : '';
                                }

                                // Hàm để lấy tên phòng từ ID
                                function getRoomNameByID(roomID) {
                                    const rooms_Array = JSON.parse(rooms);
                                    const room = rooms_Array.find(r => r.roomID === roomID);
                                    console.log(rooms_Array);
                                    return room ? room.roomName : '';
                                }

                                // Hàm để lấy tên địa điểm làm việc từ ID
                                function getWorkLocationNameByID(workLocationID) {
                                    const workLocations_Array = JSON.parse(workLocations);
                                    const workLocation = workLocations_Array.find(w => w.workLocationID === workLocationID);
                                    console.log(workLocations_Array);
                                    return workLocation ? workLocation.name : '';
                                }

                                function getWorkTypeByID(workScheduleID) {
                                    const workSchedule = work_Schedules_Array.find(w => w.workScheduleID === workScheduleID);
                                    console.log(work_Schedules_Array);
                                    return workSchedule ? workSchedule.workType : '';
                                }

                                // Gọi hàm để cập nhật bảng lịch làm việc

        </script>
        <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
        <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/js/sidebarmenu.js"></script>
        <script src="./assets/js/app.min.js"></script>
        <script src="./assets/libs/apexcharts/dist/apexcharts.min.js"></script>
        <script src="./assets/libs/simplebar/dist/simplebar.js"></script>
        <script src="./assets/js/dashboard.js"></script>
    </body>
</html>
