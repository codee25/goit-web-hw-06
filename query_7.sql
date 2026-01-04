-- 7. Оцінки студентів у окремій групі з певного предмета (group_id = 1, subject_id = 1)
SELECT s.fullname, g.grade, g.date_of
FROM grades g
JOIN students s ON g.student_id = s.id
WHERE s.group_id = 1 AND g.subject_id = 1;