-- 12. Оцінки студентів у певній групі з певного предмета на останньому занятті (group_id = 1, subject_id = 1)
WITH last_date AS (
    SELECT MAX(date_of) AS max_date
    FROM grades g
    JOIN students s ON g.student_id = s.id
    WHERE s.group_id = 1 AND g.subject_id = 1
)
SELECT s.fullname, g.grade, g.date_of
FROM grades g
JOIN students s ON g.student_id = s.id
WHERE s.group_id = 1 AND g.subject_id = 1
  AND g.date_of = (SELECT max_date FROM last_date);