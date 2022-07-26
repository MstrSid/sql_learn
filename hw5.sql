select *
from EMPLOYEES
where instr(lower(FIRST_NAME), 'b') > 0;

select *
from EMPLOYEES
where instr(lower(FIRST_NAME), 'a') = 2;

select substr(DEPARTMENT_NAME, 0, instr(DEPARTMENT_NAME, ' ') - 1)
from DEPARTMENTS
where DEPARTMENT_NAME like '% %';

select substr(FIRST_NAME, 2, length(FIRST_NAME) - 2)
from EMPLOYEES;

select *
from EMPLOYEES
where substr(JOB_ID, instr(JOB_ID, '_') + 1) != 'CLERK'
  and length(substr(JOB_ID, instr(JOB_ID, '_') + 1)) > 2;

select *
from EMPLOYEES
where to_char(HIRE_DATE, 'DD') = '01';

select *
from EMPLOYEES
where to_char(HIRE_DATE, 'YYYY') = '2008';

select to_char(SYSDATE + 1, 'fm"Tomorrow is "Ddspth "day of "Month')
from dual;

select FIRST_NAME, TO_CHAR(HIRE_DATE, 'fmDDth" of "Month", "YYYY')
from EMPLOYEES;

select FIRST_NAME, LAST_NAME, to_char(SALARY * 1.2, '$999,999.99') "Salary"
from EMPLOYEES;

select sysdate                   "Now",
       sysdate + 1 / (24 * 3600) "plus second",
       sysdate + 1 / (24 * 60)   "plus minute",
       sysdate + 1 / 24          "plus hour",
       sysdate + 1               "plus day",
       add_months(sysdate, 1)    "plus month",
       add_months(sysdate, 12)   "plus year"
from DUAL;

select FIRST_NAME, SALARY, SALARY + to_number('$12,345.55', '$99,999.99') "New salary"
from EMPLOYEES;

select FIRST_NAME,
       to_char(HIRE_DATE, 'Day')                                                        "Hire day",
       HIRE_DATE,
       round(to_date('СЕН, 18:15:15 18 2009', 'month, hh24:mi:ss DD YYYY')) - HIRE_DATE days
from EMPLOYEES;

select FIRST_NAME,
       SALARY,
       nvl2(COMMISSION_PCT, to_char(SALARY * COMMISSION_PCT + SALARY, '$999,999.99'),
            to_char(SALARY, '$999,999.99')) full_salary
from EMPLOYEES;

select FIRST_NAME,
       LAST_NAME,
       nvl2(nullif(length(FIRST_NAME), length(LAST_NAME)), 'Different length', 'Same length') Length
from EMPLOYEES;

select FIRST_NAME, SALARY * COMMISSION_PCT Commisison, nvl2(COMMISSION_PCT, 'Yes', 'No') Have_comission
from EMPLOYEES;

select FIRST_NAME, coalesce(COMMISSION_PCT, MANAGER_ID, SALARY) Info
from EMPLOYEES;

select FIRST_NAME,
       SALARY,
       case
           when SALARY < 5000 then 'Low'
           when SALARY >= 5000 and SALARY < 10000 then 'Middle'
           when SALARY >= 1000 then 'High' end
from EMPLOYEES;

select decode(lower(REGION_NAME), 'europe', 1, 'americas', 2, 'asia', 3, 'africa', 4, 5), REGION_NAME
from REGIONS;

select REGION_NAME,
       case lower(REGION_NAME)
           when 'europe' then 1
           when 'americas' then 2
           when 'asia' then 3
           when 'africa' then 4
           else 5 end Region
from REGIONS;

select FIRST_NAME,
       SALARY,
       case
           when (SALARY < 10000 and COMMISSION_PCT is null) then 'BAD'
           when ((SALARY between 10000 and 15000) or COMMISSION_PCT is not null) then 'NORMAL'
           when SALARY >= 15000 then 'GOOD' end
from EMPLOYEES;