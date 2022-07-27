select r.REGION_NAME, count(*)
from EMPLOYEES e
         join DEPARTMENTS d on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
         join LOCATIONS l on (d.LOCATION_ID = l.LOCATION_ID)
         join COUNTRIES c on (l.COUNTRY_ID = c.COUNTRY_ID)
         join REGIONS r on (c.REGION_ID = r.REGION_ID)
group by r.REGION_NAME;

select e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_NAME, e.JOB_ID, l.STREET_ADDRESS, cn.COUNTRY_NAME, r.REGION_NAME
from EMPLOYEES e
         join DEPARTMENTS d on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
         join LOCATIONS l on (d.LOCATION_ID = l.LOCATION_ID)
         join COUNTRIES cn on (l.COUNTRY_ID = cn.COUNTRY_ID)
         join REGIONS r on (cn.REGION_ID = r.REGION_ID);

select e1.FIRST_NAME "Manager", count(*) "Emp"
from EMPLOYEES e1
         join EMPLOYEES e2 on (e1.EMPLOYEE_ID = e2.MANAGER_ID)
group by e1.FIRST_NAME
having count(*) > 6;

select DEPARTMENT_NAME, count(*) Employeers
from EMPLOYEES
         join DEPARTMENTS using (DEPARTMENT_ID)
group by DEPARTMENT_NAME
having count(*) > 30;

select DEPARTMENT_NAME
from EMPLOYEES e
         right outer join DEPARTMENTS d on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
where e.FIRST_NAME is null;

select e.*
from EMPLOYEES e
         join EMPLOYEES m on (e.MANAGER_ID = m.EMPLOYEE_ID)
where to_char(m.HIRE_DATE, 'YYYY') = '2005'
  and to_char(e.HIRE_DATE, 'YYYY') < '2005';

select COUNTRY_NAME, REGION_NAME
from COUNTRIES
         natural join REGIONS;

select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES e
         join JOBS j on (e.JOB_ID = j.JOB_ID and e.SALARY < j.MIN_SALARY + 1000);

select DISTINCT FIRST_NAME, LAST_NAME, COUNTRY_NAME
from EMPLOYEES e
         full outer join DEPARTMENTS d on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
         full outer join LOCATIONS l on (d.LOCATION_ID = l.LOCATION_ID)
         full outer join COUNTRIES cn on (l.COUNTRY_ID = cn.COUNTRY_ID);

select FIRST_NAME, LAST_NAME, COUNTRY_NAME
from EMPLOYEES
         cross join COUNTRIES;

select r.REGION_NAME, count(*)
from EMPLOYEES e,
     DEPARTMENTS d,
     LOCATIONS l,
     COUNTRIES c,
     REGIONS r
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
  and d.LOCATION_ID = l.LOCATION_ID
  and l.COUNTRY_ID = c.COUNTRY_ID
  and c.REGION_ID = r.REGION_ID
group by r.REGION_NAME;

select DEPARTMENT_NAME
from EMPLOYEES e, DEPARTMENTS d
where e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID and e.FIRST_NAME is null;