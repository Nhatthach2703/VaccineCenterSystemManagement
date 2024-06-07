<%@page import="com.thdap.vaccine.model.Vaccine"%>
<%@page import="com.thdap.vaccine.dao.VaccineDAO"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
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
        <link rel="stylesheet" href="assets/css/AdminVaccine.css"/>
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!--======-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!--        <link rel="stylesheet" href="./assets/css/adminUI.css"/>-->

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
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
        <jsp:include page="AdminHeader.jsp"/>
        <jsp:include page="banner.jsp"/>
        <div class="container-xl mt-5 " data-aos="fade-up">

            <div class="table-wrapper">
                <div class="table-title pt-3 pb-3">
                    <div class="row">
                        <div class="col-sm-5">
                            <h2 class="ml-4">Danh sách Vaccine</h2>
                        </div>
                        <div class="col-sm-7">
                            <div style="text-justify: auto;text-align: right"class="mr-4">
                                
                                <a href="CreateVaccineServlet" class="btn btn-secondary" <span>Thêm Vaccine</span></a>

                            </div>
                        </div>
                    </div>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>IDVaccine</th>
                            <th>Tên Vaccine</th>
                            <th>Nguồn</th>
                            <th>Loại Vaccine</th>
                            <th>Ảnh</th>
                            <th>Đối tượng Sử dụng</th>
                            <th>Giá</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="vaccine" items="${vaccines}">
                            <tr>
                                <td>${vaccine.vaccineID}</td>
                                <td>${vaccine.name}</td>
                                <td>${vaccine.source}</td>
                                <c:forEach var="typeOfVaccines" items="${typeOfVaccines}">
                                    <c:if test="${typeOfVaccines.typeID == vaccine.typeID}">
                                        <td> ${typeOfVaccines.name}</td>
                                    </c:if>
                                </c:forEach>
                                <td><img <img src="uploads/${vaccine.image}" alt="Vaccine Image" width="100" height="80"/></td>
                                <td>${vaccine.objectOfUse}</td>
                                <td>${vaccine.price}</td>


                                <td>
                                    <a href="UpdateVaccineServlet?vaccineID=${vaccine.vaccineID}"
                                       class="settings" title="Sửa" 
                                       data-toggle="tooltip"><i class="material-icons"style="color: red"></i></a>

                                    <a href="DeleteVaccineServlet?action=delete&id=${vaccine.vaccineID}" 
                                       onclick="return confirm('Bạn có chắc chắn?')" class="delete" title="Xóa" 
                                       data-toggle="tooltip"><i class="material-icons"></i></a>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>




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
