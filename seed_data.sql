/* Terms, Sets, Students */

---------------------------------------
-- TERMS
---------------------------------------
INSERT INTO TERMS VALUES ("202510", "Winter 2025", 2025-01-06, 2025-05-23);
INSERT INTO TERMS VALUES ("202520", "Spring/Summer 2025", 2025-05-25, 2025-06-20);
INSERT INTO TERMS VALUES ("202530", "Fall 2025", 2025-09-02, 2025-12-12);


---------------------------------------
-- SETS
---------------------------------------
INSERT INTO SETS VALUES ("A", "Burnaby");
INSERT INTO SETS VALUES ("B", "Burnaby");
INSERT INTO SETS VALUES ("C", "Burnaby");
INSERT INTO SETS VALUES ("D", "Burnaby");
INSERT INTO SETS VALUES ("E", "Downtown");
INSERT INTO SETS VALUES ("F", "Downtown");


---------------------------------------
-- COURSES
---------------------------------------
INSERT INTO courses (course_code, title, credits)
VALUES ('COMP2714', 'Relational Database Systems', 3);


---------------------------------------
-- USERS
---------------------------------------
INSERT INTO users (user_id, display_name, role, email)
VALUES (u_instructor, Maryam Khezrzadeh, instructor, mkhezrzadeh@bcit.ca);

INSERT INTO users (user_id, display_name, role, email)
VALUES (u_ta1, Daniel Saavedra, ta, dsaavedra@bcit.ca);

INSERT INTO users (user_id, display_name, role, email)
VALUES (u_system, Lab Tracker System , system, noreply@labtracker.local);

<<<<<<< HEAD
---------------------------------------
-- PROGRESS
---------------------------------------

