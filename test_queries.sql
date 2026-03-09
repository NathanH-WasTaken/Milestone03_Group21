-- SET SEARCH PATH TO LAB TRACKER GROUP 21
SET search_path TO lab_tracker_group_21;


---------------------------------------
-- ROW COUNT VERIFICATION
-- Expected: terms=3, sets=6, courses=1, users=3, students=18,
--           sections=6, lab_assignments=8, lab_events=18,
--           progress=36, progress_change_log=3
---------------------------------------
SELECT 'terms' AS tbl, COUNT(*) AS row_count FROM terms
UNION ALL SELECT 'sets',    COUNT(*) FROM sets
UNION ALL SELECT 'courses', COUNT(*) FROM courses
UNION ALL SELECT 'users',   COUNT(*) FROM users
UNION ALL SELECT 'students',    COUNT(*) FROM students
UNION ALL SELECT 'sections',    COUNT(*) FROM sections
UNION ALL SELECT 'lab_assignments', COUNT(*) FROM lab_assignments
UNION ALL SELECT 'lab_events',  COUNT(*) FROM lab_events
UNION ALL SELECT 'progress',    COUNT(*) FROM progress
UNION ALL SELECT 'progress_change_log', COUNT(*) FROM progress_change_log
ORDER BY tbl;

/* Check Students With Late Submission */
SELECT student_id, lab_number, inlab_submitted_at, polished_submitted_at, late
FROM progress
WHERE late=TRUE;

/* Number of Students That Came Unprepared */
SELECT COUNT(*) AS number_of_unprepared
FROM progress
WHERE attendance='Present' AND prepared=FALSE;

/* Students Who Did Not Submit Polished Submission */
SELECT student_id, lab_number, status, polished_submission_link
FROM progress
WHERE polished_submission_link IS NULL
ORDER BY student_id, lab_number;

/* Compare Instructor Assessment and Student Assessement */
SELECT student_id,
       lab_number,
       instructor_assessment,
       self_assessment,
       self_assessment - instructor_assessment AS difference
FROM progress
WHERE instructor_assessment IS NOT NULL
ORDER BY student_id, lab_number;

/* Students Who Attended But Never Submitted In-Lab */
SELECT student_id, lab_number, attendance, inlab_submission_link
FROM progress
WHERE attendance = 'Present' AND inlab_submission_link IS NULL;

/* Students With Excused Attendance */
SELECT student_id, lab_number, attendance, status
FROM progress
WHERE attendance = 'Excused';   



---------------------------------------
-- SANITY CHECK
-- Expected: ERROR:  insert or update on table "progress" 
-- violates foreign key constraint 
---------------------------------------
-- INSERT INTO progress 
-- VALUES
-- ('A023-L01-L01', 'A023', 'L01-L01', 1, 'Submitted', TRUE, 'Present', '2025-09-08 10:45', 
-- 'https://submit.bcit.ca/comp2714/inlab/A023-L01-L01.pdf', '2025-09-09 12:45', 
-- 'https://submit.bcit.ca/comp2714/polished/A023-L01-L01.pdf', 8.5, 8.2, FALSE);

---------------------------------------
-- SANITY CHECK: duplicate student email
-- Expected: ERROR - unique constraint violation
---------------------------------------
-- INSERT INTO students (student_id, set_code, first_name, last_name, email)
-- VALUES ('A999', 'A', 'Test', 'User', 'ava.nguyen@my.bcit.ca');

---------------------------------------
-- SANITY CHECK: malformed term_code
-- Expected: ERROR - check constraint violation
---------------------------------------
-- INSERT INTO terms (term_code, name, start_date, end_date)
-- VALUES ('999999', 'Bad Term', '2025-01-01', '2025-04-01');
---------------------------------------
-- SANITY CHECK: invalid attendance value
-- Expected: ERROR - check constraint violation
---------------------------------------
-- INSERT INTO progress (progress_id, student_id, event_id, lab_number, status, prepared, attendance, late)
-- VALUES ('TEST-002', 'A001', 'L01-L02', 2, 'Not Started', FALSE, 'Maybe', FALSE);
---------------------------------------
-- SANITY CHECK: invalid status value
-- Expected: ERROR - check constraint violation
---------------------------------------
-- INSERT INTO progress (progress_id, student_id, event_id, lab_number, status, prepared, attendance, late)
-- VALUES ('TEST-003', 'A001', 'L01-L02', 2, 'Pending', FALSE, 'Absent', FALSE);