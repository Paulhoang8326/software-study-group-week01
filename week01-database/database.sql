CREATE DATABASE Week01_GDOC;
USE Week01_GDOC;
CREATE TABLE Instructors (
    instructor_id VARCHAR(100) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE students (
    uit_id VARCHAR(100) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    birth_date DATE
);

CREATE TABLE Courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    room VARCHAR(50) NOT NULL,           
    instructor_id VARCHAR(10),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

CREATE TABLE Enrollments (
    enrollment_id VARCHAR(10) PRIMARY KEY,
    student_id VARCHAR(10) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    CONSTRAINT uc_student_course UNIQUE (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


INSERT INTO Instructors (instructor_id, full_name, email, department) VALUES 
('GV01', 'Nguyen Thanh An', 'ancnnt@uit.edu.vn', 'Computer Science'),
('GV02','Nguyen Hieu Nghia', 'nghiagh@uit.edu.vn', 'Software Engineering'),
('GV03','Nguyen Van Lung',' lungg@uit.edu.vn','Information System');

INSERT INTO Students (student_id, full_name, email, birth_date) VALUES 
('SV01', 'Nguyen Thanh Phong', 'phongne@uit.edu.vn', '2007-03-17'),
('SV02', 'Dinh Hoang Kim', 'ahkimt@uit.edu.vn', '2008-06-09'),
('SV03', 'Pham Thi Hien', 'HIenne@uit.edu.vn', '2007-11-06'),
('SV04', 'Vo Huynh Thu Nguyet', 'Nguyetcute@uit.edu.vn', '2007-10-03'),
('SV05', 'Nguyen Ngoc Huy', 'Huysin@uit.edu.vn', '2008-05-11'),
('SV06', 'Nguyen Tuan Tai', 'tuantai@uit.edu.vn', '2008-06-28');

INSERT INTO Courses (course_id, course_name, room, instructor_id) VALUES 
('CS001', 'Introduction to Programming', 'B1.14', 'GV02'),
('SE002', 'Object-Oriented Programming', 'B3.06', 'GV03'),
('CS003', 'Data Structures and Algorithms', 'B2.05', 'GV02'),
('IT004', 'Database Systems', 'B6.06', 'GV01');

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES 
('E01', 'SV01', 'IT004', '2026-09-01'),
('E02', 'SV01', 'CS001', '2026-09-02'),
('E03', 'SV02', 'CS001', '2026-09-02'),
('E04', 'SV03', 'SE002', '2026-09-03'),
('E05', 'SV04', 'CS001', '2026-09-01'),
('E06', 'SV04', 'CS003', '2026-09-02'),
('E07', 'SV05', 'IT004', '2026-09-01'),
('E08', 'SV05', 'CS001', '2026-09-03');
