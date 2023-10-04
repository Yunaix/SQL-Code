select dname, avg(salary)
from dept d, emp e
where d.did = e.did
group by dname;