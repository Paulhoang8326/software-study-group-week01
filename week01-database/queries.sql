USE student_course_management;

-- Query 1
SELECT
    s.full_name AS student_name,
    c.course_name
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
ORDER BY s.student_id, c.course_id;

-- Query 2
SELECT
    i.instructor_code,
    i.full_name AS instructor_name,
    c.course_code,
    c.course_name,
    c.credits
FROM Courses c
JOIN Instructors i ON c.instructor_id = i.instructor_id
WHERE i.instructor_code = 'GV001'
ORDER BY c.course_id;

-- Query 3
SELECT
    c.course_code,
    c.course_name,
    COUNT(e.student_id) AS enrolled_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY enrolled_students DESC, c.course_id;

-- Query 4
SELECT
    s.student_id,
    s.student_code,
    s.full_name AS student_name,
    s.email,
    s.major
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL
ORDER BY s.student_id;
