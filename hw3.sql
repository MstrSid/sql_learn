select *
from employees
where first_name = 'David';

select *
from employees
where job_id = 'FI_ACCOUNT';

select first_name, last_name, salary, department_id
from employees
where department_id = 50 and salary > 4000;

select *
from employees
where department_id in (20,30);

select *
from employees
where first_name like '_a%a';

select *
from employees
where department_id in (50,80) and not commission_pct is null
order by 4;

select *
from employees
where first_name like '%nn%';

select *
from employees
where length(first_name)>4
order by department_id desc nulls last;

select *
from employees
where (salary between 3000 and 7000)
and commission_pct is null
and job_id in ('PU_CLERK','ST_MAN','ST_CLERK');

select *
from employees
where first_name like '%\%%' escape('\');

select job_id, first_name, salary
from employees
where employee_id >= 120 and job_id != 'IT_PROG'
order by job_id, first_name desc;