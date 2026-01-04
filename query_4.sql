-- 4. Середній бал на потоці (по всій таблиці оцінок)
SELECT ROUND(AVG(grade), 2) AS avg_grade FROM grades;