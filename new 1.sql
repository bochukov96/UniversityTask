CREATE DATABASE SCHOOL_SPORT_CLUBS;
USE SCHOOL_SPORT_CLUBS;

CREATE TABLE students(
id INT AUTO_INCREMENT PRIMARY KEY,
name  VARCHAR(255) NOT NULL,
egn   VARCHAR(20) NOT NULL UNIQUE,
name  VARCHAR(255) NOT NULL,
phone VARCHAR(20) NOT NULL,
class VARCHAR(20) NOT NULL,
);

CREATE TABLE sportGroups(
id INT AUTO_INCREMENT PRIMARY KEY,
location VARCHAR(255) NOT NULL,
dayOfWeek ENUM('Monday','Thuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
hourOfTraining TIME NOT NULL,
UNIQUE KEY(location,dayOfWeek,hourOfTraining)
);

CREATE TABLE student_sport(
student_id INT NOT NULL,
CONSTRAINT FOREIGN KEY(student_id) REFERENCES students (id),
sportGroup_id INT NOT NULL,
CONSTRAINT FOREIGN KEY(sportGroup_id) REFERENCES sportGroups(id),
PRIMARY KEY(student_id,sportGroup_id),
);

CREATE TABLE  sports(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
);

ALTER TABLE sportGroups
ADD sport_id  INT NOT NULL;

ALTER TABLE sportGroups
ADD CONSTRAINT FOREIGN KEY (sport_id) REFERENCES sports(id);

CREATE TABLE coaches(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
egn VARCHAR(10) NOT NULL UNIQUE,
);

ALTER sportGroups
ADD coach_id INT;

ALTER TABLE sportGroups
ADD CONSTRAINT FOREIGN KEY(coach_id) REFERENCES coaches(id);

