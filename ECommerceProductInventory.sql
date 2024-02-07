CREATE TABLE Customers ( --Customers table containing all customer attributes
  customer_id INT,
  first_name VARCHAR,
  last_name VARCHAR,
  email VARCHAR,
  phone VARCHAR,
  address TEXT,
  PRIMARY KEY (customer_id) --Primary key customer_id field that has unique values and can be used to reference values to Orders table
);	
SELECT * FROM Customers --Statement used to select all rows and columns from the Customers table

CREATE TABLE Orders ( --Orders table that acts as a junction between the Products and customers tables, contains all order attributes
  order_id INT,
  customer_id INT,
  order_date TIMESTAMP,
  total_amount NUMERIC,
  status VARCHAR,
  --shipping_address TEXT,
  PRIMARY KEY (order_id), --Primary key order_id field that has unique values
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) --Foreign key customer_id field used to reference values from the Customers table
);

--Statement used to alter the Orders table to add a column product_id of integer type and make it a foreign key by adding a constraint:
ALTER TABLE Orders
ADD COLUMN product_id INT,
ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES Products(product_id); --Foreign key product_id field used to reference values from the Products table

ALTER TABLE Orders
DROP COLUMN shipping_address; --Statement used to alter the Orders table to drop a column shipping_address

ALTER TABLE Orders
ALTER COLUMN status SET DEFAULT 'Unknown'; --Constraint used to alter the Orders table to set the default value of a column status as 'Unknown'

SELECT * FROM Orders --Statement used to select all rows and columns from the Orders table

CREATE TABLE Suppliers ( --Customers table containing all supplier attributes
  supplier_id INT,
  supplier_name VARCHAR,
  contact_person VARCHAR,
  email VARCHAR,
  phone VARCHAR,
  address TEXT,
  PRIMARY KEY (supplier_id) --Primary key supplier_id field that has unique values and can be used to reference values to Products table
);
SELECT * FROM Suppliers --Statement used to select all rows and columns from the Suppliers table

CREATE TABLE Categories ( --Customers table containing all categories attributes
  category_id INT,
  category_name VARCHAR,
  description TEXT,
  PRIMARY KEY (category_id) --Primary key category_id field that has unique values and can be used to reference values to Products table
);
SELECT * FROM Categories --Statement used to select all rows and columns from the Categories table

CREATE TABLE Products ( --Products table that acts as a junction between the categories and suppliers tables, contains all product attributes
  product_id INT,
  product_name VARCHAR,
  category_id INT,
  supplier_id INT,
  --price NUMERIC,
  stock_quantity INT,
  description TEXT,
  PRIMARY KEY (product_id), --Primary key product_id field that has unique values and can be used to reference values to Orders table
  FOREIGN KEY (category_id) REFERENCES Categories(category_id), --Foreign key category_id field used to reference values from the Categories table
  FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) --Foreign key supplier_id field used to reference values from the Suppliers table
);

ALTER TABLE Products
DROP COLUMN price; --Statement used to alter the Prodcuts table to drop a column price

ALTER TABLE Products
ALTER COLUMN product_id SET NOT NULL; --Constraint used to alter the Products table to set the column product_id to prohibit use of null values

SELECT * FROM Products --Statement used to select all rows and columns from the Prodcuts table

--Insert statement used to insert values to the Customers table using its fields: 
INSERT INTO Customers (customer_id, first_name, last_name, email, phone, address)
VALUES
(1, 'Lloyd', 'Kasal', 'lloydkasal456@gmail.com', '4378482699', 'Mississauga'),
(2, 'Weedle', 'Monteiro', 'weedlemonteiro@gmail.com', '1234567890', 'Mississauga'),
(3, 'Will', 'Edwards', 'willedwards@gmail.com', '9876543210', 'Toronto');
SELECT * FROM Customers

--Insert statement used to insert values to the Suppliers table using its fields: 
INSERT INTO Suppliers (supplier_id, supplier_name, contact_person, email, phone, address)
VALUES
(1, 'Dell Canada', 'Liam', 'dellcanada@gmail.com', '1111222333', 'Toronto'),
(2, 'Toshiba Canada Ltd', 'Ava', 'toshibacanadaltd@gmail.com', '2222333444', 'Markham'),
(3, 'Bauer Systems Group', 'John', 'bauersystemsgroup@gmail.com', '3333444555', 'Burlington');
SELECT * FROM Suppliers

--Insert statement used to insert values to the Categories table using its fields: 
INSERT INTO Categories (category_id, category_name, description)
VALUES
(1, 'Electronics', 'Includes electronic gadgets and devices'),
(2, 'Automotive', 'Car parts, accessories and maintenance'),
(3, 'Home & Garden', 'Furniture, appliances and decor');
SELECT * FROM Categories

--Insert statement used to insert values to the Products table using its fields: 
INSERT INTO Products (product_id, product_name, category_id, supplier_id, stock_quantity, description)
VALUES
(1, 'Dell XPS 15 Laptop', 1, 1, 10, 'Premium laptop with a stunning display and powerful performance'),
(2, 'Toshiba Tecra', 1, 2, 20, 'Business laptop with robust features and durability'),
(3, 'Bauer PowerPro', 3, 3, 50, 'Portable generator for backup power needs');
SELECT * FROM Products

--Insert statement used to insert values to the Orders table using its fields: 
INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status, product_id)
VALUES
(1, 3, '2024-02-15', 50, 'Pending', 2),
(2, 1, '2024-02-20', 75, 'Delivered', 3),
(3, 2, '2024-02-25', 100, 'Shipped', 1);
SELECT * FROM Orders

--Query to calculate total sales by product:
SELECT p.product_name, SUM(o.total_amount) AS total_sales
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_name;

--Query to fetch customer orders by order date:
SELECT CONCAT(first_name, ' ', last_name) AS customer_name, o.order_id, o.order_date, p.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
ORDER BY o.order_date DESC;

--View to display monthly sales revenue:
CREATE VIEW MonthlySalesRevenue AS
SELECT EXTRACT(MONTH FROM o.order_date) AS month, EXTRACT(YEAR FROM o.order_date) AS year,
       SUM(o.total_amount) AS total_revenue
FROM Orders o
GROUP BY year, month
ORDER BY year, month;
SELECT * FROM MonthlySalesRevenue

--View to display total sales revenue by product category:
CREATE VIEW CategorySalesRevenue AS
SELECT c.category_name, SUM(o.total_amount) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.category_name;
SELECT * FROM CategorySalesRevenue

--View to display supplier performance based on number of products supplied by supplier:
CREATE VIEW SupplierPerformance AS
SELECT s.supplier_id, s.supplier_name, COUNT(p.product_id) AS products_supplied
FROM Suppliers s
JOIN Products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name;
SELECT * FROM SupplierPerformance






