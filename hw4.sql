select *
from employees
where length(first_name) > 10;

select *
from employees
where mod(salary, 1000) = 0;

select phone_number, substr(phone_number, 1, 3)
from employees
where phone_number like '___.___.____';

select *
from employees
where first_name like '%m'
  and length(first_name) > 5;

select next_day(sysdate + 1, 5)
from dual;

select *
from employees
where months_between(sysdate, hire_date) > 150;

select replace(phone_number, '.', '-') "phone"
from employees;

select rpad(upper(first_name), 15, ' ') ||
       lpad(lower(last_name), 15, ' ') ||
       lpad(initcap(job_id), 15, ' ') "data"
from employees;

select concat(first_name, salary)
from employees;

select hire_date, round(hire_date, 'MM'), trunc(hire_date, 'YYYY')
from employees;

select rpad(first_name, 10, '$'), lpad(last_name, 15, '!')
from employees
where length(first_name) <= 10
  and length(last_name) <= 15;

select first_name, instr(first_name, 'a', 1, 2)
from employees;

select '!!!HELLO!! MY FRIEND!!!!!!!', trim(both '!' from '!!!HELLO!! MY FRIEND!!!!!!!')
from dual;

select salary, salary * 3.1415, round(salary * 3.1415), trunc(salary * 3.1415)
from employees;

select hire_date, add_months(hire_date, 6), last_day(hire_date)
from employees;