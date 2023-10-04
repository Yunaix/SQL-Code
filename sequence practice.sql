-- Sequences
create sequence proj_seq
start with 3;

insert into proj values(proj_seq.nextval, 'testing', date '05-01-17', date '05-09-17');
/
select * from proj;
/
declare
x int;
begin
select proj_seq.currval into x from dual;
dbms_output.put_line(x);
end;