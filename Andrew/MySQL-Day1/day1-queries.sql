-- create db
CREATE DATABASE school DEFAULT CHARACTER SET utf8;

-- create table
CREATE TABLE student(
    student_id int,
    first_name varchar(55),
    last_name varchar(55),
    birth_date date,
    PRIMARY KEY (student_id)
)