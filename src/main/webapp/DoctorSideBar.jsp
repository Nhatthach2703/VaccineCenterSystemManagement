<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="left-sidebar" style=" width: 300px;">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="doctorIndexServlet" class="text-nowrap logo-img">
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
                    <a class="sidebar-link" href="doctorIndexServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-layout-dashboard"></i>
                        </span>
                        <span class="hide-menu">Trang chủ</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Lịch làm việc</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="viewWorkSchedulesDoctorServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-calendar"></i>
                        </span>
                        <span class="hide-menu">Lịch làm việc cá nhân</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Hồ sơ bệnh nhân</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="listUsers" aria-expanded="false">
                        <span>
                            <i class="ti ti-article"></i>
                        </span>
                        <span class="hide-menu">Tìm kiếm hồ sơ bệnh nhân</span>
                    </a>
                </li>
                <!--                <li class="sidebar-item">
                                    <a class="sidebar-link" href="ListVaccineServlet" aria-expanded="false">
                                        <span>
                                            <i class="ti ti-creative-commons-nd"></i>
                                        </span>
                                        <span class="hide-menu">Vaccine</span>
                                    </a>
                                </li>-->



                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Tin tức</span>
                </li>
                <li class="sidebar-item ">
                    <a class="sidebar-link" href="listNews" aria-expanded="false">
                        <span>
                            <i class="ti ti-cards"></i>
                        </span>
                        <span class="hide-menu">Danh sách tin tức</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Câu hỏi thưởng gặp</span>
                </li>
                <li class="sidebar-item ">
                    <a class="sidebar-link" href="listFAQs" aria-expanded="false">
                        <span>
                            <i class="ti ti-cards"></i>
                        </span>
                        <span class="hide-menu">Danh sách câu hỏi thưởng gặp </span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Kho vaccine</span>
                </li>
                 <li class="sidebar-item ">
                    <a class="sidebar-link" href="VaccineWarehouseServlet" aria-expanded="false">
                        <span>
                            <i class="ti ti-cards"></i>
                        </span>
                        <span class="hide-menu">Xem Vaccine</span>
                    </a>
                </li>


                                            <li class="nav-small-cap">
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
                                            </li>
            </ul>

        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>