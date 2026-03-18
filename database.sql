-- Create Database
CREATE DATABASE IF NOT EXISTS course_evaluation_db;
USE course_evaluation_db;

-- Roles Table
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    full_name VARCHAR(150),
    role_id INT,
    approved BOOLEAN DEFAULT FALSE,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Courses Table
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Teacher-Course Mapping
CREATE TABLE teacher_courses (
    teacher_id INT,
    course_id INT,
    PRIMARY KEY (teacher_id, course_id),
    FOREIGN KEY (teacher_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Surveys Table
CREATE TABLE surveys (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    course_id INT,
    initiator_id INT,
    access_type ENUM('AUTHENTICATED', 'GUEST') NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (initiator_id) REFERENCES users(id)
);

-- Survey Questions
CREATE TABLE survey_questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT,
    question_text TEXT NOT NULL,
    order_index INT DEFAULT 0,
    FOREIGN KEY (survey_id) REFERENCES surveys(id) ON DELETE CASCADE
);

-- Survey Options
CREATE TABLE survey_options (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT,
    option_text VARCHAR(255) NOT NULL,
    FOREIGN KEY (question_id) REFERENCES survey_questions(id) ON DELETE CASCADE
);

-- Survey Responses (Anonymous or Auth)
CREATE TABLE survey_responses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id INT,
    respondent_id INT NULL,
    guest_email VARCHAR(255) NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (survey_id) REFERENCES surveys(id),
    FOREIGN KEY (respondent_id) REFERENCES users(id)
);

-- Survey Answers
CREATE TABLE survey_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    response_id INT,
    question_id INT,
    option_id INT,
    FOREIGN KEY (response_id) REFERENCES survey_responses(id),
    FOREIGN KEY (question_id) REFERENCES survey_questions(id),
    FOREIGN KEY (option_id) REFERENCES survey_options(id)
);

-- Seed Initial Data
INSERT INTO roles (name) VALUES ('ADMIN'), ('INITIATOR'), ('TEACHER'), ('STUDENT');

-- Users (8 per table required for testing)
INSERT INTO users (username, password, email, full_name, role_id, approved) VALUES 
('rp_admin', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@rp.ac.rw', 'RP System Administrator', 1, TRUE),
('registrar', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'registrar@rp.ac.rw', 'Main Registrar', 1, TRUE),
('hod_it', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hod.it@rp.ac.rw', 'HOD Information Technology', 2, TRUE),
('hod_eng', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hod.eng@rp.ac.rw', 'HOD Mechanical Engineering', 2, TRUE),
('lecturer1', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer1@rp.ac.rw', 'Mr. Alphonse Kayitana', 3, TRUE),
('lecturer2', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lecturer2@rp.ac.rw', 'Dr. Diane Uwera', 3, TRUE),
('student_101', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student1@rp.ac.rw', 'Jean Paul Ndayisaba', 4, TRUE),
('student_102', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student2@rp.ac.rw', 'Alice Umutoni', 4, TRUE);

-- Rwanda Polytechnic Courses (8)
INSERT INTO courses (code, name, description) VALUES 
('ITT301', 'Java Enterprise Edition', 'Advanced backend development with Spring Boot and JPA'),
('ITT302', 'Network Security', 'Implementing secure enterprise infrastructures'),
('MEE301', 'Fluid Mechanics', 'Principles of fluid dynamics and applications'),
('MEE302', 'Thermodynamics', 'Energy systems and laws of thermodynamics'),
('ETE301', 'Wireless Communication', 'Modern mobile and satellite communication systems'),
('ETE302', 'Microcontroller Systems', 'Embedded systems design with ARM and PIC'),
('HTM301', 'Food & Beverage Management', 'Professional hospitality service and operations'),
('HTM302', 'Sustainable Tourism', 'Eco-friendly tourism development and conservation');

-- Teacher Assignments (8)
INSERT INTO teacher_courses (teacher_id, course_id) VALUES 
(5, 1), (5, 2), (6, 3), (6, 4), (5, 5), (6, 6), (5, 7), (6, 8);

-- Rwanda Polytechnic Surveys (8)
INSERT INTO surveys (title, description, course_id, initiator_id, access_type) VALUES 
('EE Java Lab Evaluation', 'Student feedback on JE Enterprise lab sessions', 1, 3, 'GUEST'),
('Network Security Review', 'End-term evaluation for Security module', 2, 3, 'AUTHENTICATED'),
('Fluid Mechanics Field Visit', 'Feedback on technical field trip to Nyabarongo', 3, 4, 'AUTHENTICATED'),
('Thermo Final Course Survey', 'General course quality feedback', 4, 4, 'GUEST'),
('Wireless Comms Seminar', 'Evaluation of the 5G technologies workshop', 5, 3, 'AUTHENTICATED'),
('Microcontroller Prototypes', 'Review of end-of-semester project exhibits', 6, 4, 'GUEST'),
('Culinary Arts Practical', 'Kitchen management and service evaluation', 7, 3, 'AUTHENTICATED'),
('Eco-Tourism Strategy', 'Feedback on group research projects', 8, 4, 'GUEST');

-- Survey Questions (8)
INSERT INTO survey_questions (survey_id, question_text, order_index) VALUES 
(1, 'How effective were the practical lab exercises?', 1),
(1, 'Was the instructor available for guidance?', 2),
(2, 'Rate the depth of security protocols covered.', 1),
(2, 'Did the course meet your expectations for industrial prep?', 2),
(3, 'Was the field visit relevant to the module?', 1),
(4, 'Rate the clarity of thermodynamics law explanations.', 1),
(5, 'Did the 5G seminar provide industry insights?', 1),
(6, 'Was the project hardware sufficient and functional?', 1);

-- Survey Options (Expand to 8+ for coverage)
INSERT INTO survey_options (question_id, option_text) VALUES 
(5, 'Strongly Relevant'), (5, 'Somewhat Relevant'), (5, 'Not Relevant'),
(6, 'Exceptional Clarity'), (6, 'Average Clarity'),
(7, 'Very Insightful'), (7, 'Somewhat Insightful'),
(8, 'Highly Sufficient');

-- Survey Responses (Expand to 10 for analysis diversity)
INSERT INTO survey_responses (survey_id, respondent_id, guest_email) VALUES 
(7, 7, NULL),
(8, NULL, 'visitor2@rp.ac.rw');

-- Survey Answers (Expand to 10 for analysis diversity)
INSERT INTO survey_answers (response_id, question_id, option_id) VALUES 
(9, 7, 10), (10, 8, 11);
