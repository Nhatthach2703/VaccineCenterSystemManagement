<%-- 
    Document   : CreateServiceReview
    Created on : Jun 5, 2024, 9:37:35 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .rating {
                display: inline-block;
                opacity: 1;
            }

            .rating input {
                display: none;
                opacity: 1;
            }

            .rating label {
                float: right;
                cursor: pointer;
                color: #ccc;
                transition: color 0.3s, transform 0.3s, box-shadow 0.3s;
            }

            .rating label:before {
                content: '\2605';
                font-size: 30px;
                transition: color 0.3s;
            }

            .rating input:checked ~ label,
            .rating label:hover,
            .rating label:hover ~ label {
                color: #ffc300;
                transform: scale(1.2);
                transition: color 0.3s, transform 0.3s, box-shadow 0.3s;
                animation: bounce 0.5s ease-in-out alternate;
            }

            @keyframes bounce {
                to {
                    transform: scale(1.3);
                }
            }
        </style>
    </head>
    <body>
        <h1>Service Reviews</h1>
        <form action="CreateServiceReviewServlet" method="post">
            <input type="hidden" name="userID" value="${sessionScope.user.userID}">
            Content: <input type="text" name="content"><br>

<!--            Rate: <input type="number" name="rate" min="1" max="5"><br>-->
            <div class="rating">
                <input type="radio" id="star5" name="rating" value="5">
                <label for="star5"></label>
                <input type="radio" id="star4" name="rating" value="4">
                <label for="star4"></label>
                <input type="radio" id="star3" name="rating" value="3">
                <label for="star3"></label>
                <input type="radio" id="star2" name="rating" value="2">
                <label for="star2"></label>
                <input type="radio" id="star1" name="rating" value="1">
                <label for="star1"></label>
            </div>

            <input type="submit" value="Submit Review">
        </form>

        <hr>
    </body>
</html>
