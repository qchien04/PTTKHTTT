<!-- SearchSupplierView.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Supplier</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .search-form {
            margin: 20px 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        .search-form input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .search-form button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            text-align: left;
        }
        table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        table tr:hover {
            background-color: #f5f5f5;
        }

    </style>
</head>
<body>
<div class="container">
    <h2>Tìm nhà cung cấp</h2>

    <form action="${pageContext.request.contextPath}/searchSupplier" method="get" class="search-form">
        <input type="text" name="keyword" placeholder="Nhập tên nhà cung cấp"
               value="${param.keyword}">
        <button type="submit">Tìm</button>
    </form>

    <c:if test="${not empty supplierList}">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Địa chỉ</th>
                <th>Email</th>
                <th>SDT</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${supplierList}" var="supplier">
                <tr onclick="window.location.href='${pageContext.request.contextPath}/importForm?supplierId=${supplier.id}';" style="cursor:pointer;">
                    <td>${supplier.id}</td>
                    <td>${supplier.name}</td>
                    <td>${supplier.address}</td>
                    <td>${supplier.email}</td>
                    <td>${supplier.phoneNumber}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty supplierList && not empty param.keyword}">
        <p >Không tìm thấy "${param.keyword}"</p>
    </c:if>

</div>
</body>
</html>