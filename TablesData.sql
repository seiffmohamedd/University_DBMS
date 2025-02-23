CREATE TABLE Departments (
    departmentID NUMBER PRIMARY KEY,
    mgrID NUMBER,
    departmentName VARCHAR2(100)
);


CREATE TABLE Employees (
    employeeID NUMBER PRIMARY KEY,
    departmentID NUMBER,
    supervisorID NUMBER,
    fName VARCHAR2(100),
    lName VARCHAR2(100),
    salary NUMBER,
    hire_date DATE,
    end_date DATE,
    email VARCHAR2(100),
    type VARCHAR2(50),
    CONSTRAINT fk_employee_department FOREIGN KEY (departmentID) REFERENCES Departments(departmentID),
    CONSTRAINT fk_employee_supervisor FOREIGN KEY (supervisorID) REFERENCES Employees(employeeID)
);

CREATE TABLE Students (
    studentID NUMBER PRIMARY KEY,
    departmentID NUMBER,
    name VARCHAR2(100),
    DOB DATE,
    email VARCHAR2(100),
    academicYear NUMBER,
    CONSTRAINT fk_student_department FOREIGN KEY (departmentID) REFERENCES Departments(departmentID)
);

ALTER TABLE Departments
ADD CONSTRAINT fk_department_mgr FOREIGN KEY (mgrID) REFERENCES Employees(employeeID);

CREATE TABLE Courses (
    courseCode VARCHAR2(10) PRIMARY KEY,
    instructorID NUMBER,
    courseName VARCHAR2(100),
    creditHours NUMBER,
    CONSTRAINT fk_course_instructor FOREIGN KEY (instructorID) REFERENCES Employees(employeeID)
);

CREATE TABLE StudentCourses (
    studentID NUMBER,
    courseCode VARCHAR2(10),
    PRIMARY KEY (studentID, courseCode),
    CONSTRAINT fk_student_course_student FOREIGN KEY (studentID) REFERENCES Students(studentID),
    CONSTRAINT fk_student_course_course FOREIGN KEY (courseCode) REFERENCES Courses(courseCode)
);

CREATE TABLE Classrooms (
    classroomID NUMBER PRIMARY KEY,
    floorNo NUMBER,
    buildingNo NUMBER
);

CREATE TABLE CourseClassroom (
    courseCode VARCHAR2(10),
    classroomID NUMBER,
    datee DATE,
    PRIMARY KEY (courseCode, classroomID, datee),
    CONSTRAINT fk_courseclassroom_course FOREIGN KEY (courseCode) REFERENCES Courses(courseCode),
    CONSTRAINT fk_courseclassroom_classroom FOREIGN KEY (classroomID) REFERENCES Classrooms(classroomID)
);

CREATE TABLE Assessments (
    assessmentID NUMBER,
    year NUMBER,
    semester VARCHAR2(10),
    type VARCHAR2(50),
    maxScore NUMBER,
    PRIMARY KEY (assessmentID, year, semester)
);
commit;
CREATE TABLE CourseAssessments (
    courseCode VARCHAR2(10),
    assessmentID NUMBER,
    studentID NUMBER,
    year NUMBER,
    semester VARCHAR2(10),
    grade NUMBER,
    PRIMARY KEY (courseCode, assessmentID, studentID, year, semester),
    CONSTRAINT fk_courseassessment_course FOREIGN KEY (courseCode) REFERENCES Courses(courseCode),
    CONSTRAINT fk_courseassessment_assessment FOREIGN KEY (assessmentID, year, semester) REFERENCES Assessments(assessmentID, year, semester),
    CONSTRAINT fk_courseassessment_student FOREIGN KEY (studentID) REFERENCES Students(studentID)
);


CREATE TABLE Events (
    eventID NUMBER PRIMARY KEY,
    instructorID NUMBER,
    site VARCHAR2(100),
    datee DATE,
    CONSTRAINT fk_event_instructor FOREIGN KEY (instructorID) REFERENCES Employees(employeeID)
);

