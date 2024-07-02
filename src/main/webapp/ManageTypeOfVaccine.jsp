
<%@page import="com.thdap.vaccine.model.TypeOfVaccine"%>
<%@page import="java.util.List"%>
<%@page import="com.thdap.vaccine.dao.TypeOfVaccineDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>THDAP</title>
        <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="./assets/css/AdminIndex.min.css" />
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <jsp:include page="AdminSideBar.jsp"/>
            <!--  Sidebar End -->
            <!--  Main wrapper -->
            <div class="body-wrapper">
                <div data-aos="fade-up" class="container-fluid">
                    <div class="container-fluid">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title fw-semibold mb-4" style="font-size: 24px; ">Danh mục Vắc xin</h5>
                                <div class="card-body">
                                    <h6 class="card-title fw-semibold mb-4">Tên các loại Vắc xin</h6>
                                    <form action="CRUDTypeOfVaccineServlet" method="get">
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Loại Vaccine</label>
                                            <input type="hidden" name="action" value="insert">
                                            <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"required>


                                            <button type="submit" class="btn btn-primary pl-3 pr-3 mr-3" style="background-color: rgb(41,155,228); margin-top:24px ">Thêm</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-body">
                                    <h6 class="card-title fw-semibold mb-4">Các loại Vắc xin hiện có</h6>

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
                                                           title="Sửa" data-toggle="tooltip"><i class="fas fa-edit" style="margin:0 7px;color:#299BE4;" ></i></a>
                                                        <a href="CRUDTypeOfVaccineServlet?action=delete&typeID=${listTypesOfVaccine.typeID}" 
                                                           onclick="return confirm('Bạn có chắc chắn?')"  
                                                           class="delete" title="Xóa" data-toggle="tooltip">
                                                            <i class="fas fa-trash" style="color: red"></i>
                                                        </a>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
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