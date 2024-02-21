CREATE DATABASE mysql_Reto03;
USE mysql_Reto03;

DROP TABLE students;

CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
    grade VARCHAR(40),
	email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE courses(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_name VARCHAR(50) NOT NULL,
	course_description VARCHAR(200) NOT NULL,
    number_lessons INT,
    date_start DATE,
    date_finish DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE course_student(
	id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE lessons(
	id INT AUTO_INCREMENT PRIMARY KEY,
	student_id INT,
    lesson_name VARCHAR(50) NOT NULL,
	lesson_description VARCHAR(200) NOT NULL,
    time_to_finish VARCHAR(20),
    
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE tasks(
	id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
	task_name VARCHAR(50),
    task_description VARCHAR(50),
    time_to_finish VARCHAR(30),
    
    foreign key (student_id) REFERENCES students(id)
);