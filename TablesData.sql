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

INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (1, NULL, 'Computer Science');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (2, NULL, 'Information Systems');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (3, NULL, 'AI');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (4, NULL, 'HR');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (5, NULL, 'IT');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (6, NULL, 'DS');
INSERT INTO Departments (departmentID, mgrID, departmentName) VALUES (7, NULL, 'Drivers');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (1, 2, NULL, 'Seif', 'Mohamed', 50000, TO_DATE('2020-01-10', 'YYYY-MM-DD'), NULL, 'seif500mohamed@example.com', 'Professor');
UPDATE Departments SET mgrID = 1 WHERE departmentID = 1;

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (2, 2, 1, 'Abdelrahman', 'Naser', 40000, TO_DATE('15-03-2021', 'DD-MM-YYYY'), NULL, 'Abdelrahman@gmail.com', 'Professor');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (3, 3, 1, 'Mohamed', 'Latif', 45000, TO_DATE('01-07-2019', 'DD-MM-YYYY'), NULL, 'Latif@gmail.com', 'TA');


INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (4, 1, 1, 'Mohamed', 'Ahmed', 48000, TO_DATE('20-02-2022', 'DD-MM-YYYY'), NULL, 'mohamed.ahmed@gmail.com', 'Professor');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (5, 2, 1, 'Hekal', 'Nasr', 45000, TO_DATE('10-10-2021', 'DD-MM-YYYY'), NULL, 'hekal.nasr@gmail.com', 'TA');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (6, 3, 2, 'Hussein', 'Hassan', 52000, TO_DATE('05-05-2020', 'DD-MM-YYYY'), NULL, 'hussein.hassan@gmail.com', 'Professor');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (7, 1, 3, 'Kamal', 'Seif', 47000, TO_DATE('01-01-2023', 'DD-MM-YYYY'), NULL, 'kamal.seif@gmail.com', 'TA');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (8, 2, 6, 'Khalil', 'Otifi', 42000, TO_DATE('15-07-2021', 'DD-MM-YYYY'), NULL, 'khalil.otifi@gmail.com', 'Staff');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (9, 3, 1, 'Eslam', 'Abdelrahman', 51000, TO_DATE('01-11-2018', 'DD-MM-YYYY'), NULL, 'eslam.abdelrahman@gmail.com', 'Professor');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (10, 1, 4, 'Omar', 'Mostafa', 40000, TO_DATE('01-08-2022', 'DD-MM-YYYY'), NULL, 'omar.mostafa@gmail.com', 'TA');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (11, 2, 5, 'Nagy', 'Ramy', 48000, TO_DATE('12-04-2020', 'DD-MM-YYYY'), NULL, 'nagy.ramy@gmail.com', 'Staff');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (15,7, NULL, 'Mostafa', 'Kamal', 55000, TO_DATE('01-01-2018', 'DD-MM-YYYY'), NULL, 'mostafa.kamal@gmail.com', 'Staff');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (16, 7, 15, 'Ahmed', 'Ali', 35000, TO_DATE('15-03-2020', 'DD-MM-YYYY'), NULL, 'ahmed.ali@gmail.com', 'Driver');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (17, 7, 15, 'Hassan', 'Omar', 36000, TO_DATE('12-07-2019', 'DD-MM-YYYY'), NULL, 'hassan.omar@gmail.com', 'Driver');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (18, 7, 15, 'Mohamed', 'Nasr', 34000, TO_DATE('20-10-2021', 'DD-MM-YYYY'), NULL, 'mohamed.nasr@gmail.com', 'Driver');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (19, 7, 15, 'Khaled', 'Hussein', 34500, TO_DATE('05-05-2020', 'DD-MM-YYYY'), NULL, 'khaled.hussein@gmail.com', 'Driver');

