<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Import Form</title>
    <style>
        body {
            font-family: sans-serif;
            background: #f5f5f5;
            margin: 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: #fff;
            padding: 25px 30px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #222;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #444;
            margin-top: 10px;
        }
        .info-value {
            background: #f2f2f2;
            padding: 8px 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            color: #333;
        }

        input[readonly] {
            background: #f2f2f2;
        }
        input {
            width: 90%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px 10px;
            text-align: left;
        }
        th {
            background: #ff9800;
            color: white;
        }
        .btn {
            padding: 8px 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-primary { background: #ff9800; color: white; }
        .btn-success { background: #4caf50; color: white; }
        .btn-danger { background: #f44336; color: white; }

        .total-section {
            text-align: right;
            margin-top: 15px;
            padding: 10px;
            background: #e8f5e9;
            border-radius: 4px;
        }
        .double{
            display: flex;
            width: 100%;
            gap:10px;
        }
        .double-item{
            width: 100%;
        }


    </style>
</head>
<body>
<div class="container">
    <h2>Phiếu nhập hàng</h2>

    <div class="double">
        <div class="double-item">
            <div class="info-item">
                <label>Mã Nhà Cung Cấp</label>
                <div class="info-value">${selectedSupplier.id}</div>
            </div>
            <div class="info-item">
                <label>Tên Nhà Cung Cấp</label>
                <div class="info-value">${selectedSupplier.name}</div>
            </div>
            <div class="info-item">
                <label>Địa chỉ</label>
                <div class="info-value">${selectedSupplier.address}</div>
            </div>
        </div>

        <div class="double-item">
            <div class="info-item">
                <label>Số điện thoại</label>
                <div class="info-value">${selectedSupplier.phoneNumber}</div>
            </div>
            <div class="info-item">
                <label>Nhân viên kho</label>
                <div class="info-value">${staff.fullName}</div>
            </div>
        </div>
    </div>

    <h3 style="margin-top:30px;">Danh sách hàng nhập</h3>
    <form action="${pageContext.request.contextPath}/importForm" method="post" id="importForm">
        <table id="itemsTable">
            <thead>
            <tr>
                <th>Tên hàng</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Ghi chú</th>
                <th>Tùy chọn</th>
            </tr>
            </thead>
            <tbody id="itemsContainer">
            <c:forEach items="${selectedItems}" var="item">
                <tr>
                    <td><input type="text" name="item" value="${item.name}" readonly></td>
                    <td><input type="number" name="quantity[]" min="1" required></td>
                    <td><input type="number" name="price[]" step="0.01" min="0" required></td>
                    <td><input type="text" name="note[]" placeholder="Note (optional)"></td>
                    <td><a href="importForm?del=${item.id}" class="btn btn-danger">Xóa</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div style="margin-top:15px;">
            <a href="${pageContext.request.contextPath}/searchItems" style="text-decoration:none;">
                <button type="button" class="btn btn-primary">+ Thêm hàng nhập</button>
            </a>
        </div>

        <div class="total-section">
            <h3>Tổng cộng: $<span id="totalAmount">0.00</span></h3>
        </div>

        <div style="margin-top: 20px;">
            <button type="submit" class="btn btn-success">Lưu</button>
        </div>
    </form>
</div>

<script>
    function calculateTotal() {
        const quantities = document.querySelectorAll('input[name="quantity[]"]');
        const prices = document.querySelectorAll('input[name="price[]"]');
        let total = 0;
        for (let i = 0; i < quantities.length; i++) {
            const qty = parseFloat(quantities[i].value) || 0;
            const price = parseFloat(prices[i].value) || 0;
            total += qty * price;
        }
        document.getElementById('totalAmount').textContent = total.toFixed(2);
    }

    document.addEventListener('input', function(e) {
        if (e.target.name === 'quantity[]' || e.target.name === 'price[]') {
            calculateTotal();
        }
    });

</script>
</body>
</html>
