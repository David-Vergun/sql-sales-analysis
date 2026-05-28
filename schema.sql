CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'John Smith', 'Berlin'),
(2, 'Emma Brown', 'Hamburg'),
(3, 'Michael Lee', 'Munich');

INSERT INTO products VALUES
(1, 'Laptop', 1200.00),
(2, 'Keyboard', 80.00),
(3, 'Mouse', 40.00);

INSERT INTO orders VALUES
(1, 1, 1, 1, '2025-01-10'),
(2, 1, 2, 2, '2025-01-11'),
(3, 2, 3, 3, '2025-01-15'),
(4, 3, 1, 1, '2025-01-20');
