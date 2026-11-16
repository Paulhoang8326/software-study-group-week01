DROP DATABASE IF EXISTS student_course_db;
CREATE DATABASE student_course_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE student_course_db;

CREATE TABLE Instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Students (
    student_id    CHAR(8)      NOT NULL PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE,
    CONSTRAINT chk_student_id CHECK (student_id REGEXP '^26[0-9]{6}$')
);

CREATE TABLE Courses (
    course_id     INT AUTO_INCREMENT PRIMARY KEY,
    course_code   VARCHAR(20)  NOT NULL UNIQUE,
    course_name   VARCHAR(150) NOT NULL,
    credits       INT          NOT NULL DEFAULT 3,
    instructor_id INT          NOT NULL,
    CONSTRAINT fk_courses_instructor
        FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT chk_credits CHECK (credits BETWEEN 1 AND 10)
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id    CHAR(8) NOT NULL,
    course_id     INT     NOT NULL,
    enrolled_at   DATE    NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_enroll_student
        FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_enroll_course
        FOREIGN KEY (course_id) REFERENCES Courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT uq_student_course UNIQUE (student_id, course_id)
);

INSERT INTO Instructors (full_name, email) VALUES
    ('Nguyen Viet Son',       'sonnv@uit.edu.vn'),
    ('Do Van Tien',           'tiendv@uit.edu.vn'),
    ('Pham Nguyen Truong An', 'truonganpn@uit.edu.vn'),
    ('Mai Thanh Long',        'longmt@uit.edu.vn');

INSERT INTO Students (student_id, full_name, email, date_of_birth) VALUES
    ('26521952', 'Nguyen Van An',  '26521952@gm.uit.edu.vn', '2008-03-14'),
    ('26520123', 'Le Thanh Binh',  '26520123@gm.uit.edu.vn', '2008-11-02'),
    ('26521045', 'Pham Ngoc Chi',  '26521045@gm.uit.edu.vn', '2008-07-25'),
    ('26522310', 'Tran Quoc Dung', '26522310@gm.uit.edu.vn', '2008-01-30'),
    ('26521088', 'Hoang Thi Ha',   '26521088@gm.uit.edu.vn', '2008-09-08');

INSERT INTO Courses (course_code, course_name, credits, instructor_id) VALUES
    ('IT001', 'Introduction into Programming', 4, 2),
    ('MA006', 'Calculus',                      3, 4),
    ('MA003', 'Linear Algebra',                4, 4),
    ('MA004', 'Probability and Statistics',    3, 3);

INSERT INTO Enrollments (student_id, course_id, enrolled_at)
SELECT v.student_id, c.course_id, v.enrolled_at
FROM (
              SELECT '26521952' AS student_id, 'IT001' AS course_code, '2026-09-05' AS enrolled_at
    UNION ALL SELECT '26521952', 'MA006', '2026-09-05'
    UNION ALL SELECT '26521952', 'MA003', '2026-09-06'
    UNION ALL SELECT '26520123', 'IT001', '2026-09-05'
    UNION ALL SELECT '26520123', 'MA006', '2026-09-07'
    UNION ALL SELECT '26521045', 'IT001', '2026-09-06'
    UNION ALL SELECT '26521045', 'MA003', '2026-09-06'
    UNION ALL SELECT '26522310', 'MA006', '2026-09-08'
) AS v
JOIN Courses c ON c.course_code = v.course_code;

SELECT 'Instructors' AS table_name, COUNT(*) AS rows_inserted FROM Instructors
UNION ALL SELECT 'Students',    COUNT(*) FROM Students
UNION ALL SELECT 'Courses',     COUNT(*) FROM Courses
UNION ALL SELECT 'Enrollments', COUNT(*) FROM Enrollments;