CREATE TABLE StudentEvents (
    studentID NUMBER,
    eventID NUMBER,
    PRIMARY KEY (studentID, eventID),
    CONSTRAINT fk_studentevent_student FOREIGN KEY (studentID) REFERENCES Students(studentID),
    CONSTRAINT fk_studentevent_event FOREIGN KEY (eventID) REFERENCES Events(eventID)
);

CREATE TABLE Transportation (
    vehicleID NUMBER PRIMARY KEY,
    driverID NUMBER,
    route VARCHAR2(100)
);

CREATE TABLE EmployeeTransportation (
    employeeID NUMBER,
    vehicleID NUMBER,
    PRIMARY KEY (employeeID, vehicleID),
    CONSTRAINT fk_employeetransport_employee FOREIGN KEY (employeeID) REFERENCES Employees(employeeID),
    CONSTRAINT fk_employeetransport_vehicle FOREIGN KEY (vehicleID) REFERENCES Transportation(vehicleID)
);

CREATE TABLE StudentTransportation (
    studentID NUMBER,
    vehicleID NUMBER,
    PRIMARY KEY (studentID, vehicleID),
    CONSTRAINT fk_studenttransport_student FOREIGN KEY (studentID) REFERENCES Students(studentID),
    CONSTRAINT fk_studenttransport_vehicle FOREIGN KEY (vehicleID) REFERENCES Transportation(vehicleID)
);

INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (1, null, 'CS');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (2, null, 'IS');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (3, null, 'AI');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (4, null, 'HR');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (5, null, 'IT');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (6, null, 'DS');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (7, null, 'Drivers');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (8, null, 'Student Affairs');
select * from DEPARTMENTS;


INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) VALUES
(19, 1, NULL, 'Karim', 'Youssef', 49000, TO_DATE('2021-03-15', 'YYYY-MM-DD'), NULL, 'karim.youssef@example.com', 'Professor'),
(20, 1, NULL, 'Laila', 'Hassan', 51000, TO_DATE('2019-07-22', 'YYYY-MM-DD'), NULL, 'laila.hassan@example.com', 'Professor'),
(21, 2, NULL, 'Omar', 'Khaled', 53000, TO_DATE('2020-05-18', 'YYYY-MM-DD'), NULL, 'omar.khaled@example.com', 'Professor'),
(22, 2, NULL, 'Sara', 'Mahmoud', 50000, TO_DATE('2018-11-30', 'YYYY-MM-DD'), NULL, 'sara.mahmoud@example.com', 'Professor'),
(23, 3, NULL, 'Tamer', 'Saeed', 52000, TO_DATE('2021-08-10', 'YYYY-MM-DD'), NULL, 'tamer.saeed@example.com', 'Professor'),
(24, 3, NULL, 'Hala', 'Ragab', 55000, TO_DATE('2019-02-25', 'YYYY-MM-DD'), NULL, 'hala.ragab@example.com', 'Professor'),
(25, 4, NULL, 'Nour', 'Adel', 50000, TO_DATE('2022-01-05', 'YYYY-MM-DD'), NULL, 'nour.adel@example.com', 'Professor'),
(26, 4, NULL, 'Ahmed', 'Mostafa', 54000, TO_DATE('2018-06-14', 'YYYY-MM-DD'), NULL, 'ahmed.mostafa@example.com', 'Professor'),
(27, 5, NULL, 'Dina', 'Fawzy', 52000, TO_DATE('2020-09-01', 'YYYY-MM-DD'), NULL, 'dina.fawzy@example.com', 'Professor'),
(28, 5, NULL, 'Yasser', 'Lotfy', 53000, TO_DATE('2017-10-23', 'YYYY-MM-DD'), NULL, 'yasser.lotfy@example.com', 'Professor');


INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) VALUES
(1, 1, NULL, 'Seif', 'Mohamed', 50000, TO_DATE('2020-01-10', 'YYYY-MM-DD'), NULL, 'seif.mohamed@example.com', 'Professor'),
(2, 2, NULL, 'Abdelrahman', 'Naser', 52000, TO_DATE('2019-06-15', 'YYYY-MM-DD'), NULL, 'abdelrahman.naser@example.com', 'Professor'),
(3, 3, NULL, 'Hussein', 'Hassan', 54000, TO_DATE('2018-09-20', 'YYYY-MM-DD'), NULL, 'hussein.hassan@example.com', 'Professor'),
(4, 4, NULL, 'Mohamed', 'Ahmed', 53000, TO_DATE('2017-12-10', 'YYYY-MM-DD'), NULL, 'mohamed.ahmed@example.com', 'Professor'),
(5, 5, NULL, 'Eslam', 'Abdelrahman', 51000, TO_DATE('2016-11-01', 'YYYY-MM-DD'), NULL, 'eslam.abdelrahman@example.com', 'Professor'),
(6, 6, NULL, 'Nagy', 'Ramy', 48000, TO_DATE('2015-04-12', 'YYYY-MM-DD'), NULL, 'nagy.ramy@example.com', 'Staff'),
(7, 7, NULL, 'Mostafa', 'Kamal', 55000, TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL, 'mostafa.kamal@example.com', 'Staff'),
(8, 8, NULL, 'Karim', 'Hassan', 47000, TO_DATE('2019-05-22', 'YYYY-MM-DD'), NULL, 'karim.hassan@example.com', 'Staff'),
(9, 1, 1, 'Omar', 'Mostafa', 40000, TO_DATE('2022-08-01', 'YYYY-MM-DD'), NULL, 'omar.mostafa@example.com', 'TA'),
(10, 2, 2, 'Hekal', 'Nasr', 45000, TO_DATE('2021-10-10', 'YYYY-MM-DD'), NULL, 'hekal.nasr@example.com', 'TA'),
(11, 3, 3, 'Mohamed', 'Latif', 46000, TO_DATE('2020-07-01', 'YYYY-MM-DD'), NULL, 'latif@example.com', 'TA'),
(12, 4, 4, 'Kamal', 'Seif', 47000, TO_DATE('2023-01-01', 'YYYY-MM-DD'), NULL, 'kamal.seif@example.com', 'TA'),
(13, 5, 5, 'Ali', 'Hassan', 44000, TO_DATE('2021-09-15', 'YYYY-MM-DD'), NULL, 'ali.hassan@example.com', 'TA'),
(14, 7, 7, 'Ahmed', 'Ali', 35000, TO_DATE('2020-03-15', 'YYYY-MM-DD'), NULL, 'ahmed.ali@example.com', 'Driver'),
(15, 7, 7, 'Hassan', 'Omar', 36000, TO_DATE('2019-07-12', 'YYYY-MM-DD'), NULL, 'hassan.omar@example.com', 'Driver'),
(16, 7, 7, 'Mohamed', 'Nasr', 34000, TO_DATE('2021-10-20', 'YYYY-MM-DD'), NULL, 'mohamed.nasr@example.com', 'Driver'),
(17, 7, 7, 'Khaled', 'Hussein', 34500, TO_DATE('2020-05-05', 'YYYY-MM-DD'), NULL, 'khaled.hussein@example.com', 'Driver'),
(18, 7, 7, 'Amr', 'Nagy', 35500, TO_DATE('2022-11-10', 'YYYY-MM-DD'), NULL, 'amr.nagy@example.com', 'Driver');


