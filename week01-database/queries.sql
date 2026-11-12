USE QLSV;

-- 1. Liệt kê tên sinh viên và tên các môn đã đăng ký.
SELECT HS.StudentName, MH.CourseName
FROM STUDENTS HS
JOIN ENROLLMENTS DK ON HS.StudentID = DK.StudentID 
JOIN COURSES MH ON DK.CourseID = MH.CourseID;

-- 2. Liệt kê các môn do 'GV02' cụ thể phụ trách.
SELECT MH.CourseName, GV.InstructorName
FROM COURSES MH
JOIN INSTRUCTORS GV ON MH.InstructorID = GV.InstructorID
WHERE GV.InstructorID = 'GV02';

-- 3. Đếm số sinh viên đăng ký từng môn, kể cả môn chưa có người đăng ký.
SELECT MH.CourseID, MH.CourseName, COUNT(DK.StudentID) AS 'Quantity'
FROM COURSES MH
LEFT JOIN ENROLLMENTS DK ON MH.CourseID = DK.CourseID
GROUP BY MH.CourseID, MH.CourseName;

-- 4. Tìm sinh viên chưa đăng ký bất kỳ môn nào.
SELECT SV.*
FROM STUDENTS SV
WHERE SV.StudentID NOT IN (
    SELECT StudentID
    FROM ENROLLMENTS
);