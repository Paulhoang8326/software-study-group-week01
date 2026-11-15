SELECT s.full_name AS Student, c.course_name AS Course
FROM Enrollments AS e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT c.course_id, c.course_name, c.room, i.full_name AS Instructor
FROM Courses AS c
JOIN Instructors i ON c.instructor_id = i.instructor_id
WHERE i.instructor_id = 'GV02';

SELECT c.course_id, c.course_name, COUNT(e.student_id) AS total_students
FROM Courses AS c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

SELECT s.student_id, s.full_name
FROM Students AS s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;