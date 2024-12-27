-- Creating the Departments table
CREATE TABLE Departments (
    departmentID NUMBER PRIMARY KEY,
    mgrID NUMBER,
    departmentName VARCHAR2(100)
);

-- Creating the Employees table
CREATE TABLE Employees (
    employeeID NUMBER PRIMARY KEY,
    departmentID NUMBER,
    supervisorID NUMBER,
    name VARCHAR2(100),
    salary NUMBER,
    hire_date DATE,
    end_date DATE,
    email VARCHAR2(100),
    type VARCHAR2(50),
    CONSTRAINT fk_employee_department FOREIGN KEY (departmentID) REFERENCES Departments(departmentID),
    CONSTRAINT fk_employee_supervisor FOREIGN KEY (supervisorID) REFERENCES Employees(employeeID)
);

-- Creating the Students table
CREATE TABLE Students (
    studentID NUMBER PRIMARY KEY,
    departmentID NUMBER,
    name VARCHAR2(100),
    DOB DATE,
    email VARCHAR2(100),
    academicYear NUMBER,
    CONSTRAINT fk_student_department FOREIGN KEY (departmentID) REFERENCES Departments(departmentID)
);

-- Creating the Courses table
CREATE TABLE Courses (
    courseCode VARCHAR2(10) PRIMARY KEY,
    instructorID NUMBER,
    courseName VARCHAR2(100),
    creditHours NUMBER,
    CONSTRAINT fk_course_instructor FOREIGN KEY (instructorID) REFERENCES Employees(employeeID)
);

-- Creating the StudentCourses table
CREATE TABLE StudentCourses (
    studentID NUMBER,
    courseCode VARCHAR2(10),
    PRIMARY KEY (studentID, courseCode),
    CONSTRAINT fk_student_course_student FOREIGN KEY (studentID) REFERENCES Students(studentID),
    CONSTRAINT fk_student_course_course FOREIGN KEY (courseCode) REFERENCES Courses(courseCode)
);

-- Creating the Classrooms table
CREATE TABLE Classrooms (
    classroomID NUMBER PRIMARY KEY,
    floorNo NUMBER,
    buildingNo NUMBER
);

-- Creating the CourseClassroom table
CREATE TABLE CourseClassroom (
    courseCode VARCHAR2(10),
    classroomID NUMBER,
    date DATE,
    time VARCHAR2(10),
    PRIMARY KEY (courseCode, classroomID, date, time),
    CONSTRAINT fk_courseclassroom_course FOREIGN KEY (courseCode) REFERENCES Courses(courseCode),
    CONSTRAINT fk_courseclassroom_classroom FOREIGN KEY (classroomID) REFERENCES Classrooms(classroomID)
);

-- Creating the Assessments table
CREATE TABLE Assessments (
    assessmentID NUMBER,
    year NUMBER,
    semester VARCHAR2(10),
    type VARCHAR2(50),
    maxScore NUMBER,
    PRIMARY KEY (assessmentID, year, semester)
);

-- Creating the CourseAssessments table
CREATE TABLE CourseAssessments (
    courseCode VARCHAR2(10),
    assessmentID NUMBER,
    studentID NUMBER,
    grade NUMBER,
    PRIMARY KEY (courseCode, assessmentID, studentID),
    CONSTRAINT fk_courseassessment_course FOREIGN KEY (courseCode) REFERENCES Courses(courseCode),
    CONSTRAINT fk_courseassessment_assessment FOREIGN KEY (assessmentID) REFERENCES Assessments(assessmentID),
    CONSTRAINT fk_courseassessment_student FOREIGN KEY (studentID) REFERENCES Students(studentID)
);

-- Creating the Events table
CREATE TABLE Events (
    eventID NUMBER PRIMARY KEY,
    instructorID NUMBER,
    site VARCHAR2(100),
    date DATE,
    CONSTRAINT fk_event_instructor FOREIGN KEY (instructorID) REFERENCES Employees(employeeID)
);

-- Creating the StudentEvents table
CREATE TABLE StudentEvents (
    studentID NUMBER,
    eventID NUMBER,
    PRIMARY KEY (studentID, eventID),
    CONSTRAINT fk_studentevent_student FOREIGN KEY (studentID) REFERENCES Students(studentID),
    CONSTRAINT fk_studentevent_event FOREIGN KEY (eventID) REFERENCES Events(eventID)
);

-- Creating the Transportation table
CREATE TABLE Transportation (
    vehicleID NUMBER PRIMARY KEY,
    driverID NUMBER,
    route VARCHAR2(100)
);

-- Creating the EmployeeTransportation table
CREATE TABLE EmployeeTransportation (
    employeeID NUMBER,
    vehicleID NUMBER,
    PRIMARY KEY (employeeID, vehicleID),
    CONSTRAINT fk_employeetransport_employee FOREIGN KEY (employeeID) REFERENCES Employees(employeeID),
    CONSTRAINT fk_employeetransport_vehicle FOREIGN KEY (vehicleID) REFERENCES Transportation(vehicleID)
);

-- Creating the StudentTransportation table
CREATE TABLE StudentTransportation (
    studentID NUMBER,
    vehicleID NUMBER,
    PRIMARY KEY (studentID, vehicleID),
    CONSTRAINT fk_studenttransport_student FOREIGN KEY (studentID) REFERENCES Students(studentID),
    CONSTRAINT fk_studenttransport_vehicle FOREIGN KEY (vehicleID) REFERENCES Transportation(vehicleID)
);

-- Creating indexes for optimization
CREATE INDEX idx_student_department ON Students(departmentID);
CREATE INDEX idx_employee_department ON Employees(departmentID);
CREATE INDEX idx_course_instructor ON Courses(instructorID);




select * from emp;
select e1.ename , d.dname , e1.sal , 
(select count(1)+1 from emp e2 where e2.sal > e1.sal and e1.DEPTNO = e2.DEPTNO ) as ra
from emp e1 , dept d where e1.deptno=d.DEPTNO
order by d.dname ,ra;


select deptno , ename , sal , job , count(job) over(PARTITION by job ) from emp;





