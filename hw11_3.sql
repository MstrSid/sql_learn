create table emp1000 as
select FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
from EMPLOYEES;

create or replace force view v1000 as
select FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_NAME, CITY
from emp1000 e
         join DEPARTMENTS d on (e.DEPARTMENT_ID = d.DEPARTMENT_ID);

alter table emp1000
    add (city varchar2(20));

create synonym syn1000 for v1000;

drop view v1000;

drop synonym syn1000;

drop table emp1000;

create sequence seq1000 increment by 4 start with 12 maxvalue 200 cycle;

select seq1000.nextval
from DUAL;

alter sequence seq1000 increment by 4;

insert into EMPLOYEES (employee_id, last_name, email, hire_date, job_id)
values (seq1000.nextval, 'Ichigo', 'mail1', TO_DATE('01-01-2019', 'DD-MM-YYYY'), 'IT_PROG');

insert into EMPLOYEES (employee_id, last_name, email, hire_date, job_id)
values (seq1000.nextval, 'Ichigo2', 'mail2', TO_DATE('01-01-2019', 'DD-MM-YYYY'), 'IT_PROG');

commit;