UPDATE Departments SET mgrID = 1 WHERE departmentID = 1;
UPDATE Departments SET mgrID = 2 WHERE departmentID = 2;
UPDATE Departments SET mgrID = 3 WHERE departmentID = 3;
UPDATE Departments SET mgrID = 4 WHERE departmentID = 4;
UPDATE Departments SET mgrID = 5 WHERE departmentID = 5;
UPDATE Departments SET mgrID = 6 WHERE departmentID = 6;
UPDATE Departments SET mgrID = 7 WHERE departmentID = 7;
UPDATE Departments SET mgrID = 8 WHERE departmentID = 8;

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES 
(1, 1, 'Ahmed Ibrahim', TO_DATE('2006-05-10', 'YYYY-MM-DD'), 'ahmed.ibrahim@example.com', 1),
(2, 1, 'Mona Ali', TO_DATE('2005-08-21', 'YYYY-MM-DD'), 'mona.ali@example.com', 2),
(3, 1, 'Samir Youssef', TO_DATE('2004-12-15', 'YYYY-MM-DD'), 'samir.youssef@example.com', 3),
(4, 1, 'Fatima Nabil', TO_DATE('2003-01-11', 'YYYY-MM-DD'), 'fatima.nabil@example.com', 4),

(5, 2, 'Rami Khaled', TO_DATE('2006-03-18', 'YYYY-MM-DD'), 'rami.khaled@example.com', 1),
(6, 2, 'Nadia Hussein', TO_DATE('2005-07-22', 'YYYY-MM-DD'), 'nadia.hussein@example.com', 2),
(7, 2, 'Omar Gad', TO_DATE('2004-11-05', 'YYYY-MM-DD'), 'omar.gad@example.com', 3),
(8, 2, 'Sara Magdy', TO_DATE('2003-06-30', 'YYYY-MM-DD'), 'sara.magdy@example.com', 4),

(9, 3, 'Tamer Fawzy', TO_DATE('2006-02-10', 'YYYY-MM-DD'), 'tamer.fawzy@example.com', 1),
(10, 3, 'Layla Sherif', TO_DATE('2005-01-01', 'YYYY-MM-DD'), 'layla.sherif@example.com', 2),
(11, 3, 'Mohamed Hisham', TO_DATE('2004-09-12', 'YYYY-MM-DD'), 'mohamed.hisham@example.com', 3),
(12, 3, 'Youssef Samir', TO_DATE('2003-04-25', 'YYYY-MM-DD'), 'youssef.samir@example.com', 4),

(13, 4, 'Dina Khalil', TO_DATE('2006-07-14', 'YYYY-MM-DD'), 'dina.khalil@example.com', 1),
(14, 4, 'Karim Hassan', TO_DATE('2005-03-22', 'YYYY-MM-DD'), 'karim.hassan@example.com', 2),
(15, 4, 'Omar Lotfy', TO_DATE('2004-05-19', 'YYYY-MM-DD'), 'omar.lotfy@example.com', 3),
(16, 4, 'Reham Saeed', TO_DATE('2003-08-08', 'YYYY-MM-DD'), 'reham.saeed@example.com', 4),

(17, 5, 'Laila Nasr', TO_DATE('2006-12-01', 'YYYY-MM-DD'), 'laila.nasr@example.com', 1),
(18, 5, 'Khaled Amr', TO_DATE('2005-06-15', 'YYYY-MM-DD'), 'khaled.amr@example.com', 2),
(19, 5, 'Nour Ahmed', TO_DATE('2004-10-30', 'YYYY-MM-DD'), 'nour.ahmed@example.com', 3),
(20, 5, 'Tarek Salah', TO_DATE('2003-02-14', 'YYYY-MM-DD'), 'tarek.salah@example.com', 4);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES 
(21, 6, 'Omar Khaled', TO_DATE('2006-07-14', 'YYYY-MM-DD'), 'omar.khaled@example.com', 1),
(22, 6, 'Sara Hassan', TO_DATE('2005-09-30', 'YYYY-MM-DD'), 'sara.hassan@example.com', 2),
(23, 6, 'Hassan Mostafa', TO_DATE('2004-11-22', 'YYYY-MM-DD'), 'hassan.mostafa@example.com', 3),
(24, 6, 'Layla Tarek', TO_DATE('2003-03-18', 'YYYY-MM-DD'), 'layla.tarek@example.com', 4);

