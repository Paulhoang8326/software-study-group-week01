CREATE DATABASE IF NOT EXISTS luyentap;
USE luyentap;
CREATE TABLE student (
student_id INT PRIMARY KEY auto_increment,
student_name varchar(90) NOT NULL,
birthday varchar(90) not null,
email varchar(90) not null unique
);
create table instructor (
instructor_id int primary key auto_increment,
instructor_name varchar(90) not null,
email varchar(90) not null unique,
major varchar(90) not null
);
create table course (
course_id int primary key auto_increment,
date int not null,
instructor_id int not null,
foreign key (instructor_id) references instructor(instructor_id)
);
create table enrollments (
enrollment_id int primary key auto_increment,
course_id int unique,
student_id int unique,
foreign key (course_id) references course(course_id),
foreign key (student_id) references student(student_id)
);
use luyentap;
insert into student (student_id, student_name,birthday,email) values
(001,'Nguyễn Văn A','01/01/2008','NguyenVanA@gmail.com'),
(002,'Nguyễn Văn B','02/01/2008','NguyenVanB@gmail.com'),
(003,'Nguyễn Văn C','03/01/2008','NguyenVanC@gmail.com'),
(004,'Nguyễn Văn D','04/01/2008','NguyenVanD@gmail.com'),
(005,'Nguyễn Văn E','05/01/2008','NguyenVanE@gmail.com');
insert into instructor (instructor_id,instructor_name,email,major) values
(006,'Nguyễn Văn F','NguyenVanF@gmail.com','SE'),
(007,'Nguyễn Văn G','NguyenVanG@gmail.com','DS');
insert into course (course_id,date,instructor_id) values
(666,'01/01/2026',006),
(777,'04/01/2026',007),
(888,'06/01/2026',007);
insert into enrollments (enrollment_id,course_id,student_id) values
(100,777,001),
(101,888,001),
(102,777,002),
(103,666,003),
(104,777,004),
(105,666,005),
(106,888,002),
(107,888,003);

