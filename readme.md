Ecommerce Product Inventory Database:
This database is designed to manage product inventory for an ecommerce business. It consists of tables for customers, suppliers, categories, products and orders.

Intended Use:
Customers Table: Stores information about customers, including their name, contact details and address.
Suppliers Table: Contains details of suppliers, such as their name, contact person and address.
Categories Table: Stores different product categories along with descriptions.
Products Table: Contains information about products, including their name, category, supplier, stock quantity and description.
Orders Table: Tracks customer orders, including order date, total amount and status.

Keys:
Primary keys: category_id (Categories), suplier_id (Suppliers), product_id (Products), customer_id (Customers), order_id (Orders)
Foreign keys: category_id (Products, references Categories), supplier_id (Products, references Suppliers), customer_id (Orders, references Customers), product_id (Orders, references Products)

-> A primary key uniquely identifies each record in a table, ensuring data integrity and providing a reference point for relationships between tables.
-> A foreign key establishes a relationship between two tables by referencing the primary key of another table, enforcing referential integrity and allowing data to be linked across tables.

Constraints:
fk_product_id: To add a foreign key product_id that references to the Products table
ALTER COLUMN status SET DEFAULT 'Unknown': To alter the Orders table to set the default value of a column status as 'Unknown'
ALTER COLUMN product_id SET NOT NULL: To alter the Products table to set the column product_id to prohibit use of null values

-> Constraints are rules applied to columns in a table to enforce data integrity, ensuring that data meets specific conditions or requirements with other data.

Using Data Manipulation Language (DML) commands to modify tables having data -
DML commands are used to interact with and manipulate data within a database. The main SQL DML commands are:
INSERT: Adds new records to a table. Eg: INSERT INTO Customers (customer_id, customer_name) VALUES (1, 'John Doe');
UPDATE: Modifies existing records in a table. Eg: UPDATE Customers SET customer_name = 'Jane Smith' WHERE customer_id = 1;
DELETE: Removes records from a table. Eg: DELETE FROM Customers WHERE customer_id = 1;
SELECT: Retrieves data from a table based on specified criteria. Eg: SELECT * FROM Customers WHERE city = 'New York';

Using Data Definition Language (DDL) commands to change the data definition structure of tables - 
DDL commands are used to define, modify, and remove database objects. The main SQL DDL commands are:
CREATE: Creates new database objects such as tables, views, indexes or schemas.
ALTER: Modifies the structure of existing database objects, like adding, modifying or dropping columns.
DROP: Deletes existing database objects, such as tables, views, indexes or schemas.
TRUNCATE: Removes all data from a table, but keeps the table structure intact.
RENAME: Renames an existing database object, such as a table or column.

Reference Links:
W3Schools: https://www.w3schools.com/sql/default.asp
PostgreSQL Tutorial: https://www.postgresqltutorial.com/postgresql-getting-started/what-is-postgresql/

Queries/Views:
total_sales Subquery: Shows total sales by product
order_date Subquery: Fetches customer orders by order date
MonthlySalesRevenue View: Shows total sales revenue on a monthly basis.
CategorySalesRevenue View: Presents total sales revenue by product category.
SupplierPerformance View: Indicates the performance of suppliers based on the number of products supplied.

-> Use SELECT * FROM ViewName to invoke the the already existing views, this can be done as they're stored on the computer
-> Subqueries need to be executed by selecting the entire query together as they're not stored on the computer

How to Update:
To update the database - 
Modify the SQL queries/views according to your requirements.
Execute the queries to insert, update or delete data from the tables or also alter the table structure as needed.
Use views to analyze/monitor sales performance and inventory status, you can also modify these views to your liking or create more to keep track of various aspects of your ecommerce business.
Feel free to customize the database schema and queries to suit your specific ecommerce needs.

-> You can refer to various resources online to implement update or  queries such as W3Schools, official PostgreSQL tutorials and documentation, etc.