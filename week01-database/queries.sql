-- Batch 05: Truy vấn SQL
-- Truy vấn 1
SELECT S.StudentName, C.CourseName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID

-- Truy vấn 2
SELECT C.CourseName FROM Courses C
JOIN Instructors I ON C.InstrID = I.InstrID
WHERE I.InstrName = N'Lê Thị Hương'

-- Truy vấn 3
SELECT C.CourseName, COUNT(E.StudentID) 'Số sinh viên đăng kí'
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID  
GROUP BY C.CourseName

-- Truy vấn 4
SELECT S.StudentName FROM Students S
WHERE NOT EXISTS (
	SELECT 1
	FROM Enrollments E
	WHERE S.StudentID = E.StudentID
)