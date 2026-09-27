-- Bài tập Group By - QuanLySinhVien
-- Mục tiêu: sử dụng hàm tổng hợp và GROUP BY trong MySQL

USE QuanLySinhVien;

-- =========================================================
-- 1. Hiển thị tất cả thông tin môn học có Credit lớn nhất
-- =========================================================
SELECT *
FROM Subject
WHERE Credit = (
    SELECT MAX(Credit)
    FROM Subject
);


-- =========================================================
-- 2. Hiển thị thông tin môn học có điểm thi lớn nhất
-- =========================================================
SELECT DISTINCT
    S.SubjectId,
    S.SubjectName,
    S.Credit
FROM Subject S
JOIN Mark M ON S.SubjectId = M.SubjectId
WHERE M.Mark = (
    SELECT MAX(Mark)
    FROM Mark
);


-- =========================================================
-- 3. Hiển thị thông tin sinh viên và điểm trung bình,
--    xếp theo điểm trung bình giảm dần
-- =========================================================
SELECT
    S.StudentId,
    S.StudentName,
    AVG(M.Mark) AS `Điểm trung bình`
FROM Student S
JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
ORDER BY `Điểm trung bình` DESC;
