CREATE DATABASE StudentCourseAdvanced;
USE StudentCourseAdvanced;

-----------------------------------------------------------

CREATE TABLE Departments (
    department_id VARCHAR(8) PRIMARY KEY,
    department_name NVARCHAR(100) NOT NULL UNIQUE,
    head_id VARCHAR(8)
);

CREATE TABLE Instructors (
    instructor_id VARCHAR(8) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    date_of_birth DATE,
    hometown NVARCHAR(100),
    national_id VARCHAR(12) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id VARCHAR(8) NOT NULL,
    CONSTRAINT fk_instructors_department FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

ALTER TABLE Departments
    ADD CONSTRAINT fk_departments_head FOREIGN KEY (head_id) REFERENCES Instructors(instructor_id);

CREATE TABLE Students (
    student_id VARCHAR(8) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    date_of_birth DATE,
    hometown NVARCHAR(100),
    national_id VARCHAR(12) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    department_id VARCHAR(8) NOT NULL,
    CONSTRAINT fk_students_department FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Courses (
    course_id VARCHAR(8) PRIMARY KEY,
    course_name NVARCHAR(100) NOT NULL,
    credits TINYINT NOT NULL CHECK (credits > 0),
    department_id VARCHAR(8) NOT NULL,
    CONSTRAINT fk_courses_department FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE CourseSections (
    section_id INT PRIMARY KEY,
    section_name VARCHAR(10) NOT NULL,
    course_id VARCHAR(8) NOT NULL,
    instructor_id VARCHAR(8) NOT NULL,
    semester TINYINT NOT NULL CHECK (semester IN (1, 2, 3)),
    academic_year VARCHAR(9) NOT NULL,
    capacity SMALLINT NOT NULL CHECK (capacity > 0),
    CONSTRAINT fk_sections_course FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT fk_sections_instructor FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id),
    CONSTRAINT uq_sections UNIQUE (course_id, section_name, semester, academic_year)
);

CREATE TABLE Enrollments (
    student_id VARCHAR(8) NOT NULL,
    section_id INT NOT NULL,
    enrolled_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (student_id, section_id),
    CONSTRAINT fk_enr_student FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT fk_enr_section FOREIGN KEY (section_id) REFERENCES CourseSections(section_id)
);

