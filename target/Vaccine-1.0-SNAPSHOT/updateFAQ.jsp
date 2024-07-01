<%-- 
    Document   : updateFAQ.jsp
    Created on : Jun 23, 2024, 9:43:34 PM
    Author     : DELL
--%>


<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            form {
                max-width: 600px;
                margin: auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
            }
            label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
            }
            input, textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập Nhật Câu Hỏi Thường Gặp</title>
    </head>
    <body>
        <h1>Cập Nhật Câu Hỏi Thường Gặp</h1>
        <form action="update-faq" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${faq.questionID}">
            
            <label for="shortenedQuestion">Câu Hỏi:</label>
            <input type="text" id="shortenedQuestion" name="shortenedQuestion" value="${faq.shortenedQuestion}" required>
            
            <label for="question">Câu Hỏi Chi Tiết:</label>
            <textarea id="question" name="question" rows="4" required>${faq.question}</textarea>
            
            <label for="answer">Câu Trả Lời:</label>
            <textarea id="answer" name="answer" rows="6" required>${faq.answer}</textarea>
            
            <label for="image">Tải Ảnh Minh Họa:</label>
            <input type="file" id="image" name="image" accept="image/*">
            <img src="uploads/${faq.image}" alt="Current FAQ Image" width="100" height="80">
            
            <button type="submit">Cập Nhật</button>
        </form>
    </body>
</html>
