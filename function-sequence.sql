-- Create a procedure get_salary with an input parameter e_id, and 
-- print the salary of the employee with that id
set serveroutput on;
create or replace procedure get_salary(e_id int, sal out real)
is
begin
select salary into sal
from emp
where eid = e_id;
exception
when no_data_found then
dbms_output.put_line('no such salary');
end;
/
Declare
sal real;
Begin
get_salary(1,sal);
Dbms_output.put_line(sal);
End;
/

--- Function: returns only a single value
-- return salary by ID
create or replace function return_salary(emp_id in number)
return number -- must match the return output
is
e_sal number;
begin
select salary into e_sal 
from emp 
where eid = emp_id;
return e_sal;
exception
when no_data_found then
dbms_output.put_line('no such employee');
return -1; -- must match output (for varchar: use null or special string)
end;
/
declare
E_sal number;
Begin
e_sal := return_salary(2);
if e_sal > 0 then 
dbms_output.put_line(e_sal);
else dbms_output.put_line('no data found');
end if;
End;
/
-- return salary by name
create or replace function get_salary_byname(e_name varchar)
return number
is
e_sal number;
begin
select salary into e_sal 
from emp 
where ename = e_name;
return e_sal;
exception
when no_data_found then
dbms_output.put_line('no such employee');
return -1;
end;
/
declare
E_sal number;
Begin
e_sal := get_salary_byname('jeff');
if e_sal > 0 then 
dbms_output.put_line(e_sal);
else 
dbms_output.put_line('no data found');
end if;
End;
/ 
-- Sequences
-- 1st 2 steps done in sql
create sequence eid_seq
START WITH 5; -- check how many rows already exist and then start at row not yet created
insert into emp values(eid_seq.nextval, 'Ellie', 2, sysdate, 7000);

