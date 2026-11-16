# GDGoC-UIT | Software Study Group

Repo bài tập của Software Study Group (GDGoC-UIT). Mỗi tuần có một đề, một thư mục nộp bài, và nộp bằng Pull Request.

> `main` chỉ chứa đề bài. Bài làm của bạn nằm ở branch cá nhân, **không push trực tiếp lên `main`**.

## Danh sách tuần

| Tuần | Chủ đề | Đề bài | Thư mục nộp | Deadline |
| --- | --- | --- | --- | --- |
| 01 | Software fundamentals & database design | [week01/task-week01.md](week01/task-week01.md) | `week01-database/` | 23h 15/11/2026 |
| 02 | REST API & backend basics | [week02/task-week02.md](week02/task-week02.md) | `week02-api/` | 23h 22/11/2026 |

Đề các tuần tiếp theo sẽ được thêm vào bảng này.

## Quy trình nộp bài (áp dụng cho mọi tuần)

1. Chưa có quyền vào repo: gửi cho mình **email và GitHub username ở trong kênh chat discord** để mình mời. Kiểm tra lời mời trên GitHub và chọn **Accept invitation**.
2. Clone repo về máy.
3. Mỗi tuần tạo **một branch riêng từ `main`**, đặt theo tên của bạn (không dấu, chữ thường, dùng dấu gạch ngang) kèm tuần, ví dụ `nguyen-van-a-week02`. Tuần 1 dùng `nguyen-van-a-solution` như đề đã hướng dẫn.
4. Làm bài trong đúng thư mục của tuần đó (xem bảng trên), commit và push lên branch của mình.
5. Mở Pull Request vào `main`:
   - **Base:** `main`
   - **Compare:** branch của bạn
   - **Title:** `[Week XX] Ho Ten - Ten bai`, ví dụ `[Week 02] Nguyen Van A - REST API`
   - **Description:** đã hoàn thành những mục nào, bonus (nếu có), khó khăn hoặc câu hỏi cần hỗ trợ.
6. **Không tự merge PR** và không sửa branch của bạn khác.

## Quy tắc chung

- Mỗi bài có `README.md` riêng trong thư mục nộp: thông tin người nộp, mô tả bài làm, cách chạy, phần bonus (nếu có).
- Không commit mật khẩu, token, file `.env` thật. Nếu bài cần cấu hình thì commit file mẫu `.env.example`.
- Kết quả chạy thử (ảnh chụp màn hình) để trong `screenshots/` và nhúng vào `README.md` của bài.
- Phần nâng cao là tùy chọn. Làm đủ yêu cầu bắt buộc trước.
- Kẹt chỗ nào thì ghi vào Description của PR hoặc hỏi ở kênh discord, đừng để quá deadline mới hỏi.

## Cấu trúc repo

```
.
├── README.md              # file này
├── week01/
│   └── task-week01.md     # đề tuần 1
├── week02/
│   └── task-week02.md     # đề tuần 2
└── ...                    # các tuần sau
```

Thư mục `weekXX/` trên `main` chỉ chứa đề. Trên branch cá nhân, bài làm nằm ở thư mục nộp riêng của tuần đang làm (tên ghi trong bảng ở trên), ví dụ:

```
week01-database/
week02-api/
```