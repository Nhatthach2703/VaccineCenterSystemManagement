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
        <title>Cập Nhật Tin Tức</title>
    </head>
    <body>
        <h1>Cập Nhật Tin Tức</h1>
        <form action="update-news" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${news.newID}">
            
            <label for="title">Tiêu Đề:</label>
            <input type="text" id="title" name="title" value="${news.title}" required>
            
            <label for="content">Nội Dung:</label>
            <textarea id="content" name="content" rows="6" required>${news.content}</textarea>
            
            <label for="doctorID">Bác Sĩ:</label>
            <input type="text" id="doctorID" name="doctorID" value="${news.doctorID}" required>
            
            <label for="date">Ngày:</label>
            <input type="date" id="date" name="date" value="${news.date}" required>
            
            <label for="image">Tải Ảnh Minh Họa:</label>
            <input type="file" id="image" name="image" accept="image/*">
            <img src="uploads/${news.image}" alt="Current News Image" width="100" height="80">
            
            <button type="submit">Cập Nhật</button>
        </form>
    </body>
</html>
