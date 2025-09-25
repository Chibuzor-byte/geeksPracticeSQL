-- Drop tables if they exist (to avoid "already exists" errors)
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;

-- Create Products table first
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

-- Insert sample data into Products table
INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);


-- Now create Sales table (after Products exists)
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_date DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert sample data into Sales table
INSERT INTO Sales (sale_id, product_id, quantity_sold, sale_date, total_price) VALUES
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);


-- 1. Retrieve all columns from the Sales table
SELECT * FROM Sales;

-- 2. Retrieve the product_name and unit_price from the Products table.
SELECT product_name, unit_price
FROM Products;

-- 3. Retrieve the sale_id and sale_date from the Sales table.
SELECT sale_id, sale_date
FROM Sales;

-- 4. Filter the Sales table to show only sales with a total_price greater than $100.
SELECT * FROM Sales
WHERE total_price > 100;

-- 5. Filter the Products table to show only products in the 'Electronics' category.
SELECT * FROM Products
WHERE category = 'Electronics';

-- 6. Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.
SELECT sale_id, total_price
FROM Sales
WHERE sale_date = '2024-01-03';

--7. Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.
SELECT product_id, product_name
FROM Products
WHERE unit_price > 100;

-- 8. Calculate the total revenue generated from all sales in the Sales table.
SELECT SUM(total_price) AS total_revenue 
FROM Sales;

-- 9. Calculate the average unit_price of products in the Products table.
SELECT AVG(unit_price) AS average_unit_price
FROM Products;

-- 10. Calculate the total quantity_sold from the Sales table.
SELECT SUM(quantity_sold) AS total_quantity_sold
FROM Sales;

-- 11. Count Sales Per Day from the Sales table
SELECT sale_date, COUNT(*) AS sales_count 
FROM Sales 
GROUP BY sale_date 
ORDER BY sale_date;
