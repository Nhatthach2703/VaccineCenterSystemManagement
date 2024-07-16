<%-- 
    Document   : CreateTypeOfVaccine
    Created on : May 23, 2024, 9:30:31 PM
    Author     : ADMIN
--%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            function confirmSubmission(form) {
            var confirmation = confirm("Bạn có chắc chắn muốn xác nhận việc đã hoàn tất lịch khám với khách?");
            if (confirmation) {
            return true; // Cho phép gửi form
            } else {
            return false; // Ngăn chặn gửi form
            }
            }
        </script>
        <style>
            .schedule-table {
                width: 100%;
                overflow-x: auto; /* Cho phép cuộn ngang khi bảng quá rộng */
            }

            .schedule-table table {
                width: 100%;
                table-layout: fixed; /* Đảm bảo các cột có chiều rộng cố định */
                border-collapse: collapse; /* Gộp đường viền của các ô */
            }

            .schedule-table table .time {
                padding: 8px;
                color: #fff;
                font-size: 12px;
                font-weight: 600;
                background-color: rgb(54, 153, 219);
                white-space: nowrap; /* Ngăn nội dung bị ngắt dòng */
            }

            .schedule-table table tbody td {
                padding: 8px;
                text-align: center;
                vertical-align: middle;
                border: 1px solid #e2edf8;
                font-weight: 500;
                font-size: 12px;
            }
            body{
                font-family: "Tilt Neon", sans-serif;
            }

            .schedule-table table thead th {
                padding: 10px;
                color: #fff;
                text-align: center;
                font-size: 12px;
                font-weight: 600;
                background-color: rgb(54, 153, 219);
            }

            @media (max-width: 768px) {
                .schedule-table table .time,
                .schedule-table table tbody td,
                .schedule-table table thead th {
                    font-size: 10px;
                    padding: 6px;
                }
            }
        </style>
    </head>


    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="DoctorSideBar.jsp"/>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <jsp:include page="DoctorHeader.jsp"/>
                <div class="container-fluid calendar">
                    <div class="schedule-table">
                        <div class="d-flex justify-content-around mb-3">
                            <select style="width: 30%" id="year" name="year" onchange="updateWeeks()" class="form-select">
                                <option value="">--Năm--</option>
                            </select>
                            <select style="width: 30%" id="week" name="week" onchange="updateDates()" class="form-select">
                                <option value="">--Tuần--</option>
                            </select>
                        </div>
                        <div id="date-range" class="mb-3"></div>
                        <!--                        <table class="table bg-white" >
                        
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
                                                </table>-->
                        <table class="table bg-white">
                            <thead>
                                <tr class="time week ">
                                    <th>Thời gian</th>
                                    <th>Thứ hai<br><span id="monday" class="monday-date"></span></th>
                                    <th>Thứ ba<br><span class="tuesday-date"></span></th>
                                    <th>Thứ tư<br><span class="wednesday-date"></span></th>
                                    <th>Thứ năm<br><span class="thursday-date"></span></th>
                                    <th>Thứ sáu <br><span class="friday-date"></span></th>
                                    <th>Thứ bảy <br><span class="saturday-date"></span></th>
                                    <th>Chủ nhật<br><span id="sunday" class="sunday-date"></span></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="time_tr week">
                                    <td class="time">7h-11h30</td>
                                    <td class="monday-slot slot"></td>
                                    <td class="tuesday-slot slot"></td>
                                    <td class="wednesday-slot slot"></td>
                                    <td class="thursday-slot slot"></td>
                                    <td class="friday-slot slot"></td>
                                    <td class="saturday-slot slot"></td>
                                    <td class="sunday-slot slot"></td>

                                </tr>
                                <tr class="time_tr week">
                                    <td class="time">1h-5h</td>
                                    <td class="monday-slot-afternoon slot"></td>
                                    <td class="tuesday-slot-afternoon slot"></td>
                                    <td class="wednesday-slot-afternoon slot"></td>
                                    <td class="thursday-slot-afternoon slot"></td>
                                    <td class="friday-slot-afternoon slot"></td>
                                    <td class="saturday-slot-afternoon slot"></td>
                                    <td class="sunday-slot-afternoon slot"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="./assets/js/calendar.js"></script>
        <script>
                                var doctor = '${sessionScope.doctorI}';
                                var doctor_Array = JSON.parse(doctor);
                                var doctorID = doctor_Array[0].doctorID;
                                console.log(doctor_Array);
                                console.log(doctorID);
                                var users_Array = JSON.parse('${user}');
                                var work_Schedules = '${workSchedules}';
                                var work_Schedules_Array = JSON.parse(work_Schedules);
                                var shifts_Array = JSON.parse('${shifts}');
                                var userShifts_Array = JSON.parse('${userShift}');
                                var injectionSchedules_Array = JSON.parse('${injectionSchedules}');
                                var consultationSchedules_Array = JSON.parse('${consultationSchedules}');
                                document.getElementById('week').addEventListener('change', function () {
                                updateScheduleTable();
                                });
                                document.addEventListener('DOMContentLoaded', function () {
                                updateScheduleTable();
                                });
                                function format_Date(date) {
                                const d = new Date(date);
                                const day = ('0' + d.getDate()).slice( - 2);
                                const month = ('0' + (d.getMonth() + 1)).slice( - 2);
                                const year = d.getFullYear();
                                return year + "-" + month + "-" + day;
                                }

                                function formatTime(time) {
                                if (Array.isArray(time) && time.length === 2) {
                                const hours = ('0' + time[0]).slice( - 2);
                                const minutes = ('0' + time[1]).slice( - 2);
                                return hours + ':' + minutes;
                                } else {
                                console.error('Invalid time format:', time);
                                return '';
                                }
                                }

                                function updateScheduleTable() {
                                const monday = document.getElementById("monday").textContent;
                                const sunday = document.getElementById("sunday").textContent;
                                document.querySelectorAll('.time_tr .slot').forEach(function (cell) {
                                cell.innerHTML = '';
                                });
                                const [day1, month1, year1] = monday.split('/').map(Number);
                                const mondate = new Date(year1, month1 - 1, day1);
                                const [day2, month2, year2] = sunday.split('/').map(Number);
                                const sundate = new Date(year2, month2 - 1, day2);
                                work_Schedules_Array.forEach(schedule => {
                                const scheduleDate = format_Date(schedule.date);
                                const curdate = new Date(scheduleDate);
                                if (mondate <= curdate && curdate <= sundate && schedule.doctorID === doctorID) {
                                const timeSlot = schedule.shiftID;
                                const workScheduleID = schedule.workScheduleID;
                                const workType = getWorkTypeByID(workScheduleID);
                                const schedules = getDetailsByWorkScheduleID(workScheduleID);
                                let columnClass = '';
                                switch (new Date(scheduleDate).getDay()) {
                                case 1:
                                        columnClass = '.monday-slot';
                                break;
                                case 2:
                                        columnClass = '.tuesday-slot';
                                break;
                                case 3:
                                        columnClass = '.wednesday-slot';
                                break;
                                case 4:
                                        columnClass = '.thursday-slot';
                                break;
                                case 5:
                                        columnClass = '.friday-slot';
                                break;
                                case 6:
                                        columnClass = '.saturday-slot';
                                break;
                                case 0:
                                        columnClass = '.sunday-slot';
                                break;
                                }

                                if (timeSlot === 2) {
                                columnClass += '-afternoon';
                                }

                                const cell = document.querySelector(columnClass);
                                if (cell) {
                                schedules.forEach(schedule => {
                                const {fullName, startTime, endTime, scheduleID, status} = schedule;
                                if (fullName !== 'Chưa có') {
                                const disableButton = schedule.status ? 'disabled' : '';
                                cell.innerHTML += `
                                                <div style="background-color:rgb(52,152,219); border: 1px solid #ddd; padding: 10px; margin: 10px 0px; border-radius: 5px; justify-content: space-between; align-items: center;">
                                                    <div style="flex: 1;">
                                                        <h6 style=" font-size: 15px; font-family: 'Tilt Neon', sans-serif; font-weight: bold; color: #fafbff; margin: 0;">
                                                            Lịch: ` + workType + `
                                                        </h6>
                                                        <p style=" font-family: 'Tilt Neon', sans-serif; color: #fafbff; margin: 5px 0; font-weight: 700;"> 
                                                            Khách: `+ fullName+` 
                                                        </p>
                                                    
                                                        <p style="font-family: 'Tilt Neon', sans-serif; color: #fafbff; margin: 5px 0;font-weight: 700;">
                                                            Thời gian: ` + startTime + `
                                                        </p>
                                                    
                                                    </div>
                                                    <div >
                                                        <form action="UpdateScheduleStatusServlet" method="post" style="margin: 0;">
                                                            <input type="hidden" id="scheduleID" name="scheduleID" value="` + scheduleID + `">
                                                            <input type="hidden" id="workType" name="workType" value="` + workType + `">
                                                            <button type="submit" class="btn btn-danger" `+disableButton+` style="padding: 5px 10px;" onclick="return confirmSubmission(this)">Hoàn tất</button>
                                                        </form>
                                                    </div> 
                                                </div>
                                                    `;
                                            } else if (fullName == 'Chưa có') {
                                                cell.innerHTML += `
                                                <div style="background-color: #f0f0f0; border: 1px solid #ddd; padding: 10px; margin-bottom: 10px; border-radius: 5px;">
                                                    <h6 style="font-size: 15px; font-family: 'Tilt Neon', sans-serif; margin: 0; font-weight: bold; color: #333;">
                                                        Lịch: ` + workType + `
                                                    </h6>
                                                    <h6 style="font-size: 12px; font-family: 'Tilt Neon', sans-serif; margin: 5px 0 0; color: #666;">
                                                        Khách: ` + fullName + `
                                                    </h6>
                                                    <p style="font-size: 12px; font-family: 'Tilt Neon', sans-serif; margin: 5px 0 0; color: #999;">
                                                        Thời gian: ` + startTime + ` 
                                                    </p>
                                                </div>
                                                       `;
                                            }
                                        });
                                    }
                                }
                            });
                        }

                        function getWorkTypeByID(workScheduleID) {
                            const workSchedule = work_Schedules_Array.find(w => w.workScheduleID === workScheduleID);
                            return workSchedule ? workSchedule.workType : '';
                        }

                        function getDetailsByWorkScheduleID(workScheduleID) {
                            let schedules = [];

                            // Xử lý injectionSchedules_Array
                            const filteredInjectionSchedules = injectionSchedules_Array.filter(injectionSchedule => injectionSchedule.workScheduleID === workScheduleID);

                            filteredInjectionSchedules.forEach(injectionSchedule => {
                                const workSchedule = work_Schedules_Array.find(ws => ws.workScheduleID === workScheduleID);
                                if (workSchedule) {
                                    const user = users_Array.find(u => u.userID === injectionSchedule.userID);
                                    let fullName = 'Chưa có';
                                    let startTime = '';
                                    let endTime = '';

                                    if (user) {
                                        fullName = user.fullName;
                                    }

                                    const userShift = userShifts_Array.find(us => us.userShiftID === injectionSchedule.userShiftID);
                                    if (userShift) {
                                        startTime = formatTime(userShift.startTime);
                                        endTime = formatTime(userShift.endTime);
                                    }
                                    let scheduleID = injectionSchedule.scheduleID;
                                    let status = injectionSchedule.status;

                                    schedules.push({fullName, startTime, endTime, scheduleID, status});
                                }
                            });

                            // Xử lý consultationSchedules_Array
                            const filteredConsultationSchedules = consultationSchedules_Array.filter(consultationSchedule => consultationSchedule.workScheduleID === workScheduleID);

                            filteredConsultationSchedules.forEach(consultationSchedule => {
                                const workSchedule = work_Schedules_Array.find(ws => ws.workScheduleID === workScheduleID);
                                if (workSchedule) {
                                    const user = users_Array.find(u => u.userID === consultationSchedule.userID);
                                    let fullName = 'Chưa có';
                                    let startTime = '';
                                    let endTime = '';

                                    if (user) {
                                        fullName = user.fullName;
                                    }

                                    const userShift = userShifts_Array.find(us => us.userShiftID === consultationSchedule.userShiftID);
                                    if (userShift) {
                                        startTime = formatTime(userShift.startTime);
                                        endTime = formatTime(userShift.endTime);
                                    }
                                    let scheduleID = consultationSchedule.scheduleID;
                                    let status = consultationSchedule.status;

                                    schedules.push({fullName, startTime, endTime, scheduleID, status});
                                }
                            });

                            console.log(schedules);
                            return schedules;
                        }                      
        </script>

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