select *
from EMPLOYEES
where length(FIRST_NAME) = (select max(length(FIRST_NAME)) from EMPLOYEES);

select *
from EMPLOYEES
where SALARY > (select avg(SALARY) from EMPLOYEES);

select CITY
from EMPLOYEES e
         join DEPARTMENTS d on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
         join LOCATIONS l on (d.LOCATION_ID = l.LOCATION_ID)
group by CITY
having sum(e.SALARY) = (select min(sum(e.SALARY))
                        from EMPLOYEES e
                                 join DEPARTMENTS d on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
                                 join LOCATIONS l on (d.LOCATION_ID = l.LOCATION_ID)
                        group by CITY);

select *
from EMPLOYEES
where MANAGER_ID in (select EMPLOYEE_ID
                     from EMPLOYEES
                     where SALARY > 15000);

select *
from DEPARTMENTS
where DEPARTMENT_ID not in (select distinct DEPARTMENT_ID
                            from EMPLOYEES
                            where DEPARTMENT_ID is not null);

select *
from EMPLOYEES
where EMPLOYEE_ID not in (select distinct MANAGER_ID from EMPLOYEES where MANAGER_ID is not null);

select *
from EMPLOYEES e
where (select count(*) from EMPLOYEES where MANAGER_ID = e.EMPLOYEE_ID) > 6;

select *
from EMPLOYEES
where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENTS where DEPARTMENT_NAME = 'IT');

select *
from EMPLOYEES
where to_char(HIRE_DATE, 'YYYY') < '2005'
  and MANAGER_ID in (select EMPLOYEE_ID from EMPLOYEES where to_char(HIRE_DATE, 'YYYY') = '2005');

select *
from EMPLOYEES e
where to_char(HIRE_DATE, 'MM') = '01'
  and (select length(JOB_TITLE) from JOBS where e.JOB_ID = JOB_ID) > 15;