INSERT INTO Courses (courseCode, instructorID, courseName, creditHours) VALUES
('CS101', 1, 'Introduction to Computer Science', 3),
('CS102', 19, 'Programming Fundamentals', 3),
('CS103', 20, 'Computer Organization', 3),
('CS201', 1, 'Data Structures and Algorithms', 3),
('CS202', 19, 'Operating Systems', 3),
('CS203', 20, 'Object-Oriented Programming', 3),
('CS301', 1, 'Computer Networks', 3),
('CS302', 19, 'Software Engineering', 3),
('CS303', 20, 'Theory of Computation', 3),
('CS401', 1, 'Cybersecurity', 3),
('CS402', 19, 'Cloud Computing', 3),
('CS403', 20, 'Distributed Systems', 3),

('IS101', 2, 'Introduction to Information Systems', 3),
('IS102', 21, 'Database Fundamentals', 3),
('IS103', 22, 'Business Process Management', 3),
('IS201', 2, 'Database Systems', 3),
('IS202', 21, 'Enterprise Systems', 3),
('IS203', 22, 'E-Business', 3),
('IS301', 2, 'Data Warehousing', 3),
('IS302', 21, 'Business Intelligence', 3),
('IS303', 22, 'System Analysis and Design', 3),
('IS401', 2, 'Cloud-Based IS', 3),
('IS402', 21, 'Cybersecurity in IS', 3),
('IS403', 22, 'IS Project Management', 3),

('AI101', 3, 'Introduction to AI', 3),
('AI102', 23, 'Machine Learning Fundamentals', 3),
('AI103', 24, 'Neural Networks', 3),
('AI201', 3, 'Deep Learning', 3),
('AI202', 23, 'AI Ethics', 3),
('AI203', 24, 'Computer Vision', 3),
('AI301', 3, 'Natural Language Processing', 3),
('AI302', 23, 'AI in Robotics', 3),
('AI303', 24, 'Big Data and AI', 3),
('AI401', 3, 'AI Research Methodologies', 3),
('AI402', 23, 'Autonomous Systems', 3),
('AI403', 24, 'Explainable AI', 3),

('IT101', 4, 'IT Fundamentals', 3),
('IT102', 25, 'Networking Basics', 3),
('IT103', 26, 'Cloud Computing Essentials', 3),
('IT201', 4, 'Web Technologies', 3),
('IT202', 25, 'IT Project Management', 3),
('IT203', 26, 'Network Security', 3),
('IT301', 4, 'Advanced Web Development', 3),
('IT302', 25, 'Mobile Computing', 3),
('IT303', 26, 'Internet of Things (IoT)', 3),
('IT401', 4, 'Blockchain Technology', 3),
('IT402', 25, 'IT Governance', 3),
('IT403', 26, 'Ethical Hacking', 3),

('DS101', 5, 'Introduction to Data Science', 3),
('DS102', 27, 'Data Analytics', 3),
('DS103', 28, 'Data Mining', 3),
('DS201', 5, 'Statistical Methods', 3),
('DS202', 27, 'Big Data Processing', 3),
('DS203', 28, 'Data Visualization', 3),
('DS301', 5, 'Predictive Modeling', 3),
('DS302', 27, 'Data Engineering', 3),
('DS303', 28, 'Time Series Analysis', 3),
('DS401', 5, 'Reinforcement Learning', 3),
('DS402', 27, 'Deep Learning for Data Science', 3),
('DS403', 28, 'Data Science Capstone', 3);


INSERT INTO StudentCourses (studentID, courseCode) VALUES 
-- CS
(1, 'CS101'), (1, 'CS102'), (1, 'CS103'),
(2, 'CS101'), (2, 'CS102'), (2, 'CS103'), (2, 'CS201'), (2, 'CS202'), (2, 'CS203'),
(3, 'CS101'), (3, 'CS102'), (3, 'CS103'), (3, 'CS201'), (3, 'CS202'), (3, 'CS203'), (3, 'CS301'), (3, 'CS302'), (3, 'CS303'),
(4, 'CS101'), (4, 'CS102'), (4, 'CS103'), (4, 'CS201'), (4, 'CS202'), (4, 'CS203'), (4, 'CS301'), (4, 'CS302'), (4, 'CS303'), (4, 'CS401'), (4, 'CS402'), (4, 'CS403'),

