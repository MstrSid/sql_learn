select DEPARTMENT_ID, max(SALARY), min(SALARY), max(HIRE_DATE), min(HIRE_DATE), count(FIRST_NAME) emp
from EMPLOYEES
group by DEPARTMENT_ID
order by emp;

select substr(FIRST_NAME, 1, 1) fLetter,
       count(*)                 cNames
from EMPLOYEES
group by substr(FIRST_NAME, 1, 1)
having count(*) > 1
order by cNames desc;

select DEPARTMENT_ID, SALARY, count(*)
from EMPLOYEES
group by DEPARTMENT_ID, SALARY;

select to_char(HIRE_DATE, 'day'), count(*)
from EMPLOYEES
group by to_char(HIRE_DATE, 'day');

select DEPARTMENT_ID
from EMPLOYEES
group by DEPARTMENT_ID
having count(*) > 30
   and sum(SALARY) > 30000;

select REGION_ID
from COUNTRIES
group by REGION_ID
having sum(length(COUNTRY_NAME)) > 50;

select JOB_ID, round(avg(SALARY))
from EMPLOYEES
group by JOB_ID;

select DEPARTMENT_ID
from EMPLOYEES
group by DEPARTMENT_ID
having count(distinct JOB_ID) > 1;

select DEPARTMENT_ID, JOB_ID, max(SALARY), min(SALARY)
from EMPLOYEES
group by DEPARTMENT_ID, JOB_ID
having avg(SALARY) > 10000;

select MANAGER_ID
from EMPLOYEES
where COMMISSION_PCT is null
group by MANAGER_ID
having avg(SALARY) between 6000 and 9000;

select round(max(avg(SALARY)), 1000)
from EMPLOYEES
group by DEPARTMENT_ID;