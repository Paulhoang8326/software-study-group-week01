-- Active: 1794667649327@@127.0.0.1@3306@student_courses_management
CREATE DATABASE student_courses_management;

USE student_courses_management;

CREATE TABLE students (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    gender ENUM('Male','Female') NOT NULL,
    birth_date DATE NOT NULL,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
)

CREATE TABLE instructors (
    instructor_id VARCHAR(10) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    gender ENUM('Male','Female') NOT NULL,
    birth_date DATE NOT NULL,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
)

CREATE TABLE courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name NVARCHAR(100) NOT NULL,
    instructor_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
)

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(10) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE (student_id, course_id)
)

INSERT INTO students(student_id, full_name, gender, birth_date, phone_number, email) VALUES
('25520244', 'Trần Bảo Đăng', 'Male', '2007-09-21', '0123456789', 'tranbaodang@gmail.com'),
('25520302', 'Võ Văn Đạt', 'Male', '2007-01-01', '0987654321', 'vovandat@uit.edu.vn'),
('24520123', 'Võ Trần Ngọc Vy', 'Female', '2006-01-02', '0546372819', 'voctrangocvy@gm.uit.edu.vn'),
('26520001', 'Nguyễn Gia Hưng', 'Male', '2008-07-15', '0918273645', 'hungcubuso1vn@codeforces.com'),
('25520211', 'Phan Nguyễn Quốc Bảo', 'Male', '2007-12-01', '0981273645', 'phannguyenquocbao@example.com');

INSERT INTO instructors(instructor_id, full_name, gender, birth_date, phone_number, email) VALUES
('I001', 'Lương Ngọc Hoàng', 'Male', '1990-09-21', '0123456780', 'hoangnl@uit.edu.vn'),
('I002', 'Nguyễn Duy Khánh', 'Male', '1991-01-01', '0987654320', 'khanhnd@uit.edu.vn'),
('I003', 'Nguyễn Thanh Sơn', 'Male', '1989-01-02', '0546372810', 'sonnt@uit.edu.vn'),
('I004', 'Trần Hoàng Lộc', 'Male', '1988-07-15', '0918273640', 'locth@uit.edu.vn');


INSERT INTO courses(course_id, course_name, instructor_id) VALUES
('CS115', 'Toán cho khoa học máy tính', 'I001'),
('IT002', 'Lập trình hướng đối tượng', 'I002'),
('CS106', 'Trí tuệ nhân tạo', 'I003'),
('IT003', 'Cấu trúc dữ liệu và giải thuật', 'I003'),
('IT012', 'Tổ chức và cấu trúc máy tính II', 'I004');

INSERT INTO enrollments(student_id, course_id) VALUES
('25520244', 'CS115'),
('25520244', 'IT002'),
('25520302', 'CS106'),
('25520302', 'IT003'),
('24520123', 'IT003'),
('26520001', 'CS115'),
('26520001', 'IT002'),
('26520001', 'CS106');
