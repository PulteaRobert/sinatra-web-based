/* Create a database with more personal information */
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_name TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    /*
    Default role is "mentee"
    There are 3 roles:
    -"mentee"
    -"admin"
    -"mentor"
    */
    email TEXT NOT NULL,
    gender TEXT,
    course TEXT,
    year_of_study TEXT,
    matched_id INTEGER
);

INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("mentee1", "mentee1", "mentee", "mentee_email1", "Male", "Computer Science", "First Year", null);
INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("mentee2", "mentee2", "mentee", "mentee_email2", null, null, null, null);
INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("mentor1", "mentor1", "mentor", "mentor_email1", "Female", "Accounting and Financial Management", null, null);
INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("mentor2", "mentor2", "mentor", "mentor_email2", null, null, null, null);
INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("admin", "admin", "admin", "admin_email", null, null, null, null);















<<<<<<< HEAD
=======
INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("mentee1", "mentee1", "mentee", "mentee_email1", "Male", "Computer Science", "First Year", 1);
INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("mentee2", "mentee2", "mentee", "mentee_email2", null, null, null, null);
INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("mentor1", "mentor1", "mentor", "mentor_email1", "Female", "Accounting and Financial Management", null, null);
INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("mentor2", "mentor2", "mentor", "mentor_email2", null, null, null, null);
INSERT INTO users(user_name, password, role, email, gender, course, year_of_study, matched_id)
VALUES("admin1", "admin1", "admin", "admin_email1", null, null, null, null);
>>>>>>> 99ae2f07165e66366de30538c8e199ca905f10d1