-- IS
(5, 'IS101'), (5, 'IS102'), (5, 'IS103'),
(6, 'IS101'), (6, 'IS102'), (6, 'IS103'), (6, 'IS201'), (6, 'IS202'), (6, 'IS203'),
(7, 'IS101'), (7, 'IS102'), (7, 'IS103'), (7, 'IS201'), (7, 'IS202'), (7, 'IS203'), (7, 'IS301'), (7, 'IS302'), (7, 'IS303'),
(8, 'IS101'), (8, 'IS102'), (8, 'IS103'), (8, 'IS201'), (8, 'IS202'), (8, 'IS203'), (8, 'IS301'), (8, 'IS302'), (8, 'IS303'), (8, 'IS401'), (8, 'IS402'), (8, 'IS403'),

-- AI
(9, 'AI101'), (9, 'AI102'), (9, 'AI103'),
(10, 'AI101'), (10, 'AI102'), (10, 'AI103'), (10, 'AI201'), (10, 'AI202'), (10, 'AI203'),
(11, 'AI101'), (11, 'AI102'), (11, 'AI103'), (11, 'AI201'), (11, 'AI202'), (11, 'AI203'), (11, 'AI301'), (11, 'AI302'), (11, 'AI303'),
(12, 'AI101'), (12, 'AI102'), (12, 'AI103'), (12, 'AI201'), (12, 'AI202'), (12, 'AI203'), (12, 'AI301'), (12, 'AI302'), (12, 'AI303'), (12, 'AI401'), (12, 'AI402'), (12, 'AI403'),

-- IT
(13, 'IT101'), (13, 'IT102'), (13, 'IT103'),
(14, 'IT101'), (14, 'IT102'), (14, 'IT103'), (14, 'IT201'), (14, 'IT202'), (14, 'IT203'),
(15, 'IT101'), (15, 'IT102'), (15, 'IT103'), (15, 'IT201'), (15, 'IT202'), (15, 'IT203'), (15, 'IT301'), (15, 'IT302'), (15, 'IT303'),
(16, 'IT101'), (16, 'IT102'), (16, 'IT103'), (16, 'IT201'), (16, 'IT202'), (16, 'IT203'), (16, 'IT301'), (16, 'IT302'), (16, 'IT303'), (16, 'IT401'), (16, 'IT402'), (16, 'IT403');

INSERT INTO StudentCourses (studentID, courseCode) VALUES
(21, 'DS101'),
(21, 'DS102'),
(21, 'DS103'),

(22, 'DS101'),
(22, 'DS102'),
(22, 'DS103'),
(22, 'DS201'),
(22, 'DS202'),
(22, 'DS203'),

(23, 'DS101'),
(23, 'DS102'),
(23, 'DS103'),
(23, 'DS201'),
(23, 'DS202'),
(23, 'DS203'),
(23, 'DS301'),
(23, 'DS302'),
(23, 'DS303'),

(24, 'DS101'),
(24, 'DS102'),
(24, 'DS103'),
(24, 'DS201'),
(24, 'DS202'),
(24, 'DS203'),
(24, 'DS301'),
(24, 'DS302'),
(24, 'DS303'),
(24, 'DS401'),
(24, 'DS402'),
(24, 'DS403');

-- Building 1
INSERT INTO Classrooms (classroomID, floorNo, buildingNo) VALUES 
    -- Floor 1
    (1, 1, 1), (2, 1, 1), (3, 1, 1), 
    -- Floor 2
    (4, 2, 1), (5, 2, 1), (6, 2, 1), 
    -- Floor 3
    (7, 3, 1), (8, 3, 1), (9, 3, 1);

-- Building 2
INSERT INTO Classrooms (classroomID, floorNo, buildingNo) VALUES 
    -- Floor 1
    (10, 1, 2), (11, 1, 2), (12, 1, 2), 
    -- Floor 2
    (13, 2, 2), (14, 2, 2), (15, 2, 2), 
    -- Floor 3
    (16, 3, 2), (17, 3, 2), (18, 3, 2);
