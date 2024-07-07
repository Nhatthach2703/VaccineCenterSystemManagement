<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
    <head>
        <title>List Order Info</title>
    </head>
    <body>
        <h1>List Order Info</h1>
        <table border="1">
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Create Date</th>
                <th>Date Want To Get Vaccinated</th>
                <th>Work Location ID</th>
                <th>Vaccine ID</th>


                <th>Total Price</th>
                <th>Payment Status</th>
                <th>Confirm Status</th>

            </tr>
            <c:forEach items="${orders}" var="order">
                <tr>
                    <td>${order.orderInfoID}</td>
                    <td>
                        <c:forEach items="${users}" var="user">
                            <c:if test="${order.userID == user.userID}">
                                ${user.fullName}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${order.createDate}</td>
                    <td>${order.dateWantToGetVaccinated}</td>
                    <td>
                        <c:forEach items="${workLocations}" var="location">
                            <c:if test="${order.workLocationID == location.workLocationID}">
                                ${location.name}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${vaccines}" var="vaccine">
                            <c:if test="${order.vaccineID == vaccine.vaccineID}">
                                ${vaccine.name}
                            </c:if>
                        </c:forEach>
                    </td>


                    <td>${order.totalPrice}</td>
                    <td>${order.paymentStatus}</td>
                    <td>
                        <c:if test="${order.confirmStatus}">
                            Đã xác nhận
                        </c:if>
                        <c:if test="${!order.confirmStatus}">
                            <form action="${pageContext.request.contextPath}/listOrderInfo" method="post">
                                <input type="hidden" name="action" value="updateConfirmStatus">
                                <input type="hidden" name="orderInfoID" value="${order.orderInfoID}">
                                <input type="hidden" name="confirmStatus" value="true">
                                <button type="submit" ${order.paymentStatus != 'PAID' ? 'disabled' : ''}>Xác nhận</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
