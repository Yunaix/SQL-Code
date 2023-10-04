declare
x date;
begin
x:= sysdate;
if x >= date '2023-1-31' and x <= date '2023-5-31' then
dbms_output.put_line('Now is not in Spring 2023');
end if;
end;
/
