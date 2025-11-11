<!-- WareHouseStaffView.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Warehouse Management System</title>
    <style>
        body {
            font-family: sans-serif;
            background: #eee;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 30px 40px;
            border: 1px solid #000;
            border-radius: 10px;
            max-width: 600px;
            width: 100%;
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
            color: #222;
        }
        .menu {
            margin-top: 15px;
        }
        a.menu-item {
            display: inline-block;
            padding: 10px 20px;
            border: 1px solid #000;
            border-radius: 6px;
            margin: 10px 5px;
            color: white;
            background-color: #4CAF50;
        }

        .info-value {
            background: #f2f2f2;
            padding: 8px 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            color: #333;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #444;
            margin-top: 10px;
        }

    </style>
</head>
<body>
<div class="container">
    <h1>Hệ thống quản lý cho nhân viên kho</h1>

    <div class="info-item">
        <label>Nhân viên kho</label>
        <div class="info-value">${staff.fullName}</div>
    </div>

    <div class="menu">
        <a href="${pageContext.request.contextPath}/searchSupplier" class="menu-item">Nhập hàng</a>
    </div>
</div>
</body>
</html>
