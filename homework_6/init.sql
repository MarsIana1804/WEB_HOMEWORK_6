CREATE DATABASE root;

-- Create the role
CREATE ROLE root WITH LOGIN PASSWORD 'mar123';

-- Grant privileges to the role
GRANT ALL PRIVILEGES ON DATABASE homework_6 TO root;

-- Create table for students
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    group_id INTEGER
);

-- Create table for groups
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Create table for teachers
CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Create table for subjects
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    teacher_id INTEGER REFERENCES teachers(id)
);

-- Create table for grades
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    subject_id INTEGER REFERENCES subjects(id),
    grade FLOAT,
    date_received DATE
);
