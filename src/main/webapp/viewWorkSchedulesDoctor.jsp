<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />

        <title>Calendar Example</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" href="./assets/css/calendar.css"/>
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
    </head>
    <body>
        <jsp:include page="AdminHeader.jsp"/>
        <div class="container-fluid calendar" style="margin-top: 130px">
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
                            const day = ('0' + d.getDate()).slice(-2);
                            const month = ('0' + (d.getMonth() + 1)).slice(-2);
                            const year = d.getFullYear();
                            return year + "-" + month + "-" + day;
                        }

                        function formatTime(time) {
                            if (Array.isArray(time) && time.length === 2) {
                                const hours = ('0' + time[0]).slice(-2);
                                const minutes = ('0' + time[1]).slice(-2);
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
                                                <div class="row mb-3"style="background-color:rgb(52,152,219)">
                                                <div class="col-md-6">
                                                    <h6 style="text-align: left; font-size: 20px;">Lịch:` + workType + `</h6>
                                                    <p style="text-align: left;">Khách: ` + fullName + `</p>
                                                    <p style="text-align: left;">Thời gian: ` + startTime + ` - ` + endTime + `</p>
                                                </div>
                                                <div class="col-md-6 mt-4">
                                                    <form action="UpdateScheduleStatusServlet" method="post">
                                                        <input type="hidden" id="scheduleID" name="scheduleID" value="`+scheduleID+`">
                                                        <input type="hidden" id="workType" name="workType" value="`+workType+`">

                                                        <!-- Button to trigger updateStatus function -->
                                                        <button type="submit" class="btn btn-danger" `+disableButton+` onclick="return confirmSubmission(this)">Hoàn tất</button>
                                                    </form>
                                                </div> 
                                            </div>
                                                    `;
                                            } else if (fullName == 'Chưa có') {
                                                cell.innerHTML += `
                                                <div >
                                                    <h6 style="text-align: left; font-size: 20px;">Lịch:` + workType + `</h6>
                                                    <h6 style="text-align: left; font-size: 15px;">Khách:` + fullName + `</h6>
                                                    <p style="text-align: left;">Thời gian: ` + startTime + ` - ` + endTime + `</p>

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


    </body>
</html>
