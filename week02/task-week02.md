# Week 02 — REST API & backend basics

> 📘 **GDGoC-UIT | Software Study Group**

## Mục tiêu tuần này

Sau khi hoàn thành, mình mong các bạn sẽ có được những kiến thức về:

- Giải thích được một request đi từ client đến backend rồi xuống database và quay lại như thế nào; REST API là gì.
- Biết đặt tên endpoint theo tài nguyên, chọn đúng HTTP method và status code.
- Kết nối được backend với database của tuần 1 và tự viết được CRUD.
- Tự test API bằng Postman và đưa bài làm lên GitHub.

## 1. Tự học kiến thức nền

| Chủ đề | Cần nắm |
| --- | --- |
| HTTP | Request/response; method GET, POST, PUT, DELETE; header, body, JSON |
| REST API | Resource là gì; đặt tên endpoint; path param, query param và body khác nhau chỗ nào |
| Status code | 200, 201, 204, 400, 404, 409, 500 — khi nào dùng cái nào |
| Backend kết nối database | Connection string, driver hoặc ORM, biến môi trường; vì sao không ghép chuỗi SQL từ dữ liệu người dùng gửi lên |
| Postman | Gửi request, gửi body JSON, đọc response |
| Git/GitHub | Ôn lại branch, commit, push, PR; `.gitignore` để không đẩy file chứa mật khẩu |

**Tài liệu tham khảo** (không cần học hết đâu nha, đọc đúng phần cần thôi):

- [MDN — An overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)
- [MDN — HTTP request methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)
- [MDN — HTTP response status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)
- Postman Learning Center: phần gửi request đầu tiên là đủ.
- Tài liệu chính thức của framework bạn chọn (Spring Boot, Express, NestJS, FastAPI, Laravel… cái nào cũng được). Search "REST API tutorial" và "connect MySQL" kèm tên framework.

> 💭 Khi sinh viên bấm "Đăng ký môn học", frontend gửi gì lên backend? Backend làm những việc gì trước khi ghi xuống database? Nếu sinh viên đó đã đăng ký môn này rồi thì backend nên trả về gì?

## 2. Bài tập thực hành: Student Course Management API

> **Deadline:** Cuối chủ nhật tuần này ( 23h ngày 22/11/2026)

**Bối cảnh:** Tuần trước các bạn đã thiết kế và tạo database cho hệ thống quản lý sinh viên, môn học. Tuần này mình làm phần backend cho database đó: client gửi request, API đọc hoặc ghi MySQL rồi trả JSON về.

Tuần này **dùng lại database của tuần 1** (`Students`, `Courses`, `Instructors`, `Enrollments`). Bạn nào chưa xong tuần 1 thì hoàn thành database trước nha, tuần 2 chạy trên đó. Để dễ làm, chưa cần frontend, chưa cần đăng nhập, chưa cần phân trang. Stack tự chọn.

### Yêu cầu bài làm:

- [ ] **A. Thiết kế API contract trước khi code.** Viết bảng các endpoint trong `README.md`: method, path, mô tả, các status code có thể trả về. Bảng bên dưới là gợi ý tối thiểu, có thể bổ sung nếu thấy hợp lý.
- [ ] **B. Kết nối backend với MySQL.** Chuỗi kết nối (host, port, user, password, tên database) nằm trong biến môi trường, **không viết cứng trong code**. Có file `.env.example` để người khác biết cần điền gì; file `.env` thật phải nằm trong `.gitignore`. Không ghép chuỗi SQL từ dữ liệu client gửi lên, dùng prepared statement hoặc ORM.
- [ ] **C. Viết 8 endpoint bắt buộc** theo bảng bên dưới và chạy được trên dữ liệu mẫu của tuần 1.
- [ ] **D. Xử lý lỗi cơ bản và test bằng Postman.** Thử gửi thiếu trường, sai kiểu, id không tồn tại, đăng ký trùng môn. Server **không được sập** và phải trả đúng status code.

| # | Method | Path | Yêu cầu | Status code |
| --- | --- | --- | --- | --- |
| 1 | POST | `/students` | Tạo sinh viên mới từ body JSON. | 201, 400 |
| 2 | GET | `/students` | Danh sách sinh viên. | 200 |
| 3 | GET | `/students/{id}` | Thông tin một sinh viên. | 200, 404 |
| 4 | PUT | `/students/{id}` | Sửa thông tin sinh viên. | 200, 400, 404 |
| 5 | DELETE | `/students/{id}` | Xoá sinh viên. Nếu sinh viên đang có lượt đăng ký thì xử lý thế nào là do bạn quyết, ghi rõ trong README. | 204, 404 |
| 6 | GET | `/courses` | Danh sách môn học kèm số sinh viên đã đăng ký, **kể cả môn chưa có người đăng ký** (giống câu 3 tuần 1). | 200 |
| 7 | POST | `/enrollments` | Đăng ký môn cho sinh viên, body gồm `studentId` và `courseId`. Một sinh viên chỉ đăng ký một môn một lần. | 201, 404, 409 |
| 8 | GET | `/students/{id}/courses` | Các môn một sinh viên đã đăng ký (giống câu 1 tuần 1). | 200, 404 |

