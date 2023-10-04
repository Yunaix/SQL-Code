drop table emp cascade constraints;
drop table proj cascade constraints;
drop table dept cascade constraints;
drop table emp_proj cascade constraints;

/*create tables*/
create table dept(
did int,
dname varchar(30),
primary key (did));

insert into dept values (1,'IT');
insert into dept values (2, 'HR');

create table emp(
eid int,
ename varchar(30),
did int,
hiredate date,
salary number,
primary key (eid),
foreign key (did) references dept (did));

insert into emp values (1, 'jeff', 1, date '2005-1-1', 70000);
insert into emp values (2, 'susam', 2, date '2005-6-1', 50000);
insert into emp values (3, 'bob', 1, date '2000-1-1', 90000);
insert into emp values (4, 'steve', 1, date '2006-1-1', 60000);

create table proj(
pid int,
pname varchar(30),
startdate date,
enddate date,
primary key(pid));

insert into proj values (1, 'umbc student db', date '2017-1-1', null);
insert into proj values (2, 'umbc library', date '2017-2-1', date '2017-7-1');

/* how to create a composite key */
create table emp_proj(
eid int,
pid int,
primary key(eid,pid),
foreign key (pid) references proj(pid));

insert into emp_proj values (1,2);
insert into emp_proj values (3,2);
insert into emp_proj values (1,1);
insert into emp_proj values (4,1);
insert into emp_proj values (2,1);

-- Queries
select * from emp;

select * from dept;

select * from proj;

select * from emp_proj;

select * from proj 
where startdate >= date '2017-1-1' and startdate <= date '2017-1-31';

select * from proj
where startdate >= date '2017-2-1' and enddate <= date '2017-2-28';

select ename
from emp e, proj p, emp_proj ep
where e.eid = ep.eid and p.pid = ep.pid and pname = 'umbc library';

select e2.name
from emp e1, emp e2, emp_proj ep1, emp_proj ep2
where e1.eid = ep1.eid and ep1.pid = ep2.pid and ep2.eid = e2.eid and e1.name = 'bob'
and e1.eid <> e2.eid;

---------------------------------------------------------------------------------------- Lab 3
select avg(count(emp.eid))
from emp, emp_proj
where emp.eid = emp_proj.eid(+)
group by emp.eid;


select did
from dept
group by did
having max(salary) > 90000;


select cid
from customer, order_detail 
where customer.cid = order_detail.cid
group by cid
having min(orders) >= 2;

select pid
from products
group by pid
having count(sales) > 1000000000;

------- Return names of projects having 3 employees working on it
select pname
from proj p, emp_proj ep
where p.pid = ep.pid
group by pname
having count(*) >= 3;



