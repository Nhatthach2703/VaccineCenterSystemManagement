<%-- 
    Document   : TypeOfVaccine
    Created on : May 23, 2024, 9:35:04 AM
    Author     : ADMIN
--%>

<%@page import="com.thdap.vaccine.model.TypeOfVaccine"%>
<%@page import="java.util.List"%>
<%@page import="com.thdap.vaccine.dao.TypeOfVaccineDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Vesperr Bootstrap Template - Index</title>
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

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />

    <!--    <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>-->
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
    <body>

        <jsp:include page="AdminHeader.jsp"/>
        <jsp:include page="banner.jsp"/>
        <div data-aos="fade-up" class="container-fluid">
            <div class="container-xl mb-5">
                <h4 class="bold mb-3">Danh Mục Vaccine</h4>
                <div class="row row-cols-lg-auto g-3 align-items-center">
                    <div class="col-12">
                        <form action="CRUDTypeOfVaccineServlet" method="get">
                            <label class="visually-hidden" for="inlineFormInputGroupUsername">Tên loại Vaccine</label>
                            <div class="input-group-container row" style="align-items: center; border: 1px solid #ccc; padding: 10px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
                                <div class="input-group col-11">
                                    <input type="hidden" name="action" value="insert">
                                    <input name="name" type="text" class="form-control m-1" id="inlineFormInputGroupUsername" placeholder="Tên loại Vaccine"required>
                                </div>
                                <div class="col-1">
                                    <button type="submit" class="btn btn-primary pl-3 pr-3 mr-3" style="background-color: rgb(41,155,228)">Thêm</button>
                                </div>
                            </div>
                        </form>


                    </div>
                </div>

            </div>



            <div class="container-xl">

                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2 class="mb-5">Các Loại Hiện Có</h2>
                            </div>
                            <div class="col-sm-7">
                                <!--<a href="#" class="btn btn-secondary"><i class="material-icons">&#xE147;</i> <span>Thêm loại Vaccine</span></a>-->

                            </div>
                        </div>
                    </div>


                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listTypesOfVaccine" items="${listTypesOfVaccine}">

                                <tr>
                                    <td>
                                        ${listTypesOfVaccine.typeID}
                                    </td>
                                    <td>
                                        ${listTypesOfVaccine.name}
                                    </td>

                                    <td>
                                        <a href="UpdateTypeOfVaccineServlet?typeID=${listTypesOfVaccine.typeID}"
                                           class="settings"
                                           title="Sửa" data-toggle="tooltip"><i
                                                class="material-icons" style="color: red">&#xE8B8;</i></a>
                                        <a href="CRUDTypeOfVaccineServlet?action=delete&typeID=${listTypesOfVaccine.typeID}" 
                                           onclick="return confirm('Bạn có chắc chắn?')"  
                                           class="delete" title="Xóa" data-toggle="tooltip">
                                            <i class="material-icons">&#xE5C9;</i>
                                        </a>
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>


                </div>

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
