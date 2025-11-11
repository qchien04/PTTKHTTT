<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Import Invoice Details</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .invoice-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 800px;
            padding: 30px 40px;
        }

        h2 {
            text-align: center;
            color: #2e7d32;
            margin-bottom: 10px;
        }

        p.message {
            text-align: center;
            color: #666;
            margin-bottom: 25px;
        }

        .invoice-info {
            background-color: #e8f5e9;
            border-left: 4px solid #4caf50;
            padding: 15px 20px;
            border-radius: 6px;
            margin-bottom: 30px;
        }

        .invoice-info p {
            margin: 6px 0;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        table thead {
            background-color: #4CAF50;
            color: white;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }


        .total {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            color: #2e7d32;
        }

        .btn {
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 6px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn-secondary {
            background-color: #757575;
            color: #fff;
        }

    </style>
</head>
<body>
<div class="invoice-container">
    <h2>Nhập hàng thành công!</h2>

    <c:if test="${not empty invoice}">
        <div class="invoice-info">
            <p><strong>Mã đơn nhập:</strong>${invoice.id}</p>
            <p><strong>Nhà cung cấp:</strong> ${invoice.supplier.name}</p>
            <p><strong>Ngày nhập:</strong>
                <fmt:formatDate value="${invoice.importDate}" pattern="dd/MM/yyyy HH:mm"/>
            </p>
            <p><strong>Nhân viên kho:</strong> ${invoice.warehouseStaff.fullName}</p>
        </div>

        <h3>Hàng nhập</h3>
        <table>
            <thead>
            <tr>
                <th>STT</th>
                <th>Hàng</th>
                <th>Số lượng nhập</th>
                <th>Giá (₫)</th>
                <th>Ghi chú</th>
                <th>Tổng con(₫)</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${invoice.importItems}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${item.item.name}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price}</td>
                    <td>${item.note}</td>
                    <td>${item.quantity * item.price}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <c:set var="total" value="0" />
        <c:forEach var="item" items="${invoice.importItems}">
            <c:set var="total" value="${total + (item.quantity * item.price)}" />
        </c:forEach>

        <p class="total">
            Tổng đơn nhập:
            <fmt:formatNumber value="${total}" type="number" groupingUsed="true"/> ₫
        </p>
    </c:if>

        <a href="${pageContext.request.contextPath}/WarehouseStaffView/WareHouseStaffView.jsp" class="btn btn-secondary">Về trang chủ</a>
</div>
</body>
</html>
