use luyentap;
select
s.student_name,
c.course_id
from enrollments e
join student s on s.student_name=e.student_id
join course c on c.course_id=e.course_id;
select 
c.course_id,
i.instructor_name
from course c
join instructor i on i.instructor_id=c.instructor_id
where i.instructor_id=006;
select
c.course_id,
count(e.student_id) as so_luong_sinh_vien
from course c
LEFT JOIN enrollments e ON c.course_id = e.course_id
group by c.course_id;
select 
s.student_id,
s.student_name
from student s
left join enrollments e on s.student_id=e.student_id
where e.student_id is null
 