INSERT INTO CourseClassroom (courseCode, classroomID, datee) VALUES 
    -- CS Courses
    ('CS102', 1, TO_DATE('03-03-2025 10:00', 'DD-MM-YYYY HH24:MI')),
    ('CS102', 2, TO_DATE('03-03-2025 12:00', 'DD-MM-YYYY HH24:MI')),

    ('CS103', 3, TO_DATE('04-03-2025 14:00', 'DD-MM-YYYY HH24:MI')),
    ('CS103', 4, TO_DATE('04-03-2025 16:00', 'DD-MM-YYYY HH24:MI')),

    ('CS202', 5, TO_DATE('05-03-2025 09:00', 'DD-MM-YYYY HH24:MI')),
    ('CS202', 6, TO_DATE('05-03-2025 11:00', 'DD-MM-YYYY HH24:MI')),

    ('CS203', 7, TO_DATE('06-03-2025 13:00', 'DD-MM-YYYY HH24:MI')),
    ('CS203', 8, TO_DATE('06-03-2025 15:00', 'DD-MM-YYYY HH24:MI')),

    -- IS Courses
    ('IS201', 9, TO_DATE('07-03-2025 10:00', 'DD-MM-YYYY HH24:MI')),
    ('IS201', 10, TO_DATE('07-03-2025 12:00', 'DD-MM-YYYY HH24:MI')),

    ('IS202', 11, TO_DATE('08-03-2025 14:00', 'DD-MM-YYYY HH24:MI')),
    ('IS202', 12, TO_DATE('08-03-2025 16:00', 'DD-MM-YYYY HH24:MI')),

    ('IS203', 13, TO_DATE('09-03-2025 09:00', 'DD-MM-YYYY HH24:MI')),
    ('IS203', 14, TO_DATE('09-03-2025 11:00', 'DD-MM-YYYY HH24:MI')),

    -- AI Courses
    ('AI201', 15, TO_DATE('10-03-2025 13:00', 'DD-MM-YYYY HH24:MI')),
    ('AI201', 16, TO_DATE('10-03-2025 15:00', 'DD-MM-YYYY HH24:MI')),

    ('AI202', 1, TO_DATE('11-03-2025 10:00', 'DD-MM-YYYY HH24:MI')),
    ('AI202', 2, TO_DATE('11-03-2025 12:00', 'DD-MM-YYYY HH24:MI')),

    ('AI203', 3, TO_DATE('12-03-2025 14:00', 'DD-MM-YYYY HH24:MI')),
    ('AI203', 4, TO_DATE('12-03-2025 16:00', 'DD-MM-YYYY HH24:MI')),

    -- IT Courses
    ('IT102', 5, TO_DATE('13-03-2025 09:00', 'DD-MM-YYYY HH24:MI')),
    ('IT102', 6, TO_DATE('13-03-2025 11:00', 'DD-MM-YYYY HH24:MI')),

    ('IT103', 7, TO_DATE('14-03-2025 13:00', 'DD-MM-YYYY HH24:MI')),
    ('IT103', 8, TO_DATE('14-03-2025 15:00', 'DD-MM-YYYY HH24:MI')),

    -- DS Courses
    ('DS102', 9, TO_DATE('15-03-2025 10:00', 'DD-MM-YYYY HH24:MI')),
    ('DS102', 10, TO_DATE('15-03-2025 12:00', 'DD-MM-YYYY HH24:MI')),

    ('DS103', 11, TO_DATE('16-03-2025 14:00', 'DD-MM-YYYY HH24:MI')),
    ('DS103', 12, TO_DATE('16-03-2025 16:00', 'DD-MM-YYYY HH24:MI')),

    ('DS202', 13, TO_DATE('17-03-2025 09:00', 'DD-MM-YYYY HH24:MI')),
    ('DS202', 14, TO_DATE('17-03-2025 11:00', 'DD-MM-YYYY HH24:MI')),

    ('DS203', 15, TO_DATE('18-03-2025 13:00', 'DD-MM-YYYY HH24:MI')),
    ('DS203', 16, TO_DATE('18-03-2025 15:00', 'DD-MM-YYYY HH24:MI'));


