CREATE DATABASE IF NOT EXISTS student_course_management;
USE student_course_management;

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Instructors;

CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    instructor_code VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_code VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    major VARCHAR(100) NOT NULL,
    enrollment_year SMALLINT NOT NULL,
    CHECK (enrollment_year BETWEEN 2000 AND 2100)
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(120) NOT NULL,
    credits TINYINT NOT NULL,
    instructor_id INT NOT NULL,
    CHECK (credits BETWEEN 1 AND 10),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_at DATE NOT NULL DEFAULT (CURRENT_DATE),
    UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO Instructors (instructor_code, full_name, email, department) VALUES
('GV001', 'Nguyen Minh Hoang', 'hoangnm@uit.edu.vn', 'Computer Science'),
('GV002', 'Tran Thu Ha', 'hatt@uit.edu.vn', 'Information Systems'),
('GV003', 'Le Quoc Bao', 'baolq@uit.edu.vn', 'Software Engineering');

INSERT INTO Students (student_code, full_name, email, major, enrollment_year) VALUES
('24520001', 'Nguyen Van An', 'annv@gm.uit.edu.vn', 'Computer Science', 2024),
('24520002', 'Tran Thi Binh', 'binhtt@gm.uit.edu.vn', 'Information Systems', 2024),
('24520003', 'Le Hoang Cuong', 'cuonglh@gm.uit.edu.vn', 'Software Engineering', 2024),
('24520004', 'Pham Minh Dung', 'dungpm@gm.uit.edu.vn', 'Computer Science', 2023),
('24520005', 'Hoang Gia Huy', 'huyhg@gm.uit.edu.vn', 'Data Science', 2024),
('24520006', 'Vo Ngoc Khanh', 'khanhvn@gm.uit.edu.vn', 'Software Engineering', 2025);

INSERT INTO Courses (course_code, course_name, credits, instructor_id) VALUES
('CS101', 'Database Systems', 4, 1),
('CS102', 'Web Development', 3, 1),
('IS201', 'Data Structures and Algorithms', 4, 2),
('SE301', 'Software Engineering', 3, 3);

INSERT INTO Enrollments (student_id, course_id, enrolled_at) VALUES
(1, 1, '2026-09-01'),
(1, 2, '2026-09-01'),
(1, 3, '2026-09-02'),
(2, 1, '2026-09-01'),
(2, 2, '2026-09-02'),
(3, 1, '2026-09-01'),
(3, 3, '2026-09-03'),
(4, 2, '2026-09-02'),
(5, 1, '2026-09-03');
