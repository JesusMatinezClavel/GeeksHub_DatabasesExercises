CREATE DATABASE mysql_Reto08;
USE mysql_Reto08;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE movies(
	id INT AUTO_INCREMENT PRIMARY KEY,
    reproduction_id INT,
	movie_name VARCHAR(100),
    movie_genre VARCHAR(100),
    movie_duration INT,
    movie_actors VARCHAR(200),
    movie_director VARCHAR(50),
    commendation VARCHAR(200),
    
    FOREIGN KEY (reproduction_id) REFERENCES list_movies(id)
);

CREATE TABLE reproduction_list (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    list_number INT,
    list_movies VARCHAR(100),
    list_duration INT,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE list_movies (
	id INT AUTO_INCREMENT PRIMARY KEY,
    list_id INT,
    
    FOREIGN KEY (list_id) REFERENCES reproduction_list(id)
);

CREATE TABLE commendations (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    username VARCHAR(50),
    movie_name VARCHAR(100),
    comment VARCHAR(200),
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);