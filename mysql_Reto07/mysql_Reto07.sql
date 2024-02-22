CREATE DATABASE mysql_Reto07;
USE mysql_Reto07;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE users
ADD FOREIGN KEY (comment_id) REFERENCES comments(id);

CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    product_name VARCHAR(50),
    product_description VARCHAR(200),
    product_price INT,
    seller VARCHAR(50),
    
    FOREIGN KEY (transaction_id) REFERENCES products_transactions(id)
);

CREATE TABLE transactions (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(50),
    seller VARCHAR (50),
    product_price INT,
    total_price INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id)    
);

CREATE TABLE products_transactions (
	id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    
    FOREIGN KEY (transaction_id) REFERENCES transactions(id)
);


CREATE TABLE comments (
	id INT AUTO_INCREMENT PRIMARY KEY,	
    user_id INT,
    comment VARCHAR(200),
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);