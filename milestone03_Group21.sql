DROP SCHEMA IF EXISTS lab_tracker_group_21 CASCADE;
CREATE SCHEMA lab_tracker_group_21;
SET search_path TO lab_tracker_group_21;

CREATE TABLE terms (
    term_code   VARCHAR(10) PRIMARY KEY,
    name        VARCHAR(100),
    start_date  DATE,
    end_date    DATE
);

CREATE TABLE sets (
    set_code  VARCHAR(10) PRIMARY KEY,
    campus    VARCHAR(100)
);

CREATE TABLE courses (
    course_code  VARCHAR(20) PRIMARY KEY,
    title        VARCHAR(200),
    credits      INT
);

CREATE TABLE users (
    user_id       VARCHAR(50) PRIMARY KEY,
    display_name  VARCHAR(100),
    role          VARCHAR(50),
    email         VARCHAR(100)
);

CREATE TABLE students (
    student_id  VARCHAR(20) PRIMARY KEY,
    set_code    VARCHAR(10) REFERENCES sets(set_code),
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
    email       VARCHAR(100)
);

CREATE TABLE sections (
    section_code  VARCHAR(20) PRIMARY KEY,
    course_code   VARCHAR(20) REFERENCES courses(course_code),
    term_code     VARCHAR(10) REFERENCES terms(term_code),
    set_code      VARCHAR(10) REFERENCES sets(set_code),
    type          VARCHAR(50),
    day_of_week   VARCHAR(20),
    start_time    TIME,
    end_time      TIME,
    location      VARCHAR(100)
);

CREATE TABLE lab_assignments (
    assignment_id  VARCHAR(50) PRIMARY KEY,
    course_code    VARCHAR(20) REFERENCES courses(course_code),
    term_code      VARCHAR(10) REFERENCES terms(term_code),
    lab_number     INT,
    title          VARCHAR(200)
);

CREATE TABLE lab_events (
    event_id        VARCHAR(50) PRIMARY KEY,
    section_code    VARCHAR(20) REFERENCES sections(section_code),
    course_code     VARCHAR(20) REFERENCES courses(course_code),
    term_code       VARCHAR(10) REFERENCES terms(term_code),
    lab_number      INT,
    start_datetime  TIMESTAMP,
    end_datetime    TIMESTAMP,
    due_datetime    TIMESTAMP,
    location        VARCHAR(100)
);

CREATE TABLE progress (
    progress_id               VARCHAR(50) PRIMARY KEY,
    student_id                VARCHAR(20) REFERENCES students(student_id),
    event_id                  VARCHAR(50) REFERENCES lab_events(event_id),
    lab_number                INT,
    status                    VARCHAR(50),
    prepared                  BOOLEAN,
    attendance                VARCHAR(50),
    inlab_submitted_at        TIMESTAMP,
    inlab_submission_link     TEXT,
    polished_submitted_at     TIMESTAMP,
    polished_submission_link  TEXT,
    instructor_assessment     VARCHAR(50),
    self_assessment           VARCHAR(50),
    late                      BOOLEAN
);

CREATE TABLE progress_change_log (
    change_id    VARCHAR(50) PRIMARY KEY,
    progress_id  VARCHAR(50) REFERENCES progress(progress_id),
    changed_by   VARCHAR(50),
    changed_at   TIMESTAMP,
    field        VARCHAR(100),
    old_value    TEXT,
    new_value    TEXT,
    reason       TEXT
);