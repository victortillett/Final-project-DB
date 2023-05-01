DROP TABLE IF EXISTS feeder;
DROP TABLE IF EXISTS program;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student_course;
DROP TABLE IF EXISTS student_program;

CREATE TABLE "feeder" (
  "feeder_id" INT PRIMARY KEY,
  "feeder_name" VARCHAR(100)
);

CREATE TABLE "program" (
  "program_id" INT PRIMARY KEY,
  "program_code" CHAR(4) NOT NULL,
  "program_name" VARCHAR(25) NOT NULL,
  "degree" VARCHAR(25) NOT NULL
);

CREATE TABLE "student" (
  "student_id" INT PRIMARY KEY,
  "dob" CHAR(10),
  "gender" CHAR(1) NOT NULL,
  "ethnicity" CHAR(25),
  "city" VARCHAR(50),
  "district" VARCHAR(50),
  "feeder_id" INT
);

CREATE TABLE "course" (
  "course_id" INT PRIMARY KEY,
  "course_code" CHAR(10) NOT NULL,
  "course_title" VARCHAR(50) NOT NULL,
  "course_credits" INT NOT NULL
);

CREATE TABLE "student_course" (
  "student_course_id" INT PRIMARY KEY,
  "student_id" INT NOT NULL,
  "course_id" INT NOT NULL,
  "semester" CHAR(6),
  "semester_credits_attempted" DECIMAL,
  "semester_credits_earned" DECIMAL,
  "semester_points" DECIMAL,
  "semester_gpa" DECIMAL,
  "course_grade" CHAR(2),
  "course_gpa" DECIMAL,
  "cgpa" DECIMAL,
  "course_points" DECIMAL,
  "comments" VARCHAR(6)
);

CREATE TABLE "student_program" (
  "student_program_id" INT PRIMARY KEY,
  "student_id" INT NOT NULL,
  "program_id" INT NOT NULL,
  "program_status" VARCHAR(15) NOT NULL,
  "program_start" CHAR(10),
  "grad_date" CHAR(10),
  "program_end" CHAR(10)
);

ALTER TABLE "student" ADD FOREIGN KEY ("feeder_id") REFERENCES "feeder" ("feeder_id");

ALTER TABLE "student_course" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");

ALTER TABLE "student_course" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("course_id");

ALTER TABLE "student_program" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");

ALTER TABLE "student_program" ADD FOREIGN KEY ("program_id") REFERENCES "program" ("program_id");
