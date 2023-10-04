set serveroutput on;
create or replace procedure get_proj (e_name emp.ename%type)
IS
cursor c1 is 
select pname
from proj p, emp e, emp_proj ep
where p.pid = ep.pid and e.eid = ep.eid and ename = e_name;
counter integer;
begin
select count(*) into counter
from emp
where ename = e_name;
if counter = 0 then
dbms_output.put_line('No such employee');
else 
for e in c1
loop
dbms_output.put_line(e.pname);
end loop;
end if;
end;
/

exec get_proj('jeff');
/
set SERVEROUTPUT on;
create or replace procedure proj_number (e_name emp.ename%type,num_of_proj out int)
IS
counter int;
begin
select count(*) into counter
from emp 
where ename = e_name;
if counter = 0 then
dbms_output.put_line('No such employee');
else
select count(*) into num_of_proj
from emp e, emp_proj ep
where e.ename = e_name and e.eid = ep.eid;
end if;
end;
/
declare
num_of_proj int;
begin
proj_number('jeff', num_of_proj);
if num_of_proj > 0 then
dbms_output.put_line('jeff works on ' || num_of_proj || ' projects');
end if;
end;

