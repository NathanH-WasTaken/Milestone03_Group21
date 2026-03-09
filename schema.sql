-- =============================================================
-- Group 21 | schema.sql
-- =============================================================

DROP SCHEMA IF EXISTS lab_tracker_group_21 CASCADE;
CREATE SCHEMA lab_tracker_group_21;
SET search_path TO lab_tracker_group_21;

CREATE TABLE terms (
    term_code   VARCHAR(10)  NOT NULL,
    name        VARCHAR(100) NOT NULL,
    start_date  DATE         NOT NULL,
    end_date    DATE         NOT NULL,
    CONSTRAINT pk_terms        PRIMARY KEY (term_code),
    CONSTRAINT chk_terms_code  CHECK (term_code ~ '^\d{4}(10|20|30)$'),
    CONSTRAINT chk_terms_dates CHECK (end_date > start_date)
);

CREATE TABLE sets (
    set_code  VARCHAR(1)  NOT NULL,
    campus    VARCHAR(100) NOT NULL,
    CONSTRAINT pk_sets PRIMARY KEY (set_code)
);

CREATE TABLE courses (
    course_code  VARCHAR(20)  NOT NULL,
    title        VARCHAR(200) NOT NULL,
    credits      INT          NOT NULL,
    CONSTRAINT pk_courses           PRIMARY KEY (course_code),
    CONSTRAINT chk_credits_positive CHECK (credits > 0)
);

CREATE TABLE users (
    user_id      VARCHAR(50)  NOT NULL,
    display_name VARCHAR(100) NOT NULL,
    role         VARCHAR(50)  NOT NULL,
    email        VARCHAR(100) NOT NULL,
    CONSTRAINT pk_users       PRIMARY KEY (user_id),
    CONSTRAINT uq_users_email UNIQUE (email),
    CONSTRAINT chk_users_role CHECK (role IN ('instructor', 'ta', 'system', 'student'))
);

CREATE TABLE students (
    student_id  VARCHAR(4)  NOT NULL,
    set_code    VARCHAR(1)  NOT NULL,
    first_name  VARCHAR(100) NOT NULL,
    last_name   VARCHAR(100) NOT NULL,
    email       VARCHAR(100) NOT NULL,
    CONSTRAINT pk_students       PRIMARY KEY (student_id),
    CONSTRAINT uq_students_email UNIQUE (email),
    CONSTRAINT fk_students_set   FOREIGN KEY (set_code)
        REFERENCES sets (set_code)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE sections (
    section_code  VARCHAR(20)  NOT NULL,
    course_code   VARCHAR(20)  NOT NULL,
    term_code     VARCHAR(10)  NOT NULL,
    set_code      VARCHAR(10)  NOT NULL,
    type          VARCHAR(50)  NOT NULL DEFAULT 'LAB',
    day_of_week   VARCHAR(20)  NOT NULL,
    start_time    TIME         NOT NULL,
    end_time      TIME         NOT NULL,
    location      VARCHAR(100),
    CONSTRAINT pk_sections        PRIMARY KEY (section_code),
    CONSTRAINT fk_sections_course FOREIGN KEY (course_code)
        REFERENCES courses (course_code)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_sections_term   FOREIGN KEY (term_code)
        REFERENCES terms (term_code)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_sections_set    FOREIGN KEY (set_code)
        REFERENCES sets (set_code)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_sections_times CHECK (end_time > start_time)
);

CREATE TABLE lab_assignments (
    assignment_id  VARCHAR(50)  NOT NULL,
    course_code    VARCHAR(20)  NOT NULL,
    term_code      VARCHAR(10)  NOT NULL,
    lab_number     INT          NOT NULL,
    title          VARCHAR(200) NOT NULL,
    CONSTRAINT pk_lab_assignments      PRIMARY KEY (assignment_id),
    CONSTRAINT fk_lab_assign_course    FOREIGN KEY (course_code)
        REFERENCES courses (course_code)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_lab_assign_term      FOREIGN KEY (term_code)
        REFERENCES terms (term_code)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_lab_number_positive CHECK (lab_number > 0)
);

CREATE TABLE lab_events (
    event_id        VARCHAR(50)  NOT NULL,
    section_code    VARCHAR(20)  NOT NULL,
    course_code     VARCHAR(20)  NOT NULL,
    term_code       VARCHAR(10)  NOT NULL,
    lab_number      INT          NOT NULL,
    start_datetime  TIMESTAMP    NOT NULL,
    end_datetime    TIMESTAMP    NOT NULL,
    due_datetime    TIMESTAMP    NOT NULL,
    location        VARCHAR(100),
    CONSTRAINT pk_lab_events         PRIMARY KEY (event_id),
    CONSTRAINT fk_lab_events_section FOREIGN KEY (section_code)
        REFERENCES sections (section_code)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_lab_events_course  FOREIGN KEY (course_code)
        REFERENCES courses (course_code)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_lab_events_term    FOREIGN KEY (term_code)
        REFERENCES terms (term_code)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_lab_events_times  CHECK (end_datetime > start_datetime),
    CONSTRAINT chk_lab_events_due    CHECK (due_datetime >= start_datetime)
);

CREATE TABLE progress (
    progress_id               VARCHAR(50)  NOT NULL,
    student_id                VARCHAR(4)  NOT NULL,
    event_id                  VARCHAR(50)  NOT NULL,
    lab_number                INT          NOT NULL,
    status                    VARCHAR(50)  NOT NULL DEFAULT 'Not Started',
    prepared                  BOOLEAN      NOT NULL DEFAULT FALSE,
    attendance                VARCHAR(50)  NOT NULL DEFAULT 'Absent',
    inlab_submitted_at        TIMESTAMP,
    inlab_submission_link     TEXT,
    polished_submitted_at     TIMESTAMP,
    polished_submission_link  TEXT,
    instructor_assessment     DECIMAL(3,1),
    self_assessment           DECIMAL(3,1),
    late                      BOOLEAN      NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_progress               PRIMARY KEY (progress_id),
    CONSTRAINT uq_progress_student_event UNIQUE (student_id, event_id),
    CONSTRAINT fk_progress_student       FOREIGN KEY (student_id)
        REFERENCES students (student_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_progress_event         FOREIGN KEY (event_id)
        REFERENCES lab_events (event_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_progress_status      CHECK (status IN ('Not Started', 'In Progress', 'Submitted', 'Late', 'Excused')),
    CONSTRAINT chk_progress_attendance  CHECK (attendance IN ('Present', 'Absent', 'Excused')),
    CONSTRAINT chk_progress_instr_score CHECK (instructor_assessment BETWEEN 0 AND 10),
    CONSTRAINT chk_progress_self_score  CHECK (self_assessment BETWEEN 0 AND 10)
);

CREATE TABLE progress_change_log (
    change_id    VARCHAR(50)  NOT NULL,
    progress_id  VARCHAR(50)  NOT NULL,
    changed_by   VARCHAR(50)  NOT NULL,
    changed_at   TIMESTAMP    NOT NULL DEFAULT NOW(),
    field        VARCHAR(100) NOT NULL,
    old_value    TEXT,
    new_value    TEXT,
    reason       TEXT,
    CONSTRAINT pk_change_log          PRIMARY KEY (change_id),
    CONSTRAINT fk_change_log_progress FOREIGN KEY (progress_id)
        REFERENCES progress (progress_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_change_log_user     FOREIGN KEY (changed_by)
        REFERENCES users (user_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);