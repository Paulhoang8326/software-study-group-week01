# Software Study Group

**Người nộp:** Đỗ Hoàng Anh Tú

## Mô tả thiết kế

### Cơ sở dữ liệu được chia thành 4 bảng chính:
- **Students**: Lưu trữ thông tin sinh viên (`mssv`, `tenSV`)
- **Instructors**: Lưu trữ thông tin giảng viên (`maGV`,`tenGV`)
- **Courses**: Lưu trữ thông tin môn học. Mỗi môn học do một giảng viên phụ trách.
- **Enrollments**: Lưu trữ thông tin đăng kí môn của sinh viên.

### Các mối quan hệ

- Một giảng viên có thể phụ trách nhiều môn học (1-N).
- Mỗi môn học được phụ trách bởi một giảng viên (N-1).
- Một sinh viên có thể đăng ký nhiều môn học (1-N).
- Một môn học có thể có nhiều sinh viên đăng ký (1-N).
- Bảng `Enrollments` thể hiện mối quan hệ nhiều-nhiều (N-N) giữa sinh viên và môn học.

### Các ràng buộc

- Mỗi bảng có một khóa chính (Primary Key - PK).
- Các khóa ngoại (Foreign Key - FK) đảm bảo tính liên kết giữa các bảng.
- Một sinh viên không thể đăng ký cùng một môn học nhiều lần. Ràng buộc `UNIQUE` được sử dụng trên hai cột `(mssv, maMH)` để đảm bảo điều này.

## Cách chạy SQL

### Yêu cầu

- MySQL Server
- MySQL Workbench hoặc một công cụ hỗ trợ truy vấn MySQL khác.

### Bước 1: Tạo cơ sở dữ liệu

Thực thi câu lệnh SQL sau:

```sql
CREATE DATABASE StudentCourseManagement;
USE StudentCourseManagement;
```

### Bước 2: Tạo bảng và thêm dữ liệu mẫu

Chạy toàn bộ các câu lệnh trong file `database.sql` theo thứ tự từ trên xuống dưới.

### Bước 3: Thực hiện truy vấn

Chạy 4 câu truy vấn trong file `queries.sql` để lấy các thông tin theo yêu cầu của bài tập.

## Query Results

### Query 01 — Student Course List
![Query 01](screenshots/query-01.png)

### Query 02 — Instructor Courses
![Query 02](screenshots/query-02.png)

### Query 03 — Enrollment Count
![Query 03](screenshots/query-03.png)

### Query 04 — Students Without Enrollments
![Query 04](screenshots/query-04.png)