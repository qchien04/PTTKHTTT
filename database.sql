


CREATE TABLE tblCustomer (id int(10) NOT NULL AUTO_INCREMENT, fullName varchar(255), dob date, address varchar(255), phoneNumber varchar(255) UNIQUE, email varchar(255) NOT NULL UNIQUE, username varchar(255) NOT NULL UNIQUE, password varchar(255) NOT NULL, isMember int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblImportInvoice (id int(10) NOT NULL AUTO_INCREMENT, importDate date NOT NULL, Supplierid int(10) NOT NULL, WareHouseStaffid int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblImportItem (id int(10) NOT NULL AUTO_INCREMENT, quantity varchar(255) NOT NULL, price double NOT NULL, note varchar(255), Itemid int(10) NOT NULL, ImportInvoiceid int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblItem (id int(10) NOT NULL AUTO_INCREMENT, name varchar(255) NOT NULL, type varchar(255), unit varchar(255) NOT NULL, stockQuantity int(10) NOT NULL, unitPrice double NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblOnlineOrder (id int(10) NOT NULL AUTO_INCREMENT, orderDate date NOT NULL, status varchar(255) NOT NULL, Customerid int(10) NOT NULL, WareHouseStaffid int(10), DeliveryStaffid int(10), PRIMARY KEY (id));
CREATE TABLE tblOrderItem (id int(10) NOT NULL AUTO_INCREMENT, quantity int(10) NOT NULL, price double NOT NULL, Itemid int(10) NOT NULL, OnlineOrderid int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblSalesInvoice (id int(10) NOT NULL AUTO_INCREMENT, salesDate date NOT NULL, Customerid int(10) NOT NULL, SalesStaffid int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblSalesItem (id int(10) NOT NULL AUTO_INCREMENT, quantity int(10) NOT NULL, price double NOT NULL, Itemid int(10) NOT NULL, SalesInvoiceid int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblStaff (id int(10) NOT NULL AUTO_INCREMENT, fullName varchar(255) NOT NULL, username varchar(255) NOT NULL UNIQUE, password varchar(255) NOT NULL, phoneNumber varchar(255) NOT NULL UNIQUE, email varchar(255) NOT NULL UNIQUE, address varchar(255) NOT NULL, role varchar(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE tblSupplier (id int(10) NOT NULL AUTO_INCREMENT, name varchar(255) NOT NULL, address varchar(255) NOT NULL, email varchar(255) NOT NULL UNIQUE, phoneNumber varchar(255) NOT NULL UNIQUE, PRIMARY KEY (id));
ALTER TABLE tblOrderItem ADD CONSTRAINT FKtblOrderIt709130 FOREIGN KEY (Itemid) REFERENCES tblItem (id);
ALTER TABLE tblSalesItem ADD CONSTRAINT FKtblSalesIt839932 FOREIGN KEY (Itemid) REFERENCES tblItem (id);
ALTER TABLE tblImportItem ADD CONSTRAINT FKtblImportI477623 FOREIGN KEY (Itemid) REFERENCES tblItem (id);
ALTER TABLE tblImportItem ADD CONSTRAINT FKtblImportI716758 FOREIGN KEY (ImportInvoiceid) REFERENCES tblImportInvoice (id);
ALTER TABLE tblOrderItem ADD CONSTRAINT FKtblOrderIt990658 FOREIGN KEY (OnlineOrderid) REFERENCES tblOnlineOrder (id);
ALTER TABLE tblSalesItem ADD CONSTRAINT FKtblSalesIt84167 FOREIGN KEY (SalesInvoiceid) REFERENCES tblSalesInvoice (id);
ALTER TABLE tblImportInvoice ADD CONSTRAINT FKtblImportI322863 FOREIGN KEY (Supplierid) REFERENCES tblSupplier (id);
ALTER TABLE tblImportInvoice ADD CONSTRAINT FKtblImportI13054 FOREIGN KEY (WareHouseStaffid) REFERENCES tblStaff (id);
ALTER TABLE tblSalesInvoice ADD CONSTRAINT FKtblSalesIn384196 FOREIGN KEY (Customerid) REFERENCES tblCustomer (id);
ALTER TABLE tblOnlineOrder ADD CONSTRAINT FKtblOnlineO393471 FOREIGN KEY (Customerid) REFERENCES tblCustomer (id);
ALTER TABLE tblSalesInvoice ADD CONSTRAINT FKtblSalesIn543945 FOREIGN KEY (SalesStaffid) REFERENCES tblStaff (id);
ALTER TABLE tblOnlineOrder ADD CONSTRAINT FKtblOnlineO120040 FOREIGN KEY (WareHouseStaffid) REFERENCES tblStaff (id);
ALTER TABLE tblOnlineOrder ADD CONSTRAINT FKtblOnlineO3408 FOREIGN KEY (DeliveryStaffid) REFERENCES tblStaff (id);



INSERT INTO tblsupplier (name, address, email, phoneNumber) VALUES
('ABC Supplies Co.', '123 Main St, New York', 'contact@abcsupplies.com', '555-0101'),
('XYZ Trading Ltd.', '456 Oak Ave, Los Angeles', 'info@xyztrading.com', '555-0102'),
('Global Warehouse Inc.', '789 Pine Rd, Chicago', 'sales@globalwarehouse.com', '555-0103');

INSERT INTO tblstaff (fullName, userName, password, phoneNumber, email, address, role) VALUES
('John Doe', 'admin', 'admin123', '555-1001', 'john@warehouse.com', '100 Admin St', 'Manager Staff'),
('Jane Smith', 'staff1', 'pass123', '555-1002', 'jane@warehouse.com', '200 Staff Ave', 'WareHouse Staff'),
('Bob Johnson', 'staff2', 'pass456', '555-1003', 'bob@warehouse.com', '300 Worker Ln', 'Sale Staff');

INSERT INTO tblitem (name, type, unit, stockQuantity, unitPrice) VALUES
('Laptop Dell XPS 13', 'Electronics', 'pcs', 50, 1200.00),
('Mouse Logitech MX', 'Electronics', 'pcs', 150, 45.00),
('Keyboard Mechanical', 'Electronics', 'pcs', 80, 120.00),
('Monitor 27 inch', 'Electronics', 'pcs', 30, 350.00),
('USB Cable Type-C', 'Accessories', 'pcs', 500, 8.00),
('HDMI Cable 2m', 'Accessories', 'pcs', 300, 12.00),
('Desk Lamp LED', 'Furniture', 'pcs', 100, 35.00),
('Office Chair', 'Furniture', 'pcs', 25, 250.00);

INSERT INTO tblCustomer (username, password, fullName, dob, phoneNumber, email, isMember) 
VALUES 
    ('customer1', 'password123', NULL, NULL, NULL, "nguyenvana2@email.com", FALSE),
    ('customer2', 'password456', NULL, NULL, NULL, "nguyenvana32@email.com", FALSE),
    ('customer3', 'password789', 'Nguyen Van A', '1990-05-15', '0123456789', 'nguyenvana@email.com', TRUE);


