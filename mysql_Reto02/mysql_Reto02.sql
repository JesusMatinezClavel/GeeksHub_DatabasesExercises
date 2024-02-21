CREATE DATABASE mysql_Reto02;
USE mysql_Reto02;

CREATE TABLE xusers(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
	email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE restaurants(
	id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT,
    user_id INT,
	name VARCHAR(40)NOT NULL,
    type VARCHAR(40) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(12) NOT NULL,
	addres VARCHAR(100) NOT NULL,
    schedule TIME,
    Coments VARCHAR(400)
);

CREATE TABLE reserve(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    client_name VARCHAR(50)NOT NULL,
    client_phone VARCHAR(12)NOT NULL,
    restaurant_name VARCHAR(60),
    reservation_date DATE,
    reservation_time TIME,
    addres VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comments(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    client_name VARCHAR(50),
    comment VARCHAR(400),
    calification INT,
    
    FOREIGN KEY (user_id) REFERENCES xusers(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

ALTER TABLE restaurants
ADD FOREIGN KEY (user_id) REFERENCES xusers(id);

ALTER TABLE reserve
DROP FOREIGN KEY reserve_ibfk_2;

ALTER TABLE xusers
CHANGE fidelity_poins fidelity_points INT;

DROP TABLE restaurants;
DROP TABLE reserve;
DROP TABLE xusers;
