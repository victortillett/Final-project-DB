--This query counts the courses that are most frequently failed
SELECT course.course_title, COUNT(*) as num_failures
FROM student_course
JOIN course ON student_course.course_id = course.course_id
WHERE student_course.cgpa < 3.0
GROUP BY course.course_title
ORDER BY num_failures DESC;

--This course measures Graduation Rate
SELECT COUNT(*) AS total_students,
       COUNT(CASE WHEN program_status = 'Graduated' THEN 1 ELSE NULL END) AS graduated_students,
       COUNT(CASE WHEN program_status = 'Graduated' THEN 1 ELSE NULL END) / CAST(COUNT(*) AS FLOAT) AS graduation_rate
FROM student_program;

--This is overall acceptance rate for the BINT program
SELECT COUNT(*) as admission_rate FROM student;

--Ranks feeder institutions by admission rates and grades.
SELECT F.feeder_id, F.feeder_name, 
       COUNT(DISTINCT S.student_id) AS total_students, 
       AVG(SC.student_avg_gpa) AS avg_gpa 
FROM student AS S
JOIN feeder AS F ON S.feeder_id = F.feeder_id 
JOIN (
  SELECT student_id, AVG(cgpa) AS student_avg_gpa
  FROM student_course
  GROUP BY student_id
) AS SC
ON S.student_id = SC.student_id
GROUP BY F.feeder_id, F.feeder_name
ORDER BY total_students DESC, avg_gpa DESC;

--Average student performance per course
SELECT AVG(cgpa) as avg__course_gpa, COUNT(*) as course_taken_count
FROM student_course;

--Student admission count by ethnicity
SELECT ethnicity, COUNT(*) as student_count
FROM student
GROUP BY ethnicity
ORDER BY student_count DESC;

--Student count by feeder institutions
SELECT feeder.feeder_name, COUNT(*) as student_count
FROM student
JOIN feeder ON student.feeder_id = feeder.feeder_id
GROUP BY feeder.feeder_name
ORDER BY student_count DESC;

