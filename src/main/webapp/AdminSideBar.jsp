<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="left-sidebar" style=" width: 300px;">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="AdminIndexServlet" class="text-nowrap logo-img">
                <img src="./assets/images/logos/logo2.png" width="180" alt="" />
            </a>
            <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-8"></i>
            </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav ">
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Home</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="AdminIndexServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-layout-dashboard"></i>
                        </span>
                        <span class="hide-menu">Trang chủ</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Quản lí Vaccine</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="CRUDTypeOfVaccineServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-article"></i>
                        </span>
                        <span class="hide-menu">Danh mục Vaccine</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="ListVaccineServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-creative-commons-nd"></i>
                        </span>
                        <span class="hide-menu">Vaccine</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Quản lý lịch làm việc</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="ViewWorkSchedulesServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-calendar"></i>
                        </span>
                        <span class="hide-menu">Lịch làm việc</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="ViewTableWorkSchedulesServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-calendar"></i>
                        </span>
                        <span class="hide-menu">Sửa/Xóa lịch làm việc</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="AddWorkScheduleServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-calendar"></i>
                        </span>
                        <span class="hide-menu">Thêm lịch làm việc theo ngày</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="AddWeeklyWorkScheduleServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-calendar"></i>
                        </span>
                        <span class="hide-menu">Thêm lịch làm việc theo tuần</span>
                    </a>
                </li>

                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Tài khoản</span>
                </li>
                <li class="sidebar-item ">
                    <a class="sidebar-link" href="ListAccountServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-cards"></i>
                        </span>
                        <span class="hide-menu">Quản lý tài khoản</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="AddDoctor" aria-expanded="false">
                        <span>
                            <i class="ti ti-creative-commons-by"></i>
                        </span>
                        <span class="hide-menu">Tạo tài khoản bác sĩ</span>
                    </a>
                </li>


                <!--                            <li class="nav-small-cap">
                                              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                                              <span class="hide-menu">EXTRA</span>
                                            </li>
                                            <li class="sidebar-item">
                                              <a class="sidebar-link" href="./icon-tabler.html" aria-expanded="false">
                                                <span>
                                                  <i class="ti ti-mood-happy"></i>
                                                </span>
                                                <span class="hide-menu">Icons</span>
                                              </a>
                                            </li>
                                            <li class="sidebar-item mb-5">
                                              <a class="sidebar-link" href="./sample-page.html" aria-expanded="false">
                                                <span>
                                                  <i class="ti ti-aperture"></i>
                                                </span>
                                                <span class="hide-menu">Sample Page</span>
                                              </a>
                                            </li>-->
            </ul>

        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>