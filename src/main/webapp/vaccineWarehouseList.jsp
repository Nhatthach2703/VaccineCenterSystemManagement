<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vaccine Warehouse List</title>
    
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: rgb(52,152,219);
            border-radius: 8px 8px 0px 0px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            background-color: white;
            color: black;
        }
    </style>
</head>
<body>
   
     <div class="container-xl mt-5 " data-aos="fade-up">

            <div class="table-wrapper">
                <div class="table pt-3 pb-3">
                    <div class="row">
                        <div class="col-sm-5">
                            <h2 class="ml-4">Danh sách Vaccine</h2>
                        </div>
                        <div class="col-sm-7">
                            <div style="text-justify: auto;text-align: right"class="mr-4">
        <form action="VaccineWarehouseServlet" method="post">
        <div>
                <select id="workLocationId" name="workLocationId" onchange="this.form.submit()">
                <option value="">--   Cơ sở   --</option>
                <c:forEach var="workLocation" items="${workLocations}">
                    <option value="${workLocation.workLocationID}"
                            ${workLocation.workLocationID == param.workLocationId ? 'selected' : ''}>
                        ${workLocation.name}
                    </option>
                </c:forEach>
            </select>
        </div>
    </form>
    
    <table class="th,td">
        <thead>
            <tr>
                <th>ID Vắc xin</th>
                <th>Tên vắc xin</th>
                <th>Nguồn gốc</th>
                <th>Loại</th>
                <th>Số lượng</th>
            
            </tr>
        </thead>
        <tbody>
            <c:forEach var="warehouse" items="${warehouses}">
                <c:forEach var="vaccine" items="${vaccines}">
                    <c:if test="${warehouse.vaccineID eq vaccine.vaccineID}">
                        <c:if test="${warehouse.workLocationID eq param.workLocationId}">
                            <tr>
                                <td>${warehouse.vaccineID}</td>
                                <td>${vaccine.name}</td>
                                <td>${vaccine.source}</td>
                                <td>${vaccine.typeID}</td>
                                <td>${warehouse.quantity}</td>
                               
                            </tr>
                        </c:if>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </tbody>
    </table>
                
</body>
</html>