INSERT INTO progress (progress_id, student_id, event_id, lab_number, status, prepared, attendance, inlab_submitted_at, inlab_submission_link, polished_submitted_at, polished_submission_link, instructor_assessment, self_assessment, late)
VALUES
    ('A001-L01-L01', 'A001', 'L01-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-08 10:45', 'https://submit.bcit.ca/comp2714/inlab/A001-L01-L01.pdf', '2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A001-L01-L01.pdf', '8.5', '8.2', FALSE),
    ('A001-L01-L02', 'A001', 'L01-L02', '2', 'Submitted', TRUE, 'Present', '2025-09-15 10:35', 'https://submit.bcit.ca/comp2714/inlab/A001-L01-L02.pdf', '2025-09-17 11:35', 'https://submit.bcit.ca/comp2714/polished/A001-L01-L02.pdf', '7.0', '6.7', FALSE),
    ('A002-L01-L01', 'A002', 'L01-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-08 10:45', 'https://submit.bcit.ca/comp2714/inlab/A002-L01-L01.pdf', '2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A002-L01-L01.pdf', '8.5', '8.2', FALSE),
    ('A002-L01-L02', 'A002', 'L01-L02', '2', 'In Progress', TRUE, 'Present', '2025-09-15 10:40', 'https://submit.bcit.ca/comp2714/inlab/A002-L01-L02.pdf', NULL, NULL, NULL, NULL, FALSE),
    ('A003-L01-L01', 'A003', 'L01-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-08 10:45', 'https://submit.bcit.ca/comp2714/inlab/A003-L01-L01.pdf', '2025-09-09 12:45', 'https://submit.bcit.ca/comp2714/polished/A003-L01-L01.pdf', '8.5', '8.2', FALSE),
    ('A003-L01-L02', 'A003', 'L01-L02', '2', 'Submitted', FALSE, 'Present', '2025-09-15 10:35', 'https://submit.bcit.ca/comp2714/inlab/A003-L01-L02.pdf', '2025-09-17 11:35', 'https://submit.bcit.ca/comp2714/polished/A003-L01-L02.pdf', '7.0', '6.7', FALSE),
    ('B001-L02-L01', 'B001', 'L02-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-08 14:45', 'https://submit.bcit.ca/comp2714/inlab/B001-L02-L01.pdf', '2025-09-09 16:45', 'https://submit.bcit.ca/comp2714/polished/B001-L02-L01.pdf', '8.5', '8.2', FALSE),
    ('B001-L02-L02', 'B001', 'L02-L02', '2', 'Submitted', TRUE, 'Present', '2025-09-15 14:35', 'https://submit.bcit.ca/comp2714/inlab/B001-L02-L02.pdf', '2025-09-17 15:35', 'https://submit.bcit.ca/comp2714/polished/B001-L02-L02.pdf', '7.0', '6.7', FALSE),
    ('B002-L02-L01', 'B002', 'L02-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-08 14:45', 'https://submit.bcit.ca/comp2714/inlab/B002-L02-L01.pdf', '2025-09-09 16:45', 'https://submit.bcit.ca/comp2714/polished/B002-L02-L01.pdf', '8.5', '8.2', FALSE),
    ('B002-L02-L02', 'B002', 'L02-L02', '2', 'In Progress', TRUE, 'Present', '2025-09-15 14:40', 'https://submit.bcit.ca/comp2714/inlab/B002-L02-L02.pdf', NULL, NULL, NULL, NULL, FALSE),
    ('B003-L02-L01', 'B003', 'L02-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-08 14:45', 'https://submit.bcit.ca/comp2714/inlab/B003-L02-L01.pdf', '2025-09-09 16:45', 'https://submit.bcit.ca/comp2714/polished/B003-L02-L01.pdf', '8.5', '8.2', FALSE),
    ('B003-L02-L02', 'B003', 'L02-L02', '2', 'Submitted', FALSE, 'Present', '2025-09-15 14:35', 'https://submit.bcit.ca/comp2714/inlab/B003-L02-L02.pdf', '2025-09-17 15:35', 'https://submit.bcit.ca/comp2714/polished/B003-L02-L02.pdf', '7.0', '6.7', FALSE),
    ('C001-L03-L01', 'C001', 'L03-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-09 19:45', 'https://submit.bcit.ca/comp2714/inlab/C001-L03-L01.pdf', '2025-09-10 21:45', 'https://submit.bcit.ca/comp2714/polished/C001-L03-L01.pdf', '8.5', '8.2', FALSE),
    ('C001-L03-L02', 'C001', 'L03-L02', '2', 'Submitted', TRUE, 'Present', '2025-09-16 19:35', 'https://submit.bcit.ca/comp2714/inlab/C001-L03-L02.pdf', '2025-09-18 20:35', 'https://submit.bcit.ca/comp2714/polished/C001-L03-L02.pdf', '7.0', '6.7', FALSE),
    ('C002-L03-L01', 'C002', 'L03-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-09 19:45', 'https://submit.bcit.ca/comp2714/inlab/C002-L03-L01.pdf', '2025-09-10 21:45', 'https://submit.bcit.ca/comp2714/polished/C002-L03-L01.pdf', '8.5', '8.2', FALSE),
    ('C002-L03-L02', 'C002', 'L03-L02', '2', 'In Progress', TRUE, 'Present', '2025-09-16 19:40', 'https://submit.bcit.ca/comp2714/inlab/C002-L03-L02.pdf', NULL, NULL, NULL, NULL, FALSE),
    ('C003-L03-L01', 'C003', 'L03-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-09 19:45', 'https://submit.bcit.ca/comp2714/inlab/C003-L03-L01.pdf', '2025-09-10 21:45', 'https://submit.bcit.ca/comp2714/polished/C003-L03-L01.pdf', '8.5', '8.2', FALSE),
    ('C003-L03-L02', 'C003', 'L03-L02', '2', 'Submitted', FALSE, 'Present', '2025-09-16 19:35', 'https://submit.bcit.ca/comp2714/inlab/C003-L03-L02.pdf', '2025-09-18 20:35', 'https://submit.bcit.ca/comp2714/polished/C003-L03-L02.pdf', '7.0', '6.7', FALSE),
    ('D001-L04-L01', 'D001', 'L04-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-10 10:45', 'https://submit.bcit.ca/comp2714/inlab/D001-L04-L01.pdf', '2025-09-11 12:45', 'https://submit.bcit.ca/comp2714/polished/D001-L04-L01.pdf', '8.5', '8.2', FALSE),
    ('D001-L04-L02', 'D001', 'L04-L02', '2', 'Submitted', TRUE, 'Present', '2025-09-17 10:35', 'https://submit.bcit.ca/comp2714/inlab/D001-L04-L02.pdf', '2025-09-19 11:35', 'https://submit.bcit.ca/comp2714/polished/D001-L04-L02.pdf', '7.0', '6.7', FALSE),
    ('D002-L04-L01', 'D002', 'L04-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-10 10:45', 'https://submit.bcit.ca/comp2714/inlab/D002-L04-L01.pdf', '2025-09-11 12:45', 'https://submit.bcit.ca/comp2714/polished/D002-L04-L01.pdf', '8.5', '8.2', FALSE),
    ('D002-L04-L02', 'D002', 'L04-L02', '2', 'In Progress', TRUE, 'Present', '2025-09-17 10:40', 'https://submit.bcit.ca/comp2714/inlab/D002-L04-L02.pdf', NULL, NULL, NULL, NULL, FALSE),
    ('D003-L04-L01', 'D003', 'L04-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-10 10:45', 'https://submit.bcit.ca/comp2714/inlab/D003-L04-L01.pdf', '2025-09-11 12:45', 'https://submit.bcit.ca/comp2714/polished/D003-L04-L01.pdf', '8.5', '8.2', FALSE),
    ('D003-L04-L02', 'D003', 'L04-L02', '2', 'Submitted', FALSE, 'Present', '2025-09-17 10:35', 'https://submit.bcit.ca/comp2714/inlab/D003-L04-L02.pdf', '2025-09-19 11:35', 'https://submit.bcit.ca/comp2714/polished/D003-L04-L02.pdf', '7.0', '6.7', FALSE),
    ('E001-L05-L01', 'E001', 'L05-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-10 14:45', 'https://submit.bcit.ca/comp2714/inlab/E001-L05-L01.pdf', '2025-09-11 16:45', 'https://submit.bcit.ca/comp2714/polished/E001-L05-L01.pdf', '8.5', '8.2', FALSE),
    ('E001-L05-L02', 'E001', 'L05-L02', '2', 'Submitted', TRUE, 'Present', '2025-09-17 14:35', 'https://submit.bcit.ca/comp2714/inlab/E001-L05-L02.pdf', '2025-09-19 15:35', 'https://submit.bcit.ca/comp2714/polished/E001-L05-L02.pdf', '7.0', '6.7', FALSE),
    ('E002-L05-L01', 'E002', 'L05-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-10 14:45', 'https://submit.bcit.ca/comp2714/inlab/E002-L05-L01.pdf', '2025-09-11 16:45', 'https://submit.bcit.ca/comp2714/polished/E002-L05-L01.pdf', '8.5', '8.2', FALSE),
    ('E002-L05-L02', 'E002', 'L05-L02', '2', 'In Progress', TRUE, 'Present', '2025-09-17 14:40', 'https://submit.bcit.ca/comp2714/inlab/E002-L05-L02.pdf', NULL, NULL, NULL, NULL, FALSE),
    ('E003-L05-L01', 'E003', 'L05-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-10 14:45', 'https://submit.bcit.ca/comp2714/inlab/E003-L05-L01.pdf', '2025-09-11 16:45', 'https://submit.bcit.ca/comp2714/polished/E003-L05-L01.pdf', '8.5', '8.2', FALSE),
    ('E003-L05-L02', 'E003', 'L05-L02', '2', 'Submitted', FALSE, 'Present', '2025-09-17 14:35', 'https://submit.bcit.ca/comp2714/inlab/E003-L05-L02.pdf', '2025-09-19 15:35', 'https://submit.bcit.ca/comp2714/polished/E003-L05-L02.pdf', '7.0', '6.7', FALSE),
    ('F001-L06-L01', 'F001', 'L06-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F001-L06-L01.pdf', '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F001-L06-L01.pdf', '8.5', '8.2', FALSE),
    ('F001-L06-L02', 'F001', 'L06-L02', '2', 'Submitted', TRUE, 'Present', '2025-09-18 19:35', 'https://submit.bcit.ca/comp2714/inlab/F001-L06-L02.pdf', '2025-09-20 20:35', 'https://submit.bcit.ca/comp2714/polished/F001-L06-L02.pdf', '7.0', '6.7', FALSE),
    ('F002-L06-L01', 'F002', 'L06-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F002-L06-L01.pdf', '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F002-L06-L01.pdf', '8.5', '8.2', FALSE),
    ('F002-L06-L02', 'F002', 'L06-L02', '2', 'In Progress', TRUE, 'Present', '2025-09-18 19:40', 'https://submit.bcit.ca/comp2714/inlab/F002-L06-L02.pdf', NULL, NULL, NULL, NULL, FALSE),
    ('F003-L06-L01', 'F003', 'L06-L01', '1', 'Submitted', TRUE, 'Present', '2025-09-11 19:45', 'https://submit.bcit.ca/comp2714/inlab/F003-L06-L01.pdf', '2025-09-12 21:45', 'https://submit.bcit.ca/comp2714/polished/F003-L06-L01.pdf', '8.5', '8.2', FALSE),
    ('F003-L06-L02', 'F003', 'L06-L02', '2', 'Submitted', FALSE, 'Present', '2025-09-18 19:35', 'https://submit.bcit.ca/comp2714/inlab/F003-L06-L02.pdf', '2025-09-20 20:35', 'https://submit.bcit.ca/comp2714/polished/F003-L06-L02.pdf', '7.0', '6.7', FALSE);
=======

---------------------------------------
-- STUDENTS
---------------------------------------
INSERT INTO STUDENTS VALUES ("A001", "A", "Ava", "Nguyen", "ava.nguyen@my.bcit.ca");
INSERT INTO STUDENTS VALUES ("A002", "A", "Noah", "Kim", "noah.kim@my.bcit.ca");
INSERT INTO STUDENTS VALUES ("A003", "A", "Oliver", "Singh", "oliver.singh@my.bcit.ca");
INSERT INTO STUDENTS VALUES ("B001", "B", "Maya", "Fisher", "maya.fisher@my.bcit.ca");
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);
INSERT INTO STUDENTS VALUES (PLACEHOLDER);

>>>>>>> f1c84c9ab6f812ddc9b1bbcc93a8507b30debfe5
