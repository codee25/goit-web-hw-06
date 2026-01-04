-- 9. Список курсів, які відвідує студент (student_id = 1)
SELECT sub.name
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id
WHERE g.student_id = 1
GROUP BY sub.id;