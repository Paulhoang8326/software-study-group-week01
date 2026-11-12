CREATE DATABASE QLSV;

USE QLSV;

CREATE TABLE STUDENTS (
    StudentID VARCHAR(10) PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    StudentEmail VARCHAR(50) UNIQUE,
    Major VARCHAR(50)
);

CREATE TABLE INSTRUCTORS (
    InstructorID VARCHAR(10) PRIMARY KEY,
    InstructorName VARCHAR(50) NOT NULL,
    InstructorEmail VARCHAR(50) UNIQUE,
    Department VARCHAR(50)
);

CREATE TABLE COURSES (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    Credit INT NOT NULL,
    InstructorID VARCHAR(10),
    FOREIGN KEY (InstructorID) REFERENCES INSTRUCTORS(InstructorID)
);

CREATE TABLE ENROLLMENTS (
    StudentID VARCHAR(10) NOT NULL,
    CourseID VARCHAR(10) NOT NULL,
    EnrollmentDate DATE NOT NULL,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (CourseID) REFERENCES COURSES(CourseID)
);

INSERT INTO STUDENTS (StudentID, StudentName, DateOfBirth, StudentEmail, Major) VALUES ('SV01', 'Dang Tuan Kiet', '2007-01-15', 'kiet.dangtuan@student.edu.vn', 'Computer Engineering');
INSERT INTO STUDENTS (StudentID, StudentName, DateOfBirth, StudentEmail, Major) VALUES ('SV02', 'Ly Nhat Minh', '2005-05-01', 'minh.lynhat@student.edu.vn', 'Computer Science');
INSERT INTO STUDENTS (StudentID, StudentName, DateOfBirth, StudentEmail, Major) VALUES ('SV03', 'Truong My Duyen', '2005-04-08', 'duyen.truongmy@student.edu.vn', 'Software Engineering');
INSERT INTO STUDENTS (StudentID, StudentName, DateOfBirth, StudentEmail, Major) VALUES ('SV04', 'Dinh Quynh Nhu', '2007-12-23', 'nhu.dinhquynh@student.edu.vn', 'Computer Networks and Communications');
INSERT INTO STUDENTS (StudentID, StudentName, DateOfBirth, StudentEmail, Major) VALUES ('SV05', 'Pham Gia Bao', '2006-08-12', 'bao.phamgia@student.edu.vn', 'Information Science and Engineering');
INSERT INTO STUDENTS (StudentID, StudentName, DateOfBirth, StudentEmail, Major) VALUES ('SV06', 'Trinh Bao Ngoc', '2006-09-18', 'ngoc.trinhbao@student.edu.vn', 'Information Systems');

INSERT INTO INSTRUCTORS (InstructorID, InstructorName, InstructorEmail, Department) VALUES ('GV01', 'Tran Hoang Nam', 'namth@uit.edu.vn', 'Information Systems');
INSERT INTO INSTRUCTORS (InstructorID, InstructorName, InstructorEmail, Department) VALUES ('GV02', 'Vu Ngoc Diep', 'diepvn@uit.edu.vn', 'Computer Science');
INSERT INTO INSTRUCTORS (InstructorID, InstructorName, InstructorEmail, Department) VALUES ('GV03', 'Huynh Lan Anh', 'anhhl@uit.edu.vn', 'Software Engineering');

INSERT INTO COURSES (CourseID, CourseName, Credit, InstructorID) VALUES ('IT001', 'Introduction to Programming', 4, 'GV02');
INSERT INTO COURSES (CourseID, CourseName, Credit, InstructorID) VALUES ('IT002', 'Object-Oriented Programming', 4, 'GV03');
INSERT INTO COURSES (CourseID, CourseName, Credit, InstructorID) VALUES ('IT003', 'Data Structures and Algorithms', 4, 'GV02');
INSERT INTO COURSES (CourseID, CourseName, Credit, InstructorID) VALUES ('IT004', 'Database', 4, 'GV01');

INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV01', 'IT004', '2026-09-01');
INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV01', 'IT001', '2026-09-02');
INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV03', 'IT001', '2026-09-02');
INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV03', 'IT002', '2026-09-03');
INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV04', 'IT001', '2026-09-01');
INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV04', 'IT003', '2026-09-02');
INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV05', 'IT004', '2026-09-01');
INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV05', 'IT001', '2026-09-03');
INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV06', 'IT004', '2026-09-01');
INSERT INTO ENROLLMENTS (StudentID, CourseID, EnrollmentDate) VALUES ('SV06', 'IT002', '2026-09-03');