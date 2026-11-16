CREATE DATABASE StudentCourse;
USE StudentCourse;

-----------------------------------------------------------

CREATE TABLE Departments (
    department_id VARCHAR(8) PRIMARY KEY,
    department_name NVARCHAR(100) NOT NULL UNIQUE,
    head_id VARCHAR(8)
);

CREATE TABLE Instructors (
    instructor_id VARCHAR(8) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    date_of_birth DATE,
    hometown NVARCHAR(100),
    national_id VARCHAR(12) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id VARCHAR(8) NOT NULL,
    CONSTRAINT fk_instructors_department FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

ALTER TABLE Departments
    ADD CONSTRAINT fk_departments_head FOREIGN KEY (head_id) REFERENCES Instructors(instructor_id);

CREATE TABLE Students (
    student_id VARCHAR(8) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    date_of_birth DATE,
    hometown NVARCHAR(100),
    national_id VARCHAR(12) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    department_id VARCHAR(8) NOT NULL,
    CONSTRAINT fk_students_department FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Courses (
    course_id VARCHAR(8) PRIMARY KEY,
    course_name NVARCHAR(100) NOT NULL,
    credits TINYINT NOT NULL CHECK (credits > 0),
    department_id VARCHAR(8) NOT NULL,
    instructor_id VARCHAR(8) NOT NULL,
    CONSTRAINT fk_courses_department FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    CONSTRAINT fk_courses_instructor FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

CREATE TABLE Enrollments (
    student_id  VARCHAR(8) NOT NULL,
    course_id   VARCHAR(8) NOT NULL,
    enrolled_time DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_enr_student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT fk_enr_course FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-----------------------------------------------------------

INSERT INTO Departments (department_id, department_name) VALUES
('HTTT', N'Hệ thống thông tin'),
('KHMT', N'Khoa học máy tính');

INSERT INTO Instructors (instructor_id, full_name, date_of_birth, hometown, national_id, email, department_id) VALUES
('GV001', N'Cao Thị Nhạn', '1980-04-15', N'Huế', '079080000001', 'nhanct@uit.edu.vn', 'HTTT'),
('GV002', N'Ngô Đức Thành', '1985-09-20', N'Đà Nẵng', '079085000002', 'thanhnd@uit.edu.vn', 'KHMT');

UPDATE Departments SET head_id = 'GV001' WHERE department_id = 'HTTT';
UPDATE Departments SET head_id = 'GV002' WHERE department_id = 'KHMT';

INSERT INTO Courses (course_id, course_name, credits, department_id, instructor_id) VALUES
('IT004', N'Cơ sở dữ liệu', 4, 'HTTT', 'GV001'),
('IT003', N'Cấu trúc dữ liệu và giải thuật', 4, 'KHMT', 'GV002'),
('IT002', N'Lập trình hướng đối tượng', 4, 'KHMT', 'GV002');

INSERT INTO Students (student_id, full_name, date_of_birth, hometown, national_id, email, department_id) VALUES
('25520001', N'Hà Anh Tuấn', '2007-03-12', N'Đồng Nai', '079207000001', '25520001@gm.uit.edu.vn', 'HTTT'),
('25520006', N'Bùi Anh Tuấn', '2007-09-02', N'Bến Tre', '079207000006', '25520006@gm.uit.edu.vn', 'KHMT'),
('25520002', N'Hà An Huy', '2007-07-25', N'Long An', '079207000002', '25520002@gm.uit.edu.vn', 'KHMT'),
('25520003', N'Phan Mạnh Quỳnh', '2007-01-09', N'Bình Dương', '079207000003', '25520003@gm.uit.edu.vn', 'HTTT'),
('25520004', N'Tăng Phúc', '2007-11-30', N'Tiền Giang', '079207000004', '25520004@gm.uit.edu.vn', 'KHMT'),
('25520005', N'Tăng Duy Tân', '2007-05-18', N'TP.HCM', '079207000005', '25520005@gm.uit.edu.vn', 'HTTT');

INSERT INTO Enrollments (student_id, course_id) VALUES
('25520001', 'IT004'), ('25520001', 'IT003'),
('25520002', 'IT004'), ('25520002', 'IT002'),
('25520003', 'IT004'),
('25520004', 'IT003'), ('25520004', 'IT002'),
('25520005', 'IT003');

