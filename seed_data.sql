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

