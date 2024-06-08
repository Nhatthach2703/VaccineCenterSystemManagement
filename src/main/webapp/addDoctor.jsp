<%-- 
    Document   : addDoctor
    Created on : Jun 6, 2024, 5:46:03 PM
    Author     : PC
--%>

<%@page import="com.thdap.vaccine.model.WorkLocation"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Add New Doctor</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <!-- Font Icon -->
    <!-- <link rel="stylesheet" href="./assets/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"> -->

    <!-- Main css -->
    <link rel="stylesheet" href="./assets/css/adminUI.css" />
  </head>
  <body>
    <div class="main">
      <!-- Sing in  Form -->
      <section class="sign-in">
        <div class="container">
          <div class="signin-content">
            <div class="signin-form">
              <h2 class="form-title">Thêm Bác Sĩ</h2>
              <form
                action="AddDoctor"
                method="post"
                enctype="multipart/form-data"
              >
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/Tom tat.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input
                    placeholder="Tên Đăng Nhập"
                    type="text"
                    name="username"
                    required
                  />
                </div>
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/nguon goc.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input
                    placeholder="Mật Khẩu"
                    type="password"
                    name="password"
                    required
                  />
                </div>
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/Loai vaccin.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input placeholder="Email" type="email" name="email" required />
                </div>
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/Lo trinh.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input
                    placeholder="Tên Bác Sĩ"
                    type="text"
                    name="fullName"
                    required
                  />
                </div>
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/Hinhanh.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input
                    type="file"
                    name="image"
                    accept="image/*"
                    placeholder="Ảnh Bác Sĩ"
                  />
                </div>
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/Tac dung phu.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input
                    placeholder="Ngày sinh"
                    type="date"
                    name="doB"
                    required
                  />
                </div>
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/tuongtac.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input
                    placeholder="Số Điện Thoại"
                    type="text"
                    name="phoneNumber"
                    required
                  />
                </div>
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/tacdungphu.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input
                    placeholder="Địa Chỉ"
                    type="text"
                    name="address"
                    required
                  />
                </div>
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/user.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <select name="gender" id="gender" required>
                    <option value="" disabled="" selected="">Giới tính</option>
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                    <option value="Khác">Khác</option>
                  </select>
                </div>
             <div class="form-group" style="display: flex">
                  <img src="assets/img/user.svg" style="width: 1rem; margin-right: 1rem" />
                  <select name="workLocationID" required>
                    <option value="" disabled selected>Địa Chỉ Làm Việc</option>
                    <%
                        List<WorkLocation> workLocations = (List<WorkLocation>) request.getAttribute("workLocations");
                        if (workLocations != null) {
                            for (WorkLocation location : workLocations) {
                    %>
                                <option value="<%= location.getWorkLocationID() %>">
                                    <%= location.getName() %> - <%= location.getAddress() %>
                                </option>
                    <%
                            }
                        }
                    %>
                  </select>
                </div>
                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/gia.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input
                    placeholder="Loại Bằng Cấp"
                    type="text"
                    name="degreeType"
                    required
                  />
                </div>

                <div class="form-group" style="display: flex">
                  <img
                    src="assets/img/gia.svg"
                    style="width: 1rem; margin-right: 1rem"
                  />
                  <input
                    placeholder="Năm Kinh Nghiệm"
                    type="number"
                    name="yearsOfExperience"
                    required
                  />
                </div>

                <div class="form-group">
                  <!-- <input type="submit" name="signin" id="signin" class="form-submit" value="Thêm Vaccine"/>
                                 -->
                  <button style="margin-right: 0.5rem">
                    <span class="circle1"></span>
                    <span class="circle2"></span>
                    <span class="circle3"></span>
                    <span class="circle4"></span>
                    <span class="circle5"></span>
                    <span class="text">Thêm</span>
                  </button>
                  <button >
                    <span class="circle1"></span>
                    <span class="circle2"></span>
                    <span class="circle3"></span>
                    <span class="circle4"></span>
                    <span class="circle5"></span>
                    <span class="text">Trở Về</span>
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
  <!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>

