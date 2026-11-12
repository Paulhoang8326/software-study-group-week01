--1. Liệt kê tên sinh viên và tên môn học mà sinh viên đó đã đăng ký
SELECT s.students_full_name, c.courses_title 
FROM students s
JOIN enrollments e ON s.students_id = e.students_id
JOIN courses c ON e.courses_id = c.courses_id;

-- 2. Liệt kê các môn do một giảng viên cụ thể phụ trách
SELECT c.courses_title AS course_name, i.instructors_name AS instructor_name
FROM courses c
JOIN instructors i ON c.instructors_id = i.instructors_id
WHERE i.instructors_id = 1;

-- 3. Đếm số sinh viên đăng ký từng môn, kể cả môn chưa có người đăng ký
SELECT c.courses_title, COUNT(e.students_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.courses_id = e.courses_id
GROUP BY c.courses_id, c.courses_title;

-- 4. Tìm sinh viên chưa đăng ký bất kỳ môn nào
SELECT s.students_id, s.students_full_name
FROM students s
LEFT JOIN enrollments e ON s.students_id = e.students_id
WHERE e.enrollments_id IS NULL;