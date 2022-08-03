create table ADDRESS
(
    id      number
        constraint ad_id_un unique,
    country varchar2(20),
    city    varchar2(20)
);

create table FRIENDS
(
    id       integer,
    name     varchar2(20),
    email    varchar2(20),
    address_id references ADDRESS (id) on delete set null,
    birthday date,
    constraint check_name_length check ( length(name) > 3 )
);

create unique index fr_index on FRIENDS (id);

alter table FRIENDS
    add constraint fr_id_pk primary key (id);

create index fr_email_in on FRIENDS (email);

alter table FRIENDS
    modify (email constraint fr_email_nn not null);

drop table FRIENDS;

drop table ADDRESS;