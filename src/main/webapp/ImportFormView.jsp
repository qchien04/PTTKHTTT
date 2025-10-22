<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Import Form</title>
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
            border-bottom: 2px solid #FF9800;
            padding-bottom: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        .form-group select, .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .items-section {
            margin-top: 30px;
            border-top: 2px solid #eee;
            padding-top: 20px;
        }
        .item-row {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 2fr auto;
            gap: 10px;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 4px;
        }
        .item-row input, .item-row select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-primary {
            background-color: #FF9800;
            color: white;
        }
        .btn-primary:hover {
            background-color: #F57C00;
        }
        .btn-success {
            background-color: #4CAF50;
            color: white;
        }
        .btn-success:hover {
            background-color: #45a049;
        }
        .btn-danger {
            background-color: #f44336;
            color: white;
        }
        .btn-danger:hover {
            background-color: #da190b;
        }
        .total-section {
            margin-top: 20px;
            padding: 15px;
            background-color: #e8f5e9;
            border-radius: 4px;
            text-align: right;
        }
        .total-section h3 {
            margin: 0;
            color: #2e7d32;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #FF9800;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Import Invoice Form</h2>
    <form action="importForm" method="post" id="importForm">
        <div class="form-group">
            <label>Mã Nhà Cung Cấp</label>
            <input type="text" name="supplierId" value="${selectedSupplier.id}" readonly class="readonly">

            <label>Tên Nhà Cung Cấp</label>
            <input type="text" name="supplierName" value="${selectedSupplier.name}" readonly class="readonly">

            <label>Địa chỉ</label>
            <input type="text" name="supplierAddress" value="${selectedSupplier.address}" readonly class="readonly">

            <label>Số điện thoại</label>
            <input type="text" name="supplierPhone" value="${selectedSupplier.phoneNumber}" readonly class="readonly">

        </div>

        <div class="form-group">
            <label>Nhân viên kho</label>
            <input type="text" name="warehouseStaff" value="W001 - Nguyễn Văn A" readonly class="readonly">
        </div>

        <div class="items-section">
            <h3>Import Items</h3>
            <div id="itemsContainer">
                <c:forEach items="${selectedItems}" var="importItem">
                    <div class="item-row">
                        <input type="text" name="item" value="${importItem.name}" readonly class="readonly">
                        <input type="number" name="quantity[]" placeholder="Quantity" min="1" required>
                        <input type="number" name="price[]" placeholder="Price" step="0.01" min="0" required>
                        <input type="text" name="note[]" placeholder="Note (optional)">
                        <button type="button" class="btn btn-danger" onclick="removeItem(this)">Remove</button>
                    </div>
                </c:forEach>
            </div>
            <a href="searchItems" style="text-decoration:none;">
                <button type="button" class="btn btn-primary">Thêm hàng nhập</button>
            </a>
        </div>

        <div class="total-section">
            <h3>Total: $<span id="totalAmount">0.00</span></h3>
        </div>

        <div style="margin-top: 20px;">
            <button type="submit" class="btn btn-success">Submit Import Invoice</button>
            <a href="index.jsp" class="back-link" style="margin-left: 20px;">Cancel</a>
        </div>
    </form>
</div>

<script>


    function removeItem(button) {
        const container = document.getElementById('itemsContainer');
        const rows = container.querySelectorAll('.item-row');

        if (rows.length > 1) {
            button.closest('.item-row').remove();
            calculateTotal();
        } else {
            alert('You must have at least one item!');
        }
    }

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

    // Add event listeners to calculate total when quantity or price changes
    document.addEventListener('input', function(e) {
        if (e.target.name === 'quantity[]' || e.target.name === 'price[]') {
            calculateTotal();
        }
    });

    // Validate form before submit
    document.getElementById('importForm').addEventListener('submit', function(e) {
        const quantities = document.querySelectorAll('input[name="quantity[]"]');
        const prices = document.querySelectorAll('input[name="price[]"]');

        let hasError = false;
        for (let i = 0; i < quantities.length; i++) {
            if (!quantities[i].value || quantities[i].value <= 0) {
                alert('Please enter valid quantity for all items!');
                hasError = true;
                break;
            }
            if (!prices[i].value || prices[i].value < 0) {
                alert('Please enter valid price for all items!');
                hasError = true;
                break;
            }
        }

        if (hasError) {
            e.preventDefault();
        }
    });
</script>
</body>
</html>