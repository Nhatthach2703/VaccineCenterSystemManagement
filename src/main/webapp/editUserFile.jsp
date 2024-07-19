<%-- 
    Document   : editUserFile
    Created on : Jun 30, 2024, 9:49:24 PM
    Author     : Xuan Vinh
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <!--        <meta charset="utf-8" />
                <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        
                <title>Chỉnh sửa thông tin bệnh án</title>
                <meta content="" name="description" />
                <meta content="" name="keywords" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
                 Favicons 
                <link href="assets/img/favicon.png" rel="icon" />
                <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />
        
                 Google Fonts 
                <link href="https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap" rel="stylesheet" />
        
                 Vendor CSS Files 
                <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
                <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
                <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
                <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
                <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
                <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
                <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />
                <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
                 Template Main CSS File 
                <link href="assets/css/style.css" rel="stylesheet" />
                ======
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>-->
        <!--        <style>
                    .table-title{
                        background-color: rgb(52,152,219);
                        border-radius: 8px 8px 0px 0px;
                    }
                    .btn-secondary{
                        background-color: white;
                        color: black;
                    }
        
                </style>-->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" href="assets/css/Admin_CreateUpdateVaccine.css"/>

        <script>
            function addInjectionInfo() {
                if (document.getElementById('newInjectionInfo') !== null) {
                    alert("Bạn chỉ có thể thêm thông tin tiêm chủng một lần.");
                    return;
                }

                // Fetch vaccines from the server using AJAX
                $.ajax({
                    url: 'GetAllVaccinesForAddInjeectionInfoServlet',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        var html = '<div class="card mb-3" id="newInjectionInfo">';
                        html += '<div class="card-header">Thông tin tiêm chủng</div>';
                        html += '<div class="card-body">';

                        // Dropdown for selecting Vaccine
                        html += '<div class="form-group">';
                        html += '<label for="newVaccineID">Chọn vaccine:</label>';
                        html += '<select id="newVaccineID" name="newVaccineID" class="form-control" required>';
                        html += '<option value="">Chọn vaccine</option>';

                        // Populate options from fetched data
                        for (var i = 0; i < data.length; i++) {
                            html += '<option value="' + data[i].vaccineID + '">' + data[i].name + '</option>';
                        }

                        html += '</select>';
                        html += '</div>';

                        // Other fields
                        html += '<div class="form-group">';
                        html += '<label for="newInjectionDate">Ngày tiêm chủng:</label>';
                        html += '<input type="date" id="newInjectionDate" name="newInjectionDate" class="form-control" required>';
                        html += '</div>';
                        html += '<div class="form-group">';
                        html += '<label for="newPatientStatus">Tình trạng bệnh nhân:</label>';
                        html += '<input type="text" id="newPatientStatus" name="newPatientStatus" class="form-control" required>';
                        html += '</div>';
                        html += '<div class="form-group">';
                        html += '<label for="newDateOfNextInjection">Ngày tiêm tiếp theo:</label>';
                        html += '<input type="date" id="newDateOfNextInjection" name="newDateOfNextInjection" class="form-control">';
                        html += '</div>';

                        html += '</div>';
                        html += '</div>';

                        document.getElementById('injectionInfoContainer').innerHTML += html;
                    },
                    error: function (xhr, status, error) {
                        console.error('Error fetching vaccines:', error);
                        alert('Không thể tải danh sách vaccine. Vui lòng thử lại sau!');
                    }
                });
            }

            function validateForm() {
                var newInjectionDate = document.getElementById("newInjectionDate");
                var newDateOfNextInjection = document.getElementById("newDateOfNextInjection");

                if (newInjectionDate && newDateOfNextInjection && newInjectionDate.value && newDateOfNextInjection.value) {
                    var injectionDate = new Date(newInjectionDate.value);
                    var nextInjectionDate = new Date(newDateOfNextInjection.value);

                    if (nextInjectionDate <= injectionDate) {
                        alert("Ngày tiêm tiếp theo không thể trước hoặc bằng ngày tiêm!");
                        return false;
                    }
                }
                return true;
            }
        </script>
        <style>
            body{
                background-color: white;
            }
        </style>
    </head>
    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="DoctorSideBar.jsp"/>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <jsp:include page="DoctorHeader.jsp"/>
                <div data-aos="fade-up" class="container-fluid ">
                    <div class="container-xl mt-5 " data-aos="fade-up">
                        <div class="row">
                           
                                <h3>Chỉnh sửa hồ sơ bệnh án</h3>
                                <form action="EditUserFileServlet" method="POST" onsubmit="return validateForm()">
                                    <input type="hidden" name="userFileID" value="${userFile.userFileID}">
                                    <input type="hidden" name="userID" value="${userFile.userID}">

                                    <div class="form-group">
                                        <label for="healthInsuranceCardNumber">Thẻ bảo hiểm y tế:</label>
                                        <input type="text" id="healthInsuranceCardNumber" name="healthInsuranceCardNumber" class="form-control" value="${userFile.healthInsuranceCardNumber}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="bloodType" class="form-label">Nhóm máu</label>
                                        <select class="form-control" id="bloodType" name="bloodType" required>
                                            <option value="">Chọn nhóm máu</option>
                                            <option value="A" ${userFile.bloodType == 'A' ? 'selected' : ''}>A</option>
                                            <option value="B" ${userFile.bloodType == 'B' ? 'selected' : ''}>B</option>
                                            <option value="AB" ${userFile.bloodType == 'AB' ? 'selected' : ''}>AB</option>
                                            <option value="O" ${userFile.bloodType == 'O' ? 'selected' : ''}>O</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="medicalHistory">Tiền sử bệnh:</label>
                                        <textarea id="medicalHistory" name="medicalHistory" class="form-control" rows="3">${userFile.medicalHistory}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="historyOfDrugAllergies">Dị ứng thuốc:</label>
                                        <textarea id="historyOfDrugAllergies" name="historyOfDrugAllergies" class="form-control" rows="3">${userFile.historyOfDrugAllergies}</textarea>
                                    </div>

                                    <h3>Lịch sử tiêm</h3>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Ngày tiêm</th>
                                                <th>Vaccine</th>
                                                <th>Tình trạng bệnh nhân</th>
                                                <th>Ngày tiêm tiếp theo</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="injectionInfo" items="${injectionInfos}">
                                                <tr>
                                                    <td>${injectionInfo.injectionDate}</td>
                                                    <td>
                                                        <c:forEach var="vaccine" items="${vaccines}">
                                                            <c:if test="${vaccine.vaccineID == injectionInfo.vaccineID}">
                                                                ${vaccine.name}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>${injectionInfo.patientStatus}</td>
                                                    <td>${injectionInfo.dateOfNextInjection}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>


                                    <div id="injectionInfoContainer">
                                        <!-- Dynamic InjectionInfo fields will be added here -->
                                    </div>
                                    <button type="button" class="btn btn-success" onclick="addInjectionInfo()">Thêm thông tin tiêm chủng</button>

                                    <div style="color: red;
                                         font-family: 'Tilt Neon', sans-serif;">${errorMessage}</div><br>
                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                    <a href="ViewUserFileDetailServlet?userID=${userFile.userID}" class="btn btn-secondary">Trở về</a>
                                </form>
                         
                        </div>
                    </div>
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