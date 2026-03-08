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