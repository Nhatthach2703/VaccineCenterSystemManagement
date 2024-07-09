<%-- Document : editProfile Created on : May 18, 2024, 9:45:50 PM Author : Xuan
Vinh --%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Inner Page - Vesperr Bootstrap Template</title>
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
    <link
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link
      href="assets/vendor/glightbox/css/glightbox.min.css"
      rel="stylesheet"
    />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/profile.css" />

    <!-- =======================================================
      * Template Name: Vesperr
      * Template URL: https://bootstrapmade.com/vesperr-free-bootstrap-template/
      * Updated: Mar 17 2024 with Bootstrap v5.3.3
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->
  </head>

  <body>
    <!-- ======= Header ======= -->
    <jsp:include page="header.jsp"/>
    <!-- End Header -->

    <main id="main">
      <!-- ======= Breadcrumbs Section ======= -->
      <!-- <section class="breadcrumbs">
            <div class="container">
      
             
            </div>
          </section>End Breadcrumbs Section -->

      <section class="inner-page">
        <div class="container">
          <!--Website: wwww.codingdung.com-->
          <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-3 mb-4" style="text-align: left">
              Thông tin cá nhân
            </h4>
            <div class="card overflow-hidden">
              <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                  <div
                    class="list-group list-group-flush account-settings-links"
                  >
                    <form
                      id=""
                      method="post"
                      action="ChangeUserAvatarServlet"
                      enctype="multipart/form-data"
                    >
                      <div class="container1">
                        <c:if test="${empty sessionScope.user.image}">
                          <img
                            id="avatarPreview"
                            src="$uploads/stockAvata.png"
                            alt="User Avatar"
                            class="d-block ui-w-80"
                          />
                        </c:if>
                        <c:if test="${not empty sessionScope.user.image}">
                          <img
                            id="avatarPreview"
                            src="uploads/${sessionScope.user.image}"
                            alt="User Avatar"
                            class="d-block ui-w-80"
                          />
                        </c:if>
                      </div>
                      <div class="card-body media align-items-center">
                        <div class="media-body">
                          <label class="btn btn-outline-primary">
                            Tải ảnh lên
                            <input
                              id="fileInput"
                              name="photo"
                              type="file"
                              class="account-settings-fileinput"
                              onchange="previewImage(event)"
                            />
                          </label>
                          &nbsp;
                          <button
                            type="submit"
                            class="btn btn-default md-btn-flat"
                          >
                            Save
                          </button>
                        </div>
                      </div>
                    </form>

                    <script>
                      function previewImage(event) {
                        var input = event.target;
                        var reader = new FileReader();
                        reader.onload = function () {
                          var img = document.getElementById("avatarPreview");
                          img.src = reader.result;
                        };
                        reader.readAsDataURL(input.files[0]);
                      }
                    </script>

                    <div>
                      <hr />
                    </div>
                    <a
                      class="list-group-item list-group-item-action active"
                      data-toggle="list"
                      href="#account-general"
                      >Hồ sơ của tôi</a
                    >
                    <a
                      class="list-group-item list-group-item-action"
                      data-toggle="list"
                      href="#account-change-password"
                      >Đổi mật khẩu</a
                    >
                    <a
                      class="list-group-item list-group-item-action"
                      data-toggle="list"
                      href="#account-info"
                      >Thông tin</a
                    >
                    <a
                      class="list-group-item list-group-item-action"
                      data-toggle="list"
                      href="#account-social-links"
                      >Social links</a
                    >
                    <a
                      class="list-group-item list-group-item-action"
                      data-toggle="list"
                      href="#account-connections"
                      >Connections</a
                    >
                    <a
                      class="list-group-item list-group-item-action"
                      data-toggle="list"
                      href="#account-notifications"
                      >Notifications</a
                    >
                  </div>
                </div>
                <div class="col-md-9">
                  <div class="tab-content">
                    <div class="tab-pane fade active show" id="account-general">
                      <hr class="border-light m-0" />
                      <div class="card-body">
                        <form action="UserUpdateServlet" method="post">
                          <div class="Basic-Infor">
                            <h5>Thông tin</h5>
                            <div>
                              <hr />
                            </div>
                            <div class="form-group">
                              <label class="form-label">Tên</label>
                              <input
                                type="text"
                                class="form-control mb-1"
                                name="fullName"
                                value="${sessionScope.user.fullName}"
                              />
                            </div>
                            <div>
                              <hr />
                            </div>
                            <div class="form-group">
                              <label class="form-label">UserName</label>
                              <input
                                type="text"
                                class="form-control mb-1 nav-link disabled"
                                aria-disabled="true"
                                value="${sessionScope.account.username}"
                              />
                            </div>
                            <div>
                              <hr />
                            </div>
                            <div class="form-group">
                              <label class="form-label">Ngày sinh</label>
                              <input
                                type="date"
                                class="form-control mb-1"
                                name="dob"
                                value="${sessionScope.user.doB}"
                              />
                            </div>
                            <div>
                              <hr />
                            </div>
                            <div class="form-group">
                              <label class="form-label">Giới tính</label>
                              <input
                                type="text"
                                class="form-control mb-1"
                                name="gender"
                                value="${sessionScope.user.gender}"
                              />
                            </div>
                            <div>
                              <hr />
                            </div>
                            <div class="form-group">
                              <label class="form-label">Địa chỉ</label>
                              <input
                                type="text"
                                class="form-control mb-1"
                                name="address"
                                value="${sessionScope.user.address}"
                              />
                            </div>
                          </div>
                          <div class="address-infor">
                            <h5>Thông tin liên lạc</h5>
                            <div>
                              <hr />
                            </div>
                            <div class="form-group">
                              <label class="form-label">E-mail</label>
                              <input
                                type="text"
                                class="form-control mb-1 nav-link disabled"
                                aria-disabled="true"
                                value="${sessionScope.user.email}"
                              />
                            </div>
                            <div>
                              <hr />
                            </div>
                            <div class="form-group">
                              <label class="form-label">Điện thoại</label>
                              <input
                                type="text"
                                class="form-control mb-1"
                                name="phoneNumber"
                                value="${sessionScope.user.phoneNumber}"
                              />
                            </div>
                          </div>
                          <div style="color: red">${errorMessage}</div>
                          <br />
                          <div
                            class="d-grid gap-2 d-md-flex justify-content-md-end mt-3"
                          >
                            <button type="submit" class="btn btn-primary">
                              <a>Save</a></button
                            >&nbsp;
                            <button type="button" class="btn btn-default">
                              <a href="viewProfile.jsp">Hủy</a>
                            </button>
                          </div>
                        </form>
                      </div>
                    </div>
                    <div class="tab-pane fade" id="account-change-password">
                      <div class="card-body pb-2">
                        <form action="ChangePasswordServlet" method="post">
                          <h4
                            class="font-weight-bold py-3 mb-4"
                            style="text-align: left"
                          >
                            Đổi mật khẩu
                          </h4>
                          <div class="form-group">
                            <label class="form-label">Mật khẩu hiện tại</label>
                            <input
                              type="password"
                              class="form-control"
                              name="currentPassword"
                            />
                          </div>
                          <div class="form-group">
                            <label class="form-label">Mật khẩu mới</label>
                            <input
                              type="password"
                              class="form-control"
                              name="newPassword"
                            />
                          </div>
                          <div class="form-group">
                            <label class="form-label"
                              >Nhập lại mật khẩu</label
                            >
                            <input
                              type="password"
                              class="form-control"
                              name="confirmNewPassword"
                            />
                          </div>
                          <div
                            class="d-grid gap-2 d-md-flex justify-content-md-end mt-3"
                          >
                            <button type="submit" class="btn btn-primary">
                              Lưu
                            </button>
                          </div>
                        </form>
                      </div>
                    </div>
                    <div class="tab-pane fade" id="account-info">
                      <div class="card-body pb-2">
                        <h4
                          class="font-weight-bold py-3 mb-4"
                          style="text-align: left"
                        >
                          Information
                        </h4>
                        <div class="form-group">
                          <label class="form-label">Bio</label>
                          <textarea class="form-control" rows="5">
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea
                          >
                        </div>
                        <div class="form-group">
                          <label class="form-label">Birthday</label>
                          <input
                            type="text"
                            class="form-control"
                            value="May 3, 1995"
                          />
                        </div>
                        <div class="form-group">
                          <label class="form-label">Country</label>
                          <select class="custom-select">
                            <option>USA</option>
                            <option selected>Canada</option>
                            <option>UK</option>
                            <option>Germany</option>
                            <option>France</option>
                          </select>
                        </div>
                      </div>
                      <hr class="border-light m-0" />
                      <div class="card-body pb-2">
                        <h6 class="mb-4">Contacts</h6>
                        <div class="form-group">
                          <label class="form-label">Phone</label>
                          <input
                            type="text"
                            class="form-control"
                            value="+0 (123) 456 7891"
                          />
                        </div>
                        <div class="form-group">
                          <label class="form-label">Website</label>
                          <input type="text" class="form-control" value />
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane fade" id="account-social-links">
                      <div class="card-body pb-2">
                        <div class="form-group">
                          <label class="form-label">Twitter</label>
                          <input
                            type="text"
                            class="form-control"
                            value="https://twitter.com/user"
                          />
                        </div>
                        <div class="form-group">
                          <label class="form-label">Facebook</label>
                          <input
                            type="text"
                            class="form-control"
                            value="https://www.facebook.com/user"
                          />
                        </div>
                        <div class="form-group">
                          <label class="form-label">Google+</label>
                          <input type="text" class="form-control" value />
                        </div>
                        <div class="form-group">
                          <label class="form-label">LinkedIn</label>
                          <input type="text" class="form-control" value />
                        </div>
                        <div class="form-group">
                          <label class="form-label">Instagram</label>
                          <input
                            type="text"
                            class="form-control"
                            value="https://www.instagram.com/user"
                          />
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane fade" id="account-connections">
                      <div class="card-body">
                        <button type="button" class="btn btn-twitter">
                          Connect to <strong>Twitter</strong>
                        </button>
                      </div>
                      <hr class="border-light m-0" />
                      <div class="card-body">
                        <h5 class="mb-2">
                          <a
                            href="javascript:void(0)"
                            class="float-right text-muted text-tiny"
                            ><i class="ion ion-md-close"></i> Remove</a
                          >
                          <i class="ion ion-logo-google text-google"></i>
                          You are connected to Google:
                        </h5>
                        <a
                          href="/cdn-cgi/l/email-protection"
                          class="__cf_email__"
                          data-cfemail="f9979498818e9c9595b994989095d79a9694"
                          >[email&#160;protected]</a
                        >
                      </div>
                      <hr class="border-light m-0" />
                      <div class="card-body">
                        <button type="button" class="btn btn-facebook">
                          Connect to <strong>Facebook</strong>
                        </button>
                      </div>
                      <hr class="border-light m-0" />
                      <div class="card-body">
                        <button type="button" class="btn btn-instagram">
                          Connect to <strong>Instagram</strong>
                        </button>
                      </div>
                    </div>
                    <div class="tab-pane fade" id="account-notifications">
                      <div class="card-body pb-2">
                        <h6 class="mb-4">Activity</h6>
                        <div class="form-group">
                          <label class="switcher">
                            <input
                              type="checkbox"
                              class="switcher-input"
                              checked
                            />
                            <span class="switcher-indicator">
                              <span class="switcher-yes"></span>
                              <span class="switcher-no"></span>
                            </span>
                            <span class="switcher-label"
                              >Email me when someone comments on my
                              article</span
                            >
                          </label>
                        </div>
                        <div class="form-group">
                          <label class="switcher">
                            <input
                              type="checkbox"
                              class="switcher-input"
                              checked
                            />
                            <span class="switcher-indicator">
                              <span class="switcher-yes"></span>
                              <span class="switcher-no"></span>
                            </span>
                            <span class="switcher-label"
                              >Email me when someone answers on my forum
                              thread</span
                            >
                          </label>
                        </div>
                        <div class="form-group">
                          <label class="switcher">
                            <input type="checkbox" class="switcher-input" />
                            <span class="switcher-indicator">
                              <span class="switcher-yes"></span>
                              <span class="switcher-no"></span>
                            </span>
                            <span class="switcher-label"
                              >Email me when someone follows me</span
                            >
                          </label>
                        </div>
                      </div>
                      <hr class="border-light m-0" />
                      <div class="card-body pb-2">
                        <h6 class="mb-4">Application</h6>
                        <div class="form-group">
                          <label class="switcher">
                            <input
                              type="checkbox"
                              class="switcher-input"
                              checked
                            />
                            <span class="switcher-indicator">
                              <span class="switcher-yes"></span>
                              <span class="switcher-no"></span>
                            </span>
                            <span class="switcher-label"
                              >News and announcements</span
                            >
                          </label>
                        </div>
                        <div class="form-group">
                          <label class="switcher">
                            <input type="checkbox" class="switcher-input" />
                            <span class="switcher-indicator">
                              <span class="switcher-yes"></span>
                              <span class="switcher-no"></span>
                            </span>
                            <span class="switcher-label"
                              >Weekly product updates</span
                            >
                          </label>
                        </div>
                        <div class="form-group">
                          <label class="switcher">
                            <input
                              type="checkbox"
                              class="switcher-input"
                              checked
                            />
                            <span class="switcher-indicator">
                              <span class="switcher-yes"></span>
                              <span class="switcher-no"></span>
                            </span>
                            <span class="switcher-label"
                              >Weekly blog digest</span
                            >
                          </label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <script
            data-cfasync="false"
            src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"
          ></script>
          <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
          <script type="text/javascript"></script>
        </div>
      </section>
    </main>
    <!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer">
      <div class="container">
        <div class="row d-flex align-items-center">
          <div class="col-lg-6 text-lg-left text-center">
            <div class="copyright">
              &copy; Copyright <strong>Vesperr</strong>. All Rights Reserved
            </div>
            <div class="credits">
              <!-- All the links in the footer should remain intact. -->
              <!-- You can delete the links only if you purchased the pro version. -->
              <!-- Licensing information: https://bootstrapmade.com/license/ -->
              <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/vesperr-free-bootstrap-template/ -->
              Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
          </div>
          <div class="col-lg-6">
            <nav class="footer-links text-lg-right text-center pt-2 pt-lg-0">
              <a href="#intro" class="scrollto">Home</a>
              <a href="#about" class="scrollto">About</a>
              <a href="#">Privacy Policy</a>
              <a href="#">Terms of Use</a>
            </nav>
          </div>
        </div>
      </div>
    </footer>
    <!-- End Footer -->

    <a
      href="#"
      class="back-to-top d-flex align-items-center justify-content-center"
      ><i class="bi bi-arrow-up-short"></i
    ></a>

    <!-- Vendor JS Files -->
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
