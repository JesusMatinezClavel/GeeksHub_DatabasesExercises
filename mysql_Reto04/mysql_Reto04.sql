CREATE DATABASE mysql_Reto04;
USE mysql_Reto04;

CREATE TABLE xusers(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
	email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    products_quant INT,
    products_name VARCHAR(60),
    price INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES xusers(id)
);

DROP TABLE orders;

CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
	product_name VARCHAR(50),
    product_description VARCHAR(50),
    product_price INT,
    product_stock INT
);

ALTER TABLE products
ADD FOREIGN KEY (order_id) REFERENCES product_order(id);

DROP TABLE products;

CREATE TABLE product_order(
	id INT AUTO_INCREMENT PRIMARY KEY,
	product_id INT,
    order_id INT,
    
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

ALTER TABLE product_order
DROP FOREIGN KEY product_order_ibfk_1;