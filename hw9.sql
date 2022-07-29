select MANAGER_ID, to_char(null) job_id, to_number(null) department_id, sum(SALARY) sum
from EMPLOYEES
group by MANAGER_ID
union
select to_number(null) manager_id, JOB_ID, to_number(null) department_id, sum(SALARY) sum
from EMPLOYEES
group by JOB_ID, to_char(null), to_char(null)
union
select to_number(null) manager_id, to_char(null) job_id, DEPARTMENT_ID, sum(SALARY) sum
from EMPLOYEES
group by DEPARTMENT_ID;

select DEPARTMENT_ID
from EMPLOYEES
where MANAGER_ID = 100
minus
select DEPARTMENT_ID
from EMPLOYEES
where MANAGER_ID in (145, 201);

select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES
where FIRST_NAME like '_a%'
intersect
select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES
where lower(LAST_NAME) like '%s%'
order by SALARY desc;

select LOCATION_ID, POSTAL_CODE, CITY, COUNTRY_ID
from LOCATIONS
where COUNTRY_ID in (select COUNTRY_ID from COUNTRIES where COUNTRY_NAME in ('Italy', 'Germany'))
union all
select LOCATION_ID, POSTAL_CODE, CITY, COUNTRY_ID
from LOCATIONS
where to_char(POSTAL_CODE) like '%9%';

select COUNTRY_ID id, COUNTRY_NAME country, REGION_ID region
from COUNTRIES
where length(COUNTRY_NAME) > 8
union
select *
from COUNTRIES
where REGION_ID != (select REGION_ID from REGIONS where lower(REGION_NAME) = 'europe')
order by country desc;