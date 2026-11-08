# Software Study Group — Week 01

**Topic:** Software Fundamentals & Database Design  
**Hands-on:** Student Course Management (MySQL)

Đây là repository nộp bài Week 01 của Software Study Group — GDGoC-UIT. Mỗi thành viên làm bài trên **branch cá nhân** và mở Pull Request để nhận góp ý. Không push trực tiếp lên `main`.

**Đề bài chi tiết và tài liệu tham khảo:** [Week 01 trên Notion](https://app.notion.com/p/412fb05f1e5b81f28262e06aefbeb0a3)

## Yêu cầu chính

Thiết kế cơ sở dữ liệu quản lý sinh viên, môn học, giảng viên và đăng ký môn học bằng **MySQL**.

- Vẽ ERD, xác định PK, FK và các quan hệ giữa các bảng.
- Tạo bảng bằng SQL, thiết lập ràng buộc phù hợp và thêm dữ liệu mẫu.
- Viết 4 truy vấn: sinh viên & môn đã đăng ký; môn của giảng viên; số sinh viên theo môn; sinh viên chưa đăng ký môn nào.
- Chụp ảnh **câu SQL và kết quả thực thi** của từng truy vấn.

Phần nâng cao là tùy chọn; xem chi tiết trong Notion.

## Cách làm và nộp bài

1. Gửi **GitHub username và email** cho người phụ trách để được mời vào repository.
2. Chấp nhận lời mời, clone repository và tạo branch từ `main` theo mẫu `ho-ten-solution` (ví dụ `nguyen-van-a-solution`).
3. Hoàn thiện bài tập trên branch cá nhân, commit và push lên GitHub.
4. Tạo **Pull Request**: base `main`, compare là branch cá nhân. Đặt tên `[Week 01] Ho Ten - Database Design`.
5. Gửi link Pull Request để review. Nếu được yêu cầu sửa bài, hãy tiếp tục push lên cùng branch. **Không tự merge PR.**

## Cấu trúc bài nộp trên branch cá nhân

```text
week01-database/
├── README.md
├── erd.png                  # hoặc erd.svg
├── database.sql
├── queries.sql
└── screenshots/
    ├── query-01.png
    ├── query-02.png
    ├── query-03.png
    └── query-04.png
```

Trong `README.md` của bài làm, ghi tên người nộp, mô tả thiết kế, cách chạy SQL, phần bonus (nếu có) và nhúng ảnh kết quả trong mục **Query Results**:

```md
## Query Results

### Query 01 — Student Course List
![Query 01](screenshots/query-01.png)

### Query 02 — Instructor Courses
![Query 02](screenshots/query-02.png)

### Query 03 — Enrollment Count
![Query 03](screenshots/query-03.png)

### Query 04 — Students Without Enrollments
![Query 04](screenshots/query-04.png)
```

> **Lưu ý:** `main` chỉ chứa hướng dẫn. Bài làm ở branch cá nhân và được review qua Pull Request, không merge vào `main`.
