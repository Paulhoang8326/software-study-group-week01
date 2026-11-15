SELECT students.full_name, courses.course_name
FROM students NATURAL JOIN enrollments NATURAL JOIN courses;

SELECT instructors.full_name, courses.course_name
FROM instructors NATURAL JOIN courses
WHERE instructors.instructor_id = 'I003';

SELECT courses.course_name, COUNT(enrollments.student_id) AS number_of_students
FROM courses LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id;

SELECT students.full_name, COUNT(enrollments.course_id) AS number_of_courses
FROM students LEFT JOIN enrollments ON students.student_id = enrollments.student_id
GROUP BY students.student_id
HAVING number_of_courses = 0;
