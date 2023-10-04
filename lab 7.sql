set serveroutput on;

-- return names of dept that susan works in
declare
e_name varchar(50);
d_dname varchar(50);
begin
select ename, dname into e_name, d_dname
from emp, dept
where ename = 'susan' and e.did = d.did;
dbms_output.put_line('ename is: ' || ename || 'dname is '|| dname);
exception
    when no_data_found then
        dbms_output.put_line('no rows found');
end;
/

declare
v_count int;
begin
select count(*) into v_count
from emp where ename = 'jeff';
-- if jeff exists then count will increment by 1 after checking the emp table
if v_count = 0 then
dbms_output.put_line('No such employee');
elsif v_count = 1 then
dbms_output.put_line('Jeff exists');
else
    select count(*) into v_count
    from emp, dept where emp.did = dept.did and dname = 'HR';
-- check if HR dept exists, if it does, count will increment after checking dept table
    if v_count = 0 then
    dbms_output.put_line('No such dept');
    elsif v_count = 1 then
    dbms_output.put_line('HR exists');
    else
        update emp 
        set salary = salary + 3000
        where ename = 'jeff';
        end if;
    end if;
end;
