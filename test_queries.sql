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