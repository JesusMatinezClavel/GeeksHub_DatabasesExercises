CREATE DATABASE library;
USE library;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role_id INT,
    
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE roles (
	id INT AUTO_INCREMENT PRIMARY KEY,
	narre VARCHAR(50)
);

CREATE TABLE loans (
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT,
    book_id INT,
    loan_date DATETIME,
    due_date DATETIME,
    return_date DATETIME,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE books (
	id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(25),
    genre VARCHAR(50),
    author_id INT,
    
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE authors (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100),
    nationallity VARCHAR(100)
);

CREATE TABLE book_favorite (
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT,
    book_id INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);