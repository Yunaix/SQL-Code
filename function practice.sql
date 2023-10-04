-- Functions
create or replace function return_salary(e_id int)
return number
is
sal number;
begin
select salary into sal from emp where eid = e_id;
return sal;
exception 
when no_data_found then
dbms_output.put_line('no such employee');
return -1;
end;
/
declare
sal number;
begin
sal := return_salary(2);
--if sal > 0 then
--dbms_output.put_line('no data found');
--end if;
dbms_output.put_line(sal);
end;
/
-- Calling function in procedure
create or replace procedure raise_salary(e_id int, amount in number)
is
sal number;
begin
sal := return_salary(e_id);
if sal > 0 then
dbms_output.put_line('current sal: ' || sal);
update emp 
set salary = salary + amount where eid = e_id;
dbms_output.put_line('new sal: ' || amount);
else
dbms_output.put_line('np such employee found');
end if;
end;
/
exec raise_salary(1, 2000);
/

create or replace function get_salary_byname(e_name varchar)
return varchar
is
sal number;
begin
select salary into sal 
from emp
where ename = e_name;
return sal;
exception
when no_data_found then
dbms_output.put_line('no such employee');
return -1;
end;
/
declare
sal number;
begin
sal := get_salary_byname('jeff');
dbms_output.put_line(sal);
end;
