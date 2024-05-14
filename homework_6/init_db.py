import psycopg2
from faker import Faker
import random
from datetime import datetime, timedelta


# Function to generate random data using Faker test_comment. 
def generate_fake_data():
    students = [(fake.name(), random.randint(1, 3)) for _ in range(30)]
    groups = [(fake.company(),) for _ in range(3)]
    teachers = [(fake.name(),) for _ in range(5)]
    subjects = [(fake.job(), random.randint(1, 5)) for _ in range(5)]

    return students, groups, teachers, subjects

# Function to insert data into the database
def insert_data(conn, cur, students, groups, teachers, subjects):
    # Insert groups
    cur.executemany("INSERT INTO groups (name) VALUES (%s)", groups)
    # Insert teachers
    cur.executemany("INSERT INTO teachers (name) VALUES (%s)", teachers)
    # Insert subjects
    cur.executemany("INSERT INTO subjects (name, teacher_id) VALUES (%s, %s)", subjects)
    conn.commit()

    # Get inserted group and teacher IDs
    cur.execute("SELECT id FROM groups")
    group_ids = [row[0] for row in cur.fetchall()]
    cur.execute("SELECT id FROM teachers")
    teacher_ids = [row[0] for row in cur.fetchall()]

    # Insert students
    students_with_group_ids = [(name, random.choice(group_ids)) for name, _ in students]
    cur.executemany("INSERT INTO students (name, group_id) VALUES (%s, %s)", students_with_group_ids)
    conn.commit()

    # Insert grades
    cur.execute("SELECT id FROM students")
    student_ids = [row[0] for row in cur.fetchall()]
    cur.execute("SELECT id FROM subjects")
    subject_ids = [row[0] for row in cur.fetchall()]
    grades = [(random.choice(student_ids), random.choice(subject_ids), round(random.uniform(2, 5), 1), fake.date_between(start_date='-2y')) for _ in range(20)]
    cur.executemany("INSERT INTO grades (student_id, subject_id, grade, date_received) VALUES (%s, %s, %s, %s)", grades)
    conn.commit()

if __name__ == "__main__":
    # Connect to the PostgreSQL database
    conn = psycopg2.connect(
        dbname="homework_6",
        user="marina_admin",
        password="mar123@@@",
        host="localhost",
        port="5433"
    )
    cur = conn.cursor()

    fake = Faker()
    # Generate fake data
    students, groups, teachers, subjects = generate_fake_data()

    # Insert data into the database
    insert_data(conn, cur, students, groups, teachers, subjects)

    # Close connection
    cur.close()
    conn.close()
