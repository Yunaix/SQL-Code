set serveroutput on;

declare
today date;
begin
today := sysdate;
if today = date '2020-2-1' and today < date '2020-3-1' then
dbms_output.put_line('Today is in February 2020');
elsif today < date '2020-2-1' then
dbms_output.put_line('Today is before February 2020');
elsif today >= date '2020-3-1' then
dbms_output.put_line('Today is after February 2020');
end if;
end;
/

declare 
x int;
begin
x := 2024;
if mod(x,4) <> 0 then
dbms_output.put_line('Not a leap year');
elsif mod(x, 100)<>100 then
dbms_output.put_line('It is a leap year');
elsif mod(x, 400) = 0 then
dbms_output.put_line('It is a leap year');
else
dbms_output.put_line('Not a leap year');
end if;
end;
/

declare 
x int;
total int;
begin
x := 1;
total := 0;
loop
total := total + power(x, 2);
x := x + 1;
exit when x > 100;
end loop;
dbms_output.put_line('square of x is ' || total);
end;
/



