# GDGoC-UIT | Software Study Group
**Week 01 — Software fundamentals & database design**


## 1. Thông tin người nộp
- **Họ tên:** Lê Quốc Luân


## 2. Mô tả Database
### Cơ sở dữ liệu gồm 4 bảng:
- **STUDENTS:** Lưu thông tin sinh viên gồm: Mã sinh viên, Họ tên, Ngày sinh, Email, Ngành
- **INSTRUCTORS:** Lưu thông tin giảng viên gồm: Mã giảng viên, Họ tên, Email, Khoa
- **COURSES:** Lưu thông tin môn học gồm: Mã môn học, Tên môn học, Số tín chỉ, Mã giảng viên dạy
- **ENROLLMENTS:** Lưu thông tin đăng ký môn học của sinh viên gồm: Mã sinh viên, Mã khóa học, Ngày đăng ký

### Mối quan hệ giữa các bảng
- Một môn học do một giảng viên dạy nhưng một giảng viên có thể dạy nhiều môn (1:N).
- Một sinh viên có thể đăng ký nhiều môn học và một môn học có thể có nhiều sinh viên đăng ký (N:N).


## 3. Cách chạy SQL
1. Thực thi file database.sql để tạo database, bảng và thêm dữ liệu mẫu
2. Thực thi các câu trong file queries.sql để xem kết quả


## 4. Query Results
1. Query 01: Liệt kê tên sinh viên và tên các môn đã đăng ký.
![Query 01](screenshots/query-01.png)

2. Query 02: Liệt kê các môn do 'GV02' cụ thể phụ trách.
![Query 02](screenshots/query-02.png)

3. Query 03: Đếm số sinh viên đăng ký từng môn, kể cả môn chưa có người đăng ký.
![Query 03](screenshots/query-03.png)

4. Query 04: Tìm sinh viên chưa đăng ký bất kỳ môn nào.
![Query 04](screenshots/query-04.png)