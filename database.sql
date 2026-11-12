CREATE DATABASE IF NOT EXISTS student_courses_db;
USE student_courses_db;

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS instructors;

CREATE TABLE instructors(
    instructors_id INT PRIMARY KEY AUTO_INCREMENT,
    instructors_name VARCHAR(100) NOT NULL,
    instructors_email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE students(
    students_id INT PRIMARY KEY AUTO_INCREMENT,
    students_full_name VARCHAR(100) NOT NULL,
    students_birth_date DATE
);

CREATE TABLE courses(
    courses_id INT PRIMARY KEY AUTO_INCREMENT,
    courses_title VARCHAR(100) NOT NULL,
    instructors_id INT NOT NULL,
    FOREIGN KEY (instructors_id) REFERENCES instructors(instructors_id)
);

CREATE TABLE enrollments(
    enrollments_id INT PRIMARY KEY AUTO_INCREMENT,
    students_id INT NOT NULL,
    courses_id INT NOT NULL,
    FOREIGN KEY (students_id) REFERENCES students(students_id),
    FOREIGN KEY (courses_id) REFERENCES courses(courses_id),
    CONSTRAINT unique_students_courses UNIQUE (students_id, courses_id)
);

INSERT INTO instructors(instructors_name, instructors_email) VALUES
('Mr. Phung Minh Duc', 'ducpm@gm.uit.edu.vn'),
('Mr. Oach Van Chuong', 'chuongov@gm.uit.edu.vn'),
('Mrs. Ho Thi Minh Phuong', 'phuonghtm@gm.uit.edu.vn'),
('Mrs. Lam Ngoc Linh', 'linhln@gm.ussh.edu.vn');

INSERT INTO courses(courses_title, instructors_id) VALUES
('Dai So Tuyen Tinh', 1),
('Giai Tich', 2),
('Nhap Mon Lap Trinh', 3),
('Triet Hoc Mac-Lenin', 4);

INSERT INTO students(students_full_name, students_birth_date) VALUES
('Nguyen Minh Duc', '2008-03-07'),
('Nguyen Anh Tho', '2008-10-18'),
('Pham Tien Anh Duc', '2008-06-03'),
('Dang Thi Thao Nguyen', '2008-06-04'),
('Nguyen Thi Truc Quynh', '2008-01-06'),
('Nguyen Yen Nhi', '2008-02-06');

INSERT INTO enrollments(students_id, courses_id) VALUES
(1, 1), (1, 2), 
(2, 1), (2, 3), 
(3, 2), (3, 3), 
(4, 1), (4, 3);

