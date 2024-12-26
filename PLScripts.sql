create or replace package TheUpdate
as 
procedure UpdateStudent(studid number , deptid number , em varchar , acyear number);
procedure UpdateStudent(studid number , deptid number , em varchar);
procedure UpdateStudent(studid number , deptid number , acyear number);
procedure UpdateStudent(studid number ,  em varchar , acyear number);
procedure UpdateStudent(studid number , deptid number);
procedure UpdateStudent(studid number , em varchar );
procedure UpdateStudent(studid number ,  acyear number);
end;

create or replace package body TheUpdate
is
procedure UpdateStudent(studid number , deptid number , em varchar , acyear number)
is
begin
    update students 
    set departmentid = deptid , email = em , academicyear=acyear
    where studentid=studid;
    commit;
end;


procedure UpdateStudent(studid number , deptid number , em varchar)
is
begin
    update students 
    set departmentid = deptid , email = em
    where studentid=studid;
    commit;
end;


procedure UpdateStudent(studid number , deptid number , acyear number)
is
begin
    update students 
    set departmentid = deptid , academicyear=acyear
    where studentid=studid;
    commit;
end;


procedure UpdateStudent(studid number ,  em varchar , acyear number)
is
begin
    update students 
    set  email = em , academicyear=acyear
    where studentid=studid;
    commit;
end;


procedure UpdateStudent(studid number , deptid number)
is
begin
    update students 
    set departmentid = deptid
    where studentid=studid;
    commit;
end;


procedure UpdateStudent(studid number , em varchar )
is
begin
    update students 
    set email = em
    where studentid=studid;
    commit;
end;

procedure UpdateStudent(studid number ,  acyear number)
is
begin
    update students 
    set  academicyear=acyear
    where studentid=studid;
    commit;
end;


end;



BEGIN
   TheUpdate.UpdateStudent(1, 2, 'updated1@example.com', 4);
END;

SELECT * FROM students WHERE studentid = 1;



BEGIN
   TheUpdate.UpdateStudent(3, 3, 2025);
END;

SELECT * FROM students WHERE studentid = 3;


BEGIN
   TheUpdate.UpdateStudent(studid => 3, acyear => 5);
end;



create or replace trigger insertCheck 
before insert on students
for each row
begin
    if :new.academicyear > 5 then
        raise_application_error(-20001,'cant insert academic year more than 5');

    end if;
end;

create or replace trigger insertCheck 
before update on students
for each row
begin
    if :new.academicyear > 5 then
        raise_application_error(-20001,'cant insert academic year more than 5');

    end if;
end;


create or replace trigger ScoreCheck
before insert on courseAssessments
for each row
declare 
    assesID number;
    mxscore number;
begin
    select maxScore into mxscore from assessments where assessmentID = :new.assessmentID;
    if :new.grade > mxscore then
        raise_application_error(-20002,'cant insert grade greater than the max score for this assessment');
    end if;
end;

INSERT INTO CourseAssessments (courseCode, assessmentID, studentID, year, semester, grade) 
VALUES ('CS101', 1, 1, 2024, 'First', 110);


create or replace trigger ScoreCheckUpdate
before update on courseAssessments
for each row
declare 
    assesID number;
    mxscore number;
begin
    select maxScore into mxscore from assessments where assessmentID = :new.assessmentID;
    if :new.grade > mxscore then
        raise_application_error(-20002,'cant update grade greater than the max score for this assessment');
    end if;
end;



create or replace package CalcGPA
as 
procedure getGPA(studid number);
end;

create or replace package body CalcGPA
is
    procedure getGPA(studid number)
    is
        
    end;
end;
select * from assessments 


