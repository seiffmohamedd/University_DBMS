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


























