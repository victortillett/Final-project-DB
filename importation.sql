--importing data:
COPY feeder
FROM '/home/devpcdesktop/intro_DB/FinalProject/feeder.csv'
DELIMITER ','
CSV HEADER;

COPY program
FROM '/home/devpcdesktop/intro_DB/FinalProject/program.csv'
DELIMITER ','
CSV HEADER;

COPY student
FROM '/home/devpcdesktop/intro_DB/FinalProject/student.csv'
DELIMITER ','
CSV HEADER;

COPY course
FROM '/home/devpcdesktop/intro_DB/FinalProject/course.csv'
DELIMITER ','
CSV HEADER;

COPY student_course
FROM '/home/devpcdesktop/intro_DB/FinalProject/student_course.csv'
DELIMITER ','
CSV HEADER;

COPY student_program
FROM '/home/devpcdesktop/intro_DB/FinalProject/student_program.csv'
DELIMITER ','
CSV HEADER;