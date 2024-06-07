   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                color: #ccc;
                transition: color 0.3s;
            }

            .rating label:before {
                content: '\2605';
                font-size: 30px;
                transition: color 0.3s;
            }

            .rating input:checked ~ label {
                color: #ffc300;
                transition: color 0.3s;
            }
            /*            /////////////////////////////////////////////*/
            
            
            .addtxt{
                padding-top: 10px;
                padding-bottom: 10px;
                text-align: center;
                font-size: 13px;
                width: 350px;
                background-color: #e5e8ed;
                font-weight: 500;
            }
            .form-control:focus{
                color: #000;
            }
            .second{
                width: 350px;
                background-color: white;
                border-radius: 4px;
                box-shadow: 10px 10px 5px #aaaaaa;
            }
            .text1{
                font-size: 13px;
                font-weight: 500;
                color: #56575b;
            }
            .text2{
                font-size: 13px;
                font-weight: 500;
                margin-left: 6px;
                color: #56575b;
            }
            .text3{
                font-size: 13px;
                font-weight: 500;
                margin-right: 4px;
                color: #828386;
            }
            .text3o{
                color: #00a5f4;

            }
            .text4{
                font-size: 13px;
                font-weight: 500;
                color: #828386;
            }
            .text4i{
                color: #00a5f4;
            }
            .text4o{
                color: white;
            }
            .thumbup{
                font-size: 13px;
                font-weight: 500;
                margin-right: 5px;
            }
            .thumbupo{
                color: #17a2b8;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="mt-5">
            <h1>Service Reviews</h1>
        <ul>
            <a href="CreateServiceReviewServlet?userID=${sessionScope.user.userID}">Review</a>
            <c:forEach var="review" items="${serviceReviews}">

                <li>
                    <c:forEach var="user" items="${users}">
                        <c:if test="${user.userID == review.userID}">

                            <c:forEach var="account" items="${accounts}">
                                <c:if test="${user.accountID == account.accountID}">

                                    Username: ${account.username}<br>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>

                    Content: ${review.content}<br>
                    <div class="rating">
                        <input type="radio" id="star5-${review.reviewID}" name="rating-${review.reviewID}" value="5" ${review.rate == 5 ? 'checked' : ''} disabled>
                        <label for="star5-${review.reviewID}"></label>
                        <input type="radio" id="star4-${review.reviewID}" name="rating-${review.reviewID}" value="4" ${review.rate == 4 ? 'checked' : ''} disabled>
                        <label for="star4-${review.reviewID}"></label>
                        <input type="radio" id="star3-${review.reviewID}" name="rating-${review.reviewID}" value="3" ${review.rate == 3 ? 'checked' : ''} disabled>
                        <label for="star3-${review.reviewID}"></label>
                        <input type="radio" id="star2-${review.reviewID}" name="rating-${review.reviewID}" value="2" ${review.rate == 2 ? 'checked' : ''} disabled>
                        <label for="star2-${review.reviewID}"></label>
                        <input type="radio" id="star1-${review.reviewID}" name="rating-${review.reviewID}" value="1" ${review.rate == 1 ? 'checked' : ''} disabled>
                        <label for="star1-${review.reviewID}"></label>
                    </div>
                </li>
            </c:forEach>
           
        </ul>
             <div class="container justify-content-center mt-5 border-left border-right">
                <div class="d-flex justify-content-center pt-3 pb-2"> <input type="text" name="text" placeholder="+ Add a note" class="form-control addtxt"> </div>
                <div class="d-flex justify-content-center py-2">
                    <div class="second py-2 px-2"> <span class="text1">Type your note, and hit enter to add it</span>
                        <div class="d-flex justify-content-between py-1 pt-2">
                            <div><img src="https://i.imgur.com/AgAC1Is.jpg" width="18"><span class="text2">Martha</span></div>
                            <div><span class="text3">Upvote?</span><span class="thumbup"><i class="fa fa-thumbs-o-up"></i></span><span class="text4">3</span></div>
                        </div>
                    </div>
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

        <script>
            AOS.init();
        </script>
    </body>
</html>
