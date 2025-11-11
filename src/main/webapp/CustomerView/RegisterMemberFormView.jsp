<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký thành viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 20px;
        }
        .form-container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-submit:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Đăng ký thành viên</h2>

    <% if (request.getAttribute("error") != null) { %>
    <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/RegisterMemberServlet" method="post">
        <div class="form-group">
            <label for="fullName">Họ và tên: *</label>
            <input type="text" id="fullName" name="fullName" required>
        </div>

        <div class="form-group">
            <label for="dob">Ngày sinh: *</label>
            <input type="date" id="dob" name="dob" required>
        </div>

        <div class="form-group">
            <label for="phoneNumber">Số điện thoại: *</label>
            <input type="tel" id="phoneNumber" name="phoneNumber"
                   pattern="[0-9]{10}" placeholder="0123456789" required>
        </div>

        <div class="form-group">
            <label for="email">Email: *</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="address">Địa chỉ: *</label>
            <input type="text" id="address" name="address" required>
        </div>

        <button type="submit" class="btn-submit">Đăng ký thành viên</button>
    </form>
</div>
</body>
</html>