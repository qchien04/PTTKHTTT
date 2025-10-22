<!-- index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Warehouse Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            padding: 40px;
            max-width: 800px;
            width: 100%;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 10px;
        }
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 40px;
            font-size: 14px;
        }
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .menu-item {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px 20px;
            border-radius: 8px;
            text-align: center;
            text-decoration: none;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0,0,0,0.2);
        }
        .menu-item.green {
            background: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
        }
        .menu-item.blue {
            background: linear-gradient(135deg, #2196F3 0%, #0b7dda 100%);
        }
        .menu-item.orange {
            background: linear-gradient(135deg, #FF9800 0%, #F57C00 100%);
        }
        .menu-icon {
            font-size: 40px;
            margin-bottom: 10px;
        }
        .menu-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .menu-description {
            font-size: 12px;
            opacity: 0.9;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            color: #999;
            font-size: 12px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>🏭 Warehouse Management System</h1>
    <p class="subtitle">Manage your inventory, suppliers, and import operations</p>

    <div class="menu-grid">

        <a href="searchSupplier" class="menu-item orange">
            <div class="menu-icon">📋</div>
            <div class="menu-title">Import Invoice</div>
            <div class="menu-description">Create new import invoice</div>
        </a>
    </div>

    <div class="footer">
        &copy; 2025 Warehouse Management System. All rights reserved.
    </div>
</div>
</body>
</html>