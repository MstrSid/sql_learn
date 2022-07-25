select * from regions;

select first_name, department_id, salary, last_name from employees;

select employee_id, email, hire_date-7 from employees;

select first_name || '(' || job_id || ')' "our_employees" from employees;

select distinct first_name from employees;

select job_title, ('min = '||min_salary||' max = '||max_salary) "info", max_salary "max", max_salary*2-2000 new_salary from jobs;

select q'<Peter's dog is very clever>' from dual;

select 'Peter''s dog is very clever>' from dual;

select 100*365.25*24*60 from dual;