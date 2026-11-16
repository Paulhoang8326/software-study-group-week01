CREATE DATABASE QLSV;
USE QLSV;

CREATE TABLE Students (
    StudentID VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Major VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Instructors (
    InstructorID VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Courses (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(150) NOT NULL,
    Credits INT NOT NULL CHECK (Credits > 0),
    InstructorID VARCHAR(10) NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

CREATE TABLE Enrollments (
    CourseID VARCHAR(10) NOT NULL,
    StudentID VARCHAR(10) NOT NULL,
    EnrollmentDate DATE NOT NULL,
    PRIMARY KEY (CourseID, StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Students (StudentID, FullName, Major, Email) VALUES ('SV01', 'Le Minh Quan', 'Computer Science', 'quan.leminh@student.edu.vn');
INSERT INTO Students (StudentID, FullName, Major, Email) VALUES ('SV02', 'Vo Hoang Yen', 'Software Engineering', 'yen.vohoang@student.edu.vn');
INSERT INTO Students (StudentID, FullName, Major, Email) VALUES ('SV03', 'Dang Quoc Tuan', 'Information Systems', 'tuan.dangquoc@student.edu.vn');
INSERT INTO Students (StudentID, FullName, Major, Email) VALUES ('SV04', 'Bui Thanh Thao', 'Computer Networks and Communications', 'thao.buithanh@student.edu.vn');
INSERT INTO Students (StudentID, FullName, Major, Email) VALUES ('SV05', 'Ngo Duc Manh', 'Information Science and Engineering', 'manh.ngoduc@student.edu.vn');
INSERT INTO Students (StudentID, FullName, Major, Email) VALUES ('SV06', 'Hoang Kim Ngan', 'Data Science', 'ngan.hoangkim@student.edu.vn');

INSERT INTO Instructors (InstructorID, FullName, Email) VALUES ('GV01', 'Doan Minh Triet', 'trietdm@uit.edu.vn');
INSERT INTO Instructors (InstructorID, FullName, Email) VALUES ('GV02', 'Phan Thu Ha', 'hapt@uit.edu.vn');
INSERT INTO Instructors (InstructorID, FullName, Email) VALUES ('GV03', 'Luong Gia Huy', 'huylg@uit.edu.vn');

INSERT INTO Courses (CourseID, CourseName, Credits, InstructorID) VALUES ('IT001', 'Introduction to Programming', 4, 'GV02');
INSERT INTO Courses (CourseID, CourseName, Credits, InstructorID) VALUES ('IT002', 'Object-Oriented Programming', 4, 'GV03');
INSERT INTO Courses (CourseID, CourseName, Credits, InstructorID) VALUES ('IT003', 'Data Structures and Algorithms', 4, 'GV02');
INSERT INTO Courses (CourseID, CourseName, Credits, InstructorID) VALUES ('IT004', 'Database', 4, 'GV01');
INSERT INTO Courses (CourseID, CourseName, Credits, InstructorID) VALUES ('IT005', 'Database Management Systems', 4, 'GV01');
INSERT INTO Courses (CourseID, CourseName, Credits, InstructorID) VALUES ('IT006', 'Computer Architecture', 4, 'GV02');
INSERT INTO Courses (CourseID, CourseName, Credits, InstructorID) VALUES ('IT007', 'Operating Systems', 4, 'GV03');

INSERT INTO Enrollments (CourseID, StudentID, EnrollmentDate) VALUES ('IT001', 'SV01', '2026-11-12');
INSERT INTO Enrollments (CourseID, StudentID, EnrollmentDate) VALUES ('IT002', 'SV01', '2026-11-12');
INSERT INTO Enrollments (CourseID, StudentID, EnrollmentDate) VALUES ('IT001', 'SV02', '2026-11-13');
INSERT INTO Enrollments (CourseID, StudentID, EnrollmentDate) VALUES ('IT003', 'SV02', '2026-11-13');
INSERT INTO Enrollments (CourseID, StudentID, EnrollmentDate) VALUES ('IT004', 'SV03', '2026-11-14');
INSERT INTO Enrollments (CourseID, StudentID, EnrollmentDate) VALUES ('IT005', 'SV03', '2026-11-14');
INSERT INTO Enrollments (CourseID, StudentID, EnrollmentDate) VALUES ('IT006', 'SV04', '2026-11-15');
INSERT INTO Enrollments (CourseID, StudentID, EnrollmentDate) VALUES ('IT007', 'SV05', '2026-11-15');