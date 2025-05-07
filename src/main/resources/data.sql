-- Insert 10 students
INSERT INTO student (id, name, email) VALUES (1, 'Udit Nayak', 'udit.nayak@example.com');
INSERT INTO student (id, name, email) VALUES (2, 'Priya Patel', 'priya.patel@example.com');
INSERT INTO student (id, name, email) VALUES (3, 'Vikram Singh', 'vikram.singh@example.com');
INSERT INTO student (id, name, email) VALUES (4, 'Neha Gupta', 'neha.gupta@example.com');
INSERT INTO student (id, name, email) VALUES (5, 'Rahul Verma', 'rahul.verma@example.com');
INSERT INTO student (id, name, email) VALUES (6, 'Ananya Joshi', 'ananya.joshi@example.com');
INSERT INTO student (id, name, email) VALUES (7, 'Karan Malhotra', 'karan.malhotra@example.com');
INSERT INTO student (id, name, email) VALUES (8, 'Divya Kapoor', 'divya.kapoor@example.com');
INSERT INTO student (id, name, email) VALUES (9, 'Amit Kumar', 'amit.kumar@example.com');
INSERT INTO student (id, name, email) VALUES (10, 'Meera Reddy', 'meera.reddy@example.com');

-- Insert 10 computer science courses
INSERT INTO course (id, title, description) VALUES (1, 'Java Programming', 'Core Java concepts and object-oriented programming');
INSERT INTO course (id, title, description) VALUES (2, 'Data Structures', 'Implementation of various data structures and algorithms');
INSERT INTO course (id, title, description) VALUES (3, 'Web Development', 'HTML, CSS, JavaScript and modern frameworks');
INSERT INTO course (id, title, description) VALUES (4, 'Database Systems', 'SQL, database design and normalization');
INSERT INTO course (id, title, description) VALUES (5, 'Machine Learning', 'Fundamentals of ML algorithms and implementations');
INSERT INTO course (id, title, description) VALUES (6, 'Computer Networks', 'Network protocols, architecture and security');
INSERT INTO course (id, title, description) VALUES (7, 'Cloud Computing', 'AWS, Azure and cloud infrastructure management');
INSERT INTO course (id, title, description) VALUES (8, 'Mobile App Development', 'Android and iOS app development principles');
INSERT INTO course (id, title, description) VALUES (9, 'DevOps', 'CI/CD pipelines, containerization and deployment strategies');
INSERT INTO course (id, title, description) VALUES (10, 'Cybersecurity', 'Network security, cryptography and ethical hacking');

-- Insert 20 student-course relationships
INSERT INTO student_courses VALUES (1, 1);
INSERT INTO student_courses VALUES (1, 2);
INSERT INTO student_courses VALUES (1, 5);
INSERT INTO student_courses VALUES (2, 3);
INSERT INTO student_courses VALUES (2, 4);
INSERT INTO student_courses VALUES (3, 1);
INSERT INTO student_courses VALUES (3, 6);
INSERT INTO student_courses VALUES (4, 5);
INSERT INTO student_courses VALUES (4, 7);
INSERT INTO student_courses VALUES (5, 8);
INSERT INTO student_courses VALUES (5, 9);
INSERT INTO student_courses VALUES (6, 10);
INSERT INTO student_courses VALUES (6, 2);
INSERT INTO student_courses VALUES (7, 3);
INSERT INTO student_courses VALUES (7, 7);
INSERT INTO student_courses VALUES (8, 4);
INSERT INTO student_courses VALUES (8, 9);
INSERT INTO student_courses VALUES (9, 1);
INSERT INTO student_courses VALUES (9, 10);
INSERT INTO student_courses VALUES (10, 2);