INSERT INTO Assessments (assessmentID, year, semester, type, maxScore) 
VALUES (1, 2024, 'First', 'Midterm', 100);

INSERT INTO Assessments (assessmentID, year, semester, type, maxScore) 
VALUES (2, 2024, 'Second', 'Final', 100);

INSERT INTO CourseAssessments (courseCode, assessmentID, studentID, year, semester, grade) 
VALUES ('CS101', 1, 1, 2024, 'First', 90);

INSERT INTO CourseAssessments (courseCode, assessmentID, studentID, year, semester, grade) 
VALUES ('IS102', 2, 2, 2024, 'Second', 85);

INSERT INTO CourseAssessments (courseCode, assessmentID, studentID, year, semester, grade) 
VALUES ('AI103', 1, 3, 2024, 'First', 88);

INSERT INTO CourseAssessments (courseCode, assessmentID, studentID, year, semester, grade) 
VALUES ('CS201', 2, 4, 2024, 'Second', 92);


INSERT INTO Events (eventID, instructorID, site, datee) 
VALUES (1, 1, 'Online', TO_DATE('10-02-2024', 'DD-MM-YYYY'));

INSERT INTO Events (eventID, instructorID, site, datee) 
VALUES (2, 2, 'Campus', TO_DATE('01-03-2024', 'DD-MM-YYYY'));



INSERT INTO StudentEvents (studentID, eventID) 
VALUES (1, 1);

INSERT INTO StudentEvents (studentID, eventID) 
VALUES (2, 2);



INSERT INTO Transportation (vehicleID, driverID, route) 
VALUES (1, 16, 'Haram');

INSERT INTO Transportation (vehicleID, driverID, route) 
VALUES (2, 17, 'October');

INSERT INTO EmployeeTransportation (employeeID, vehicleID) 
VALUES (16, 1);

INSERT INTO EmployeeTransportation (employeeID, vehicleID) 
VALUES (17, 2);

INSERT INTO StudentTransportation (studentID, vehicleID) 
VALUES (1, 1);

INSERT INTO StudentTransportation (studentID, vehicleID) 
VALUES (2, 2);


delete courseassessments;


insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('CS101', 1, 1, 2024, 'first', 15);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('CS101', 2, 1, 2024, 'first', 60);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('CS101', 3, 1, 2024, 'first', 15);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('IS102', 5, 2, 2024, 'second', 20);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('IS102', 6, 2, 2024, 'second', 60);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('IS102', 8, 2, 2024, 'second', 20);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('AI103', 1, 3, 2024, 'first', 10);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('AI103', 2, 3, 2024, 'first', 50);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('AI103', 3, 3, 2024, 'first', 20);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('CS201', 5, 4, 2024, 'second', 20);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('CS201', 6, 4, 2024, 'second', 60);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('CS201', 7, 4, 2024, 'second', 20);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('IS202', 5, 5, 2024, 'second', 15);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('IS202', 6, 5, 2024, 'second', 60);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('IS202', 7, 5, 2024, 'second', 10);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('AI204', 1, 6, 2024, 'first', 10);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('AI204', 2, 6, 2024, 'first', 55);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('AI204', 3, 6, 2024, 'first', 20);

insert into courseassessments (coursecode, assessmentid, studentid, year, semester, grade) 
values ('AI204', 4, 6, 2024, 'first', 10);






create table grades
(
    grade char(2) primary key,
    num number(3)   
);

insert into grades (grade, num) values ('A', 90);
insert into grades (grade, num) values ('B', 80);
insert into grades (grade, num) values ('C', 70);
insert into grades (grade, num) values ('D', 50);
insert into grades (grade, num) values ('F', 0);
