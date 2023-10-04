set serveroutput on;

declare
new_emp emp%rowtype;
begin
new_emp.eid := 5;
new_emp.did := 2;
new_emp.ename := 'erica';
new_emp.salary := 90000;
new_emp.hiredate := date '2010-2-1';
insert into emp values new_emp;
end;
/
declare
e_date emp.hiredate%type;
begin
e_date := sysdate;
update emp set hiredate = e_date where ename = 'erica';
end;
/