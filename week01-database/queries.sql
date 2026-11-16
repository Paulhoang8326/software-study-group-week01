USE student_course_db;

SELECT
    s.student_id  AS MSSV,
    s.full_name   AS Student,
    c.course_name AS Course
FROM Students s
INNER JOIN Enrollments e ON e.student_id = s.student_id
INNER JOIN Courses     c ON c.course_id  = e.course_id
ORDER BY s.student_id, c.course_code;

SELECT
    i.full_name   AS Instructor,
    c.course_code AS Code,
    c.course_name AS Course,
    c.credits     AS Credits
FROM Courses c
INNER JOIN Instructors i ON i.instructor_id = c.instructor_id
WHERE i.full_name = 'Mai Thanh Long'
ORDER BY c.course_code;

SELECT
    c.course_code       AS Code,
    c.course_name       AS Course,
    COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON e.course_id = c.course_id
GROUP BY c.course_id, c.course_code, c.course_name
ORDER BY student_count DESC, c.course_code;

SELECT
    s.student_id AS MSSV,
    s.full_name  AS Student,
    s.email      AS Email
FROM Students s
LEFT JOIN Enrollments e ON e.student_id = s.student_id
WHERE e.enrollment_id IS NULL
ORDER BY s.student_id;

