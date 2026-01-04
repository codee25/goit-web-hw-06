-- 11. Середній бал, який певний викладач ставить певному студентові (teacher_id = 1, student_id = 1)
SELECT t.fullname, s.fullname AS student, ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
JOIN students s ON g.student_id = s.id
WHERE t.id = 1 AND s.id = 1;