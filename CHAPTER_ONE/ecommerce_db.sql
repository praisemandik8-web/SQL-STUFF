CREATE DATABASE Ecommerce;

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
    );

    
    CREATE TABLE products (
	products_id INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL (50),
    quantity_in_store INT(50),
    quantity_sold INT (50)
    );
    
    
     CREATE TABLE orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL (50),
    quantity_sold INT(50)
    );