INSERT INTO Employees (employeeID, departmentID, supervisorID, fName, lName, salary, hire_date, end_date, email, type) 
VALUES (20, 7, 15, 'Amr', 'Nagy', 35500, TO_DATE('10-11-2022', 'DD-MM-YYYY'), NULL, 'amr.nagy@gmail.com', 'Driver');

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (1, 1, 'Ahmed Ibrahim', TO_DATE('2000-05-10', 'YYYY-MM-DD'), 'ahmed.ibrahim@example.com', 1);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (2, 2, 'Mona Ali', TO_DATE('2001-08-21', 'YYYY-MM-DD'), 'mona.ali@example.com', 2);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (3, 3, 'Samir Youssef', TO_DATE('1999-12-15', 'YYYY-MM-DD'), 'samir.youssef@example.com', 3);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (4, 5, 'Fatima Nabil', TO_DATE('2000-01-11', 'YYYY-MM-DD'), 'fatima.nabil@example.com', 1);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (5, 6, 'Rami Khaled', TO_DATE('2001-03-18', 'YYYY-MM-DD'), 'rami.khaled@example.com', 2);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (6, 1, 'Nadia Hussein', TO_DATE('2000-07-22', 'YYYY-MM-DD'), 'nadia.hussein@example.com', 2);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (7, 2, 'Omar Gad', TO_DATE('2001-11-05', 'YYYY-MM-DD'), 'omar.gad@example.com', 1);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (8, 3, 'Sara Magdy', TO_DATE('1999-06-30', 'YYYY-MM-DD'), 'sara.magdy@example.com', 3);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (9, 5, 'Tamer Fawzy', TO_DATE('2000-02-10', 'YYYY-MM-DD'), 'tamer.fawzy@example.com', 2);

INSERT INTO Students (studentID, departmentID, name, DOB, email, academicYear) 
VALUES (10, 6, 'Layla Sherif', TO_DATE('2001-01-01', 'YYYY-MM-DD'), 'layla.sherif@example.com', 1);











INSERT INTO Courses (courseCode, instructorID, courseName, creditHours) 
VALUES ('CS101', 1, 'Introduction to Computer Science', 3);

INSERT INTO Courses (courseCode, instructorID, courseName, creditHours) 
VALUES ('IS102', 2, 'Information Systems Fundamentals', 3);

INSERT INTO Courses (courseCode, instructorID, courseName, creditHours) 
VALUES ('AI103', 3, 'Introduction to Artificial Intelligence', 3);

INSERT INTO Courses (courseCode, instructorID, courseName, creditHours) 
VALUES ('CS201', 4, 'Data Structures and Algorithms',3);

INSERT INTO Courses (courseCode, instructorID, courseName, creditHours) 
VALUES ('IS202', 5, 'Database Systems', 3);

INSERT INTO Courses (courseCode, instructorID, courseName, creditHours) 
VALUES ('AI204', 6, 'Machine Learning', 3);



INSERT INTO StudentCourses (studentID, courseCode) VALUES (1, 'CS101');
INSERT INTO StudentCourses (studentID, courseCode) VALUES (2, 'IS102');
INSERT INTO StudentCourses (studentID, courseCode) VALUES (3, 'AI103');
INSERT INTO StudentCourses (studentID, courseCode) VALUES (4, 'CS201');
INSERT INTO StudentCourses (studentID, courseCode) VALUES (5, 'IS202');
INSERT INTO StudentCourses (studentID, courseCode) VALUES (6, 'AI204');
INSERT INTO StudentCourses (studentID, courseCode) VALUES (7, 'CS101');
INSERT INTO StudentCourses (studentID, courseCode) VALUES (8, 'IS102');
INSERT INTO StudentCourses (studentID, courseCode) VALUES (9, 'AI103');
INSERT INTO StudentCourses (studentID, courseCode) VALUES (10, 'CS201');



INSERT INTO Classrooms (classroomID, floorNo, buildingNo) 
VALUES (1, 1, 101);

INSERT INTO Classrooms (classroomID, floorNo, buildingNo) 
VALUES (2, 1, 102);

INSERT INTO Classrooms (classroomID, floorNo, buildingNo) 
VALUES (3, 2, 103);

INSERT INTO Classrooms (classroomID, floorNo, buildingNo) 
VALUES (4, 2, 104);

INSERT INTO CourseClassroom (courseCode, classroomID, datee) 
VALUES ('CS101', 1, TO_DATE('10-01-2024 10:00', 'DD-MM-YYYY HH24:MI'));

INSERT INTO CourseClassroom (courseCode, classroomID, datee) 
VALUES ('IS102', 2, TO_DATE('12-01-2024 12:00', 'DD-MM-YYYY HH24:MI'));

INSERT INTO CourseClassroom (courseCode, classroomID, datee) 
VALUES ('AI103', 3, TO_DATE('15-01-2024 15:00', 'DD-MM-YYYY HH24:MI'));

INSERT INTO CourseClassroom (courseCode, classroomID, datee) 
VALUES ('CS201', 4, TO_DATE('20-01-2024 20:00', 'DD-MM-YYYY HH24:MI'));


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




















