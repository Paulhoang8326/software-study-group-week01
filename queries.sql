-- query 1
SELECT tenSV as Student, tenMH as Course
FROM Students s
JOIN Enrollments e ON s.mssv = e.mssv
JOIN Courses c ON c.maMH = e.maMH;

-- query 2
SELECT maMH, tenMH, i.tenGV
FROM Courses c
JOIN Instructors i ON i.maGV = c.maGV
WHERE i.maGV = 'GV001';

-- query 3
SELECT c.maMH, tenMH, count(mssv)
FROM Enrollments e
RIGHT JOIN Courses c ON c.maMH = e.maMH
GROUP BY c.maMH, tenMH;

-- query 4
SELECT s.mssv, s.tenSV
FROM Students s
LEFT JOIN Enrollments e ON e.mssv = s.mssv
WHERE e.mssv IS NULL;