<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="exam.qlst.Model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang khách hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f0f0f0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
        }
        .info-section {
            margin: 20px 0;
            padding: 15px;
            background: #f9f9f9;
            border-radius: 5px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <h2>Xin chào, <%= customer.getUsername() %>!</h2>

    <div class="info-section">
        <h3>Thông tin tài khoản</h3>
        <p><strong>Tên đăng nhập:</strong> <%= customer.getUsername() %></p>
        <p><strong>Trạng thái:</strong>
            <%= customer.isMember() ? "Thành viên" : "Khách hàng thường" %>
        </p>
    </div>

    <% if (!customer.isMember()) { %>
    <a href="${pageContext.request.contextPath}/RegisterMemberServlet" class="btn">Đăng ký thành viên</a>
    <% } else { %>
    <p style="color: green;">Bạn đã là thành viên của hệ thống!</p>
    <% } %>
</div>
</body>
</html>