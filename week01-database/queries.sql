USE QLS;

 -- 1.Liệt kê tên sinh viên và tên các môn đã đăng ký.
 
SELECT 
    s.FullName AS sv, 
    c.CourseName AS lop
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

 -- 2.Liệt kê các môn do một giảng viên cụ thể phụ trách.

SELECT 
    c.CourseID AS mslop, 
    c.CourseName AS lop, 
    i.FullName AS InstructorName
FROM Courses c
JOIN Instructors i ON c.InstructorID = i.InstructorID
WHERE c.InstructorID = 'GV02';

 -- 3.Đếm số sinh viên đăng ký từng môn, kể cả môn chưa có người đăng ký.
 
SELECT 
    c.CourseID AS mslop, 
    c.CourseName AS lop, 
    COUNT(e.StudentID) AS TotalStudents
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName;

 -- 4.Tìm sinh viên chưa đăng ký bất kỳ môn nào.
 
SELECT * 
FROM Students 
WHERE StudentID NOT IN (SELECT StudentID FROM Enrollments);
