set serveroutput on;
create or replace function return_employees(p_name varchar)
return int
is
counter int;
e_pid int;
begin
select pid into e_pid
from proj
where pname = p_name;
return e_pid;
-- need to write another store 
select 
exception
when no_data_found then
dbms_output.put_line('no such pname');
return ('no such project name');
end;
/

declare
counter number;
begin
counter := return_employees('umbc library');
if counter > 0 then 
dbms_output.put_line(counter);
else
dbms_output.put_line('no data found');
end if;
end;
/
-- takes ename, did, and salary and inserts a row into emp with given values, hiredate as current data, 
create or replace procedure new_emp(e_name varchar, dept_id int, sal number)
is
begin
insert into emp values(eid_seq.nextval, e_name, dept_id, sysdate, sal);
dbms_output.put_line(' New employee id is: ' || eid_seq.currval);
end;
/
exec new_emp('Jason', 3, 600000);
/

create or replace procedure get_numofemp(p_name varchar)
is
counter int;
begin 
counter := get_
if counter  = -1 then
dbms_output.put_line('wrong input');
else
dbms_output.put_line(counter || 'people work on the project');
then
if counter < 3 then
dbms_output.put_line('this project has fewer than 3 people');




