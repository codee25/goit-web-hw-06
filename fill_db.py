import sqlite3
from faker import Faker
import random
from datetime import datetime, timedelta

DB_NAME = "students.db"
NUM_STUDENTS = 40
NUM_GROUPS = 3
NUM_TEACHERS = 4
NUM_SUBJECTS = 7
MIN_GRADES = 15
MAX_GRADES = 20

fake = Faker("uk_UA")

conn = sqlite3.connect(DB_NAME)
cursor = conn.cursor()

with open("schema.sql", encoding="utf-8") as f:
    cursor.executescript(f.read())

# Groups
groups = [f"Група {i+1}" for i in range(NUM_GROUPS)]
for name in groups:
    cursor.execute("INSERT INTO groups (name) VALUES (?)", (name,))

# Teachers
teachers = [fake.name() for _ in range(NUM_TEACHERS)]
for name in teachers:
    cursor.execute("INSERT INTO teachers (fullname) VALUES (?)", (name,))

# Subjects
subjects = [f"Предмет {i+1}" for i in range(NUM_SUBJECTS)]
for name in subjects:
    teacher_id = random.randint(1, NUM_TEACHERS)
    cursor.execute(
        "INSERT INTO subjects (name, teacher_id) VALUES (?, ?)", (name, teacher_id)
    )

# Students
for _ in range(NUM_STUDENTS):
    fullname = fake.name()
    group_id = random.randint(1, NUM_GROUPS)
    cursor.execute(
        "INSERT INTO students (fullname, group_id) VALUES (?, ?)", (fullname, group_id)
    )

# Grades
student_ids = [row[0] for row in cursor.execute("SELECT id FROM students").fetchall()]
subject_ids = [row[0] for row in cursor.execute("SELECT id FROM subjects").fetchall()]
for student_id in student_ids:
    for subject_id in subject_ids:
        for _ in range(random.randint(MIN_GRADES, MAX_GRADES)):
            grade = random.randint(1, 12)
            days_ago = random.randint(1, 120)
            date_of = (datetime.now() - timedelta(days=days_ago)).date()
            cursor.execute(
                "INSERT INTO grades (student_id, subject_id, grade, date_of) VALUES (?, ?, ?, ?)",
                (student_id, subject_id, grade, date_of),
            )

conn.commit()
conn.close()
