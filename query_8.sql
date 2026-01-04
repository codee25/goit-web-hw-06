-- 8. Середній бал, який ставить певний викладач зі своїх предметів (teacher_id = 1)
SELECT t.fullname, ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
WHERE t.id = 1;