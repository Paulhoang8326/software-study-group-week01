--1
SELECT s.student_id, s.full_name, c.course_name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON c.course_id = e.course_id;

--2
SELECT c.course_id, c.course_name, i.instructor_id, i.full_name
FROM Courses c
JOIN Instructors i ON c.instructor_id = i.instructor_id
WHERE i.instructor_id = 'GV001';

--3
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS total_student
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

--4
SELECT s.student_id, s.full_name
FROM Students s
LEFT JOIN Enrollments e ON e.student_id = s.student_id
WHERE e.student_id IS NULL;
