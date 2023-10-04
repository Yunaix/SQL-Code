-- Named PL/SQL Procedure 
-- Need to compile before executing
create or replace procedure PrintMessage(m varchar)
as
begin
dbms_output.put_line(m);
end;
/

set serveroutput on;
exec PrintMessage('this is my first pl/sql procedure');
/
-- Ouput Example
Create or replace PROCEDURE raise_salary (emp_id in INTEGER,amount in REAL, current_sal out real) 
IS
BEGIN
UPDATE emp 
SET salary = salary + amount 
WHERE eid =emp_id;
Select salary into current_sal 
from emp 
where eid = emp_id;
exception when no_data_found then 
dbms_output.put_line('no such employee');
end;
/ 
-- need to declare variable for output parameters
declare
c_sal number;
begin
-- don't need exec call, just write the function
raise_salary (1, 5000, c_sal);
-- print the mentioned variable
dbms_output.put_line(c_sal); 
end;
/

-- Parameter name should not be the same as the column name
Create or replace PROCEDURE get_salary (emp_name in varchar) 
IS
Cursor c1 is select salary 
from emp 
where ename = emp_name;
E_sal number;
BEGIN
Open c1;
Loop
fetch c1 into e_sal;
exit when c1%notfound;
dbms_output.put_line(e_sal);
End loop;
END;
/
Exec get_salary('jeff');
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

exec print_pname('josh');