Tên field trong JSON tự đặt, nhưng phải thống nhất trong cả API. Lỗi nên trả về cùng một khuôn, ví dụ `{ "error": "Student not found" }`.

**Ví dụ output câu 8:** `GET /students/1/courses`

```json
[
  { "courseId": 1, "courseName": "Database Systems" },
  { "courseId": 2, "courseName": "Web Development" }
]
```

**Ví dụ đăng ký trùng:** gửi `POST /enrollments` hai lần với cùng một body

```json
{ "studentId": 1, "courseId": 1 }
```

Lần đầu trả `201`. Lần hai trả `409`:

```json
{ "error": "Student already enrolled in this course" }
```

> 🔎 **Lưu ý:** Hãy suy nghĩ hai câu này trước khi code. (1) `GET /students/99/courses` mà sinh viên 99 không tồn tại thì nên trả `404` hay một mảng rỗng, và nó khác gì với một sinh viên có thật nhưng chưa đăng ký môn nào? (2) Vì sao mật khẩu database không được nằm trong code, và vì sao không nên ghép thẳng dữ liệu người dùng vào câu SQL?

### Phần nâng cao (tùy chọn)

Bạn nào đã quen backend có thể chọn một hoặc nhiều ý sau:

- Thêm `GET /students?keyword=...&page=...&size=...` để tìm kiếm và phân trang danh sách sinh viên.
- Validate kỹ hơn (email đúng định dạng, tên không rỗng, độ dài hợp lý) và dùng một khuôn lỗi thống nhất cho cả API.
- Thêm các endpoint còn thiếu: CRUD cho `Courses` và `Instructors`, huỷ đăng ký môn.
- Viết tài liệu API bằng Swagger/OpenAPI hoặc xuất Postman collection kèm repo.
- Tách code thành các lớp Controller, Service, Repository và giải thích mỗi lớp làm gì.
- Viết 2–3 test tự động cho các endpoint quan trọng.
- Viết `Dockerfile` hoặc `docker-compose` để chạy cả MySQL và API bằng một lệnh.

## 3. Cách nộp bài

1. Nếu chưa được mời vào repository này, gửi cho mình **email và GitHub username ở trong kênh chat discord** để mình mời. Nhớ kiểm tra lời mời trên GitHub và chọn **Accept invitation**.
2. Clone repository về máy, tạo **branch riêng từ `main`** theo tên của bạn (không dấu, chữ thường, dùng dấu gạch ngang), ví dụ: `nguyen-van-a-week02`.
3. Làm bài, commit và push lên branch của mình. **Không push trực tiếp lên `main`** và không sửa branch của bạn khác.
4. **Không commit file `.env` thật** (mật khẩu database). Chỉ commit `.env.example`.

**Mỗi branch cần có tối thiểu các file sau:**

```
week02-api/
├── README.md
├── database.sql
├── .env.example
├── .gitignore
├── src/
└── screenshots/
    ├── 01-create-student.png
    ├── 02-student-not-found.png
    ├── 03-enroll-duplicate.png
    └── 04-student-courses.png
```

- `src/`: code API, cấu trúc thư mục theo stack bạn chọn.
- `database.sql`: copy từ bài tuần 1, chạy từ trên xuống là có đủ bảng và dữ liệu mẫu.
- `.env.example`: liệt kê các biến môi trường cần có, giá trị để trống hoặc điền giá trị giả.
- `screenshots/`: ảnh Postman nhìn rõ method, URL, body và response. Bốn ảnh tương ứng: tạo sinh viên thành công (`201`), lấy sinh viên không tồn tại (`404`), đăng ký trùng môn (`409`), danh sách môn của một sinh viên.
- `README.md`: thông tin người nộp, stack đã chọn, cách chạy (cài thư viện, tạo database, điền `.env`, chạy server), bảng API contract, và phần bonus (nếu có). Thêm mục **API Test Results** để hiển thị 4 ảnh trong `screenshots/` bằng cú pháp Markdown `![Create student](screenshots/01-create-student.png)` (tương tự cho các ảnh còn lại).

### Tạo Pull Request để nộp bài

Trên GitHub, chọn **Pull requests → New pull request**:

- **Base:** `main`
- **Compare:** branch cá nhân (ví dụ `nguyen-van-a-week02`)
- **Title:** `[Week 02] Nguyen Van A - REST API`
- **Description:** Đã hoàn thành những mục nào, bonus (nếu có), khó khăn hoặc câu hỏi cần hỗ trợ.