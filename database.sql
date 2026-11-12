CREATE TABLE Students (
  mssv char(5) PRIMARY KEY,
  tenSV varchar(50)
);

CREATE TABLE Courses (
  maMH char(5) PRIMARY KEY,
  tenMH varchar(50),
  maGK char(5) NOT NULL
);

CREATE TABLE Instructors (
  maGV char(5) PRIMARY KEY,
  tenGV varchar(50)
);

CREATE TABLE Enrollments (
  maDK char(5) PRIMARY KEY,
  ngayDK date,
  mssv char(5) NOT NULL,
  maMH char(5) NOT NULL
);

CREATE UNIQUE INDEX Enrollments_index_0 ON Enrollments (mssv, maMH);

ALTER TABLE Courses ADD FOREIGN KEY (maGK) REFERENCES Instructors (maGV);

ALTER TABLE Enrollments ADD FOREIGN KEY (mssv) REFERENCES Students (mssv);

ALTER TABLE Enrollments ADD FOREIGN KEY (maMH) REFERENCES Courses (maMH);

INSERT INTO Students (mssv, tenSV) VALUES
('SV001', 'Nguyen Van A'),
('SV002', 'Tran Thi B'),
('SV003', 'Le Van C'),
('SV004', 'Pham Thi D'),
('SV005', 'Vo Van E');

INSERT INTO Instructors (maGV, tenGV) VALUES
('GV001', 'Hoang Van X'),
('GV002', 'Bui Thi Y');

INSERT INTO Courses (maMH, tenMH, maGV) VALUES 
('CS001', 'Co so du lieu', 'GV001'),
('CS002', 'Cau truc du lieu', 'GV002'),
('CS003', 'He dieu hanh', 'GV001');

INSERT INTO Enrollments (maDK, ngayDK, mssv, maMH) VALUES 
('DK001', '2026-11-01', 'SV001', 'CS001'),
('DK002', '2026-11-01', 'SV001', 'CS002'),
('DK003', '2026-11-02', 'SV002', 'CS001'),
('DK004', '2026-11-02', 'SV002', 'CS003'),
('DK005', '2026-11-03', 'SV003', 'CS002'),
('DK006', '2026-11-03', 'SV003', 'CS003'),
('DK007', '2026-11-04', 'SV004', 'CS001'),
('DK008', '2026-11-04', 'SV004', 'CS002');
