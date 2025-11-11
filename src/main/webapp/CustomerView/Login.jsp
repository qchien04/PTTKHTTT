<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #dddddd;
        }

        .login-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            border:1px solid #333333;
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-header h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn-login {
            width: 100%;
            padding: 12px;
            color: white;
            border: none;
            background-color: #4CAF50;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        <h2>Đăng nhập hệ thống nhân viên</h2>
    </div>

    <% if (request.getAttribute("error") != null) { %>
    <div>
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username"
                   placeholder="Nhập tên đăng nhập" required autofocus>
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password"
                   placeholder="Nhập mật khẩu" required>
        </div>

        <button type="submit" class="btn-login">Đăng nhập</button>
    </form>

</div>
</body>
</html>