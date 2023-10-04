-- unnamed PL/SQL
set serveroutput on;
declare
a varchar(50);
begin
a := 'this is my first pl/sql';
dbms_output.put_line(a);
end;
/

-- date and timestamp example
declare
d date;
t timestamp;
begin
d := date '2023-5-22';
t := timestamp '2023-5-22 17:00:53.00';
dbms_output.put_line(d);
dbms_output.put_line(t);
end;
/

-- column type example
declare
n emp.ename%type;
begin
n := 'Lua';
insert into emp values (6, n, 2, date '2006-9-1', 60000); -- need to put all of variables
end;
/

-- row type example
declare
rec emp%rowtype;
begin
rec.ename := 'yura';
dbms_output.put_line(rec.ename);
end;
/

-- arithmetic example
declare
nums number;
begin
nums := 2**10;
dbms_output.put_line(nums);
end;
/

-- elsif example
declare 
a number;
b number;
c number;
begin
a := 1;
b := 2;
c := 10;
if a > b then
dbms_output.put_line(a || ' is the largest number');
elsif
b > c then
dbms_output.put_line(b || ' is the largest number');
else
dbms_output.put_line(c || ' is the largest number');
end if;
end;
/

-- loop example
declare
a number;
b number;
c number;
p number;
begin
a := 1;
b := 2;
c := 10;
if a > c then
p := a;
dbms_output.put_line('a is ' || p || ' and it is the largest number');
elsif 
b > c then
p := b;
dbms_output.put_line('b is ' || p || ' and it is the largest number');
else
p := c;
dbms_output.put_line('c is ' || p || ' and it is the largest number');
end if;
end;


