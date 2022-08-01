create table friends(ID, NAME, SURNAME) as (select EMPLOYEE_ID, FIRST_NAME, LAST_NAME
                                            from EMPLOYEES
                                            where COMMISSION_PCT is not null);

alter table friends
    add EMAIL varchar2(20);

alter table friends
    modify EMAIL varchar2(20) default 'no email';

insert into friends(ID, NAME, SURNAME)
values (100500, 'some', 'dude');

alter table friends rename column ID to FRIEND_ID;

drop table friends;

create table friend_new
(
    id       number,
    name     varchar2(20),
    surname  varchar2(20),
    email    varchar2(20),
    salary   number(10, 2) default 1500.00,
    city     varchar2(20),
    birthday date          default TO_DATE('01-01-1900', 'DD-MM-YYYY')
);

insert into friend_new
values (1, 'some', 'dude', 'some_mail', 1400.50, 'newer city', '19-02-1991');

insert into friend_new(id, name, surname, email, city)
values (2, 'some2', 'dude2', 'some_mail2', 'newer city2');

commit;

alter table friend_new drop column salary;

alter table friend_new set unused column email;

alter table friend_new set unused column birthday;

alter table friend_new drop unused columns;

alter table friend_new read only;

insert into friend_new(id, name, surname, email, city)
values (3, 'some3', 'dude3', 'some_mail3', 'newer city3');

truncate table friend_new;

drop table friend_new;