set serveroutput on;
-- Practice 1: Use a for loop to compute the product of 1,2,3,4. Print the product
declare
product integer := 1;
begin 
for i in 1..4
loop
product := product * i;
end loop;
dbms_output.put_line(product);
end;
/

-- Practice 2: Use Implicit Cursor to return the salary of employee whose id is 1, print out the salary
declare
e_salary number;
e_id int;
begin
select eid, salary into e_id, e_salary
from emp
where eid = 1;
dbms_output.put_line('e_id is: ' || e_id || ' and '|| 'e_salary is: '|| e_salary);
end;
/




