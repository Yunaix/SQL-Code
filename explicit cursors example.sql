set serveroutput on;
-- Explicit Cursor Template
Declare
Cursor c1 is 
Select ename, dname 
From emp, dept 
where dept.did = emp.did and dname = 'IT'; 
e_name emp.ename%type; 
e_dept dept.dname%type; 
begin
open c1; -- open cursor
loop
fetch c1 into e_name, e_dept; -- fetch
exit when c1%NOTFOUND; -- exit
dbms_output.put_line('name = ' || e_name || ', dept = ' || e_dept); -- print
END LOOP;
Close c1; -- close cursor
END;
/

-- Rowtype explicit cursor template
Declare
Cursor c1 is 
Select ename, dname 
From emp, dept 
where dept.did = emp.did; -- cursor definition
r c1%rowtype; -- variable has the same type as a row returned by the cursor
begin
open c1; -- open cursor
loop
fetch c1 into r; -- fetch
exit when c1%NOTFOUND; --- exit check
dbms_output.put_line('name = ' || r.ename || ', dept = ' || r.dname);
END LOOP;
Close c1; -- close cursor
END;
/

-- For Loop explicit cursor template
Declare
Cursor c1 is 
Select ename, dname 
From emp, dept 
where emp.did= dept.did;
begin
for item in c1
loop
dbms_output.put_line('name = ' || item.ename ||', dept = ' ||item.dname);
END LOOP;
END;

/

-- Empty Results: Exception Formats
Declare
cursor c1 is 
select ename 
from emp, dept 
where emp.did = dept.did and dname = 'service';
V_ename emp.ename%type;
Begin
open c1;
loop
fetch c1 into v_ename;
exit when c1%notfound;
dbms_output.put_line(v_ename);
end loop;if c1%rowcount = 0 then dbms_output.put_line('Empty result');
end if;
Close c1;
End;

/
Declare
cursor c1 is 
select ename from emp, dept 
where emp.did = dept.did and dname = 'service';
v_count int;
Begin
select count(*) into v_count 
from dept where dname = 'service';
if v_count = 0 then dbms_output.put_line('No such department');
else
for r in c1 
loop
dbms_output.put_line(r.ename);
end loop;
end if;
End;