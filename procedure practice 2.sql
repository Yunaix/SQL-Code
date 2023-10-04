-- Named PL/SQL
-- With Parameter
create or replace procedure printmessage (m varchar)
is
begin
dbms_output.put_line(m);
end;
/
exec printmessage('this is my first pl/sql');
/ 
-- No Parameter
create or replace procedure raise_salary 
is
begin
update emp
set salary = 2000
where emp.eid = 5;
end;
/
exec raise_salary();
select * from emp;
/
-- With Parameter and Cursor
set serveroutput on;
create or replace procedure get_salary(e_id int)
is
cursor c1 is
select salary from emp where eid = e_id;
sal number;
begin
open c1;
loop
fetch c1 into sal;
exit when c1%notfound;
dbms_output.put_line(sal);
end loop;
end;
/
exec get_salary(1);
/
-- With output parameter
create or replace procedure get_salary2(e_id int, sal out number)
is
cursor c1 is
select salary from emp where eid = e_id;
begin
open c1;
loop
fetch c1 into sal;
exit when c1%notfound;
end loop;
end;
/ 
declare 
sal number;
begin
get_salary2(1, sal);
dbms_output.put_line(sal);
end;
/

create or replace procedure print_pname(v_ename emp.ename%type)is
cursor c1 is select pname
from emp e, emp_proj ep, proj p
where e.eid = ep.eid and ep.pid = p.pid and ename = v_ename;
v_count int;
begin
select count(*) into v_count from emp where ename=v_ename;
if v_count = 0 then
dbms_output.put_line('No such employee');
else
for item in c1 loop
dbms_output.put_line(item.pname);
end loop;
end if;
end;
/
exec print_pname('jeff');
/

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

