<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="exam.qlst.Model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả đăng ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 20px;
        }
        .result-container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success {
            color: #4CAF50;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .error {
            color: #f44336;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .info {
            text-align: left;
            margin: 20px 0;
            padding: 15px;
            background: #f9f9f9;
            border-radius: 5px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        .btn:hover {
            background-color: #0b7dda;
        }
    </style>
</head>
<body>
<div class="result-container">
    <%
        Boolean result = (Boolean) request.getAttribute("registrationResult");
        Customer customer = (Customer) request.getAttribute("customer");

        if (result != null && result) {
    %>
    <div class="success">✓ Đăng ký thành viên thành công!</div>

    <div class="info">
        <h3>Thông tin thành viên:</h3>
        <p><strong>Họ và tên:</strong> <%= customer.getFullName() %></p>
        <p><strong>Ngày sinh:</strong> <%= customer.getDob() %></p>
        <p><strong>Số điện thoại:</strong> <%= customer.getPhoneNumber() %></p>
        <p><strong>Email:</strong> <%= customer.getEmail() %></p>
        <p><strong>Trạng thái:</strong> <span style="color: green;">Thành viên</span></p>
    </div>

    <p>Chúc mừng bạn đã trở thành thành viên của hệ thống!</p>
    <%
    } else {
    %>
    <div class="error">✗ Đăng ký thành viên thất bại!</div>
    <p>Vui lòng thử lại sau hoặc liên hệ với quản trị viên.</p>
    <%
        }
    %>

    <a href="CustomerView.jsp" class="btn">Quay lại trang chủ</a>
</div>
</body>
</html>