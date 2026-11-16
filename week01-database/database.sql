CREATE DATABASE SCHOOL;
use SCHOOL;

-- Batch 01: Tạo bảng
CREATE TABLE Students (
	StudentID VARCHAR(10) primary key,
	StudentName nvarchar(100),
	Birthday smalldatetime,
	Class varchar(10),
	Gender nvarchar(5),
)

CREATE TABLE Courses (
	CourseID varchar(10) primary key,
	CourseName nvarchar(100),
	EndDate smalldatetime,
	StartDate smalldatetime,
	InstrID varchar(10)
)

CREATE TABLE Instructors (
	InstrID varchar(10) primary key,
	InstrName nvarchar(100),
	Gender nvarchar(5),
	Birthday smalldatetime
)

CREATE TABLE Enrollments (
	StudentID varchar(10),
	CourseID varchar(10),
	Semester varchar(10),
)

-- Batch 02: Thêm dữ liệu
-- 1. Thêm dữ liệu Giảng viên (2 giảng viên)
INSERT INTO Instructors (InstrID, InstrName, Gender, Birthday) VALUES
('GV01', N'Trần Văn Minh', N'Nam', '1980-05-15'),
('GV02', N'Lê Thị Hương', N'Nữ', '1985-11-20');

-- 2. Thêm dữ liệu Môn học (4 môn học)
INSERT INTO Courses (CourseID, CourseName, StartDate, EndDate, InstrID) VALUES
('MH01', N'Cơ sở dữ liệu', '2026-09-01', '2026-12-15', 'GV01'),
('MH02', N'Lập trình hướng đối tượng', '2026-09-01', '2026-12-20', 'GV02'),
('MH03', N'Mạng máy tính', '2026-09-05', '2026-12-18', 'GV01'),
('MH04', N'Cấu trúc dữ liệu và giải thuật', '2026-09-10', '2026-12-25', 'GV02');

-- 3. Thêm dữ liệu Sinh viên (6 sinh viên - SV06 chưa đăng ký môn nào)
INSERT INTO Students (StudentID, StudentName, Birthday, Class, Gender) VALUES
('SV01', N'Nguyễn Văn An', '2005-03-12', 'CNTT01', N'Nam'),
('SV02', N'Phạm Thị Bình', '2005-07-24', 'CNTT01', N'Nữ'),
('SV03', N'Hoàng Minh Cường', '2005-01-30', 'CNTT02', N'Nam'),
('SV04', N'Đỗ Thu Dung', '2005-09-18', 'CNTT02', N'Nữ'),
('SV05', N'Vũ Đức Em', '2005-12-05', 'CNTT01', N'Nam'),
('SV06', N'Ngô Lan Phương', '2005-06-14', 'CNTT02', N'Nữ');

-- 4. Thêm dữ liệu Đăng ký môn học (9 lượt đăng ký)
INSERT INTO Enrollments (StudentID, CourseID, Semester) VALUES
('SV01', 'MH01', 'HK1-2026'),
('SV01', 'MH02', 'HK1-2026'),
('SV02', 'MH01', 'HK1-2026'),
('SV02', 'MH03', 'HK1-2026'),
('SV03', 'MH02', 'HK1-2026'),
('SV03', 'MH04', 'HK1-2026'),
('SV04', 'MH01', 'HK1-2026'),
('SV04', 'MH04', 'HK1-2026'),
('SV05', 'MH03', 'HK1-2026');

-- Batch 04: Thêm khóa ngoại và constraint check
ALTER TABLE Courses
ADD CONSTRAINT Fk_Courses_Instructors FOREIGN KEY (InstrID) REFERENCES Instructors(InstrID);

ALTER TABLE Enrollments
ADD CONSTRAINT PK_Enrollments PRIMARY KEY (StudentID, CourseID, Semester);

ALTER TABLE Enrollments
ADD CONSTRAINT Fk_Enrollments_Students FOREIGN KEY (StudentID)
REFERENCES Students(StudentID)

ALTER TABLE Enrollments
ADD CONSTRAINT Fk_Enrollments_Courses FOREIGN KEY (CourseID)
REFERENCES Courses(CourseID)
