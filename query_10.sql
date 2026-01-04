-- 10. Список курсів, які певному студенту читає певний викладач (student_id = 1, teacher_id = 1)
SELECT sub.name
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id
WHERE g.student_id = 1 AND sub.teacher_id = 1
GROUP BY sub.id;