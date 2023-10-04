select avg(count(emp.eid))
from emp, emp_proj
where emp.eid = emp_proj.eid(+)
group by emp.eid;


select did, max(salary)
from dept
group by did
having max(salary) > 90000;