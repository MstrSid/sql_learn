CREATE TABLE locations2 AS (SELECT *
                            FROM locations
                            WHERE 1 = 2);

INSERT INTO locations2 (LOCATION_ID, STREET_ADDRESS, CITY, COUNTRY_ID)
values (3300, 'some1', 'city1', 2);
INSERT INTO locations2 (LOCATION_ID, STREET_ADDRESS, CITY, COUNTRY_ID)
values (3301, 'some2', 'city2', 2);

commit;

INSERT INTO locations2
values (3303, 'some3', 2012, UPPER('city3'), INITCAP('province3'), 2);
INSERT INTO locations2
values (3304, 'some4', 2014, UPPER('city4'), INITCAP('province4'), 2);

commit;

insert into locations2 (select * from LOCATIONS where length(STATE_PROVINCE) > 9);

commit;

CREATE TABLE locations4europe AS (SELECT *
                                  FROM locations
                                  WHERE 1 = 2);

insert all
    when 1 = 1 then
    into locations2
values (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID)
    when LOCATION_ID in (select LOCATION_ID
                         from LOCATIONS
                         where COUNTRY_ID in (select COUNTRY_ID
                                              from COUNTRIES
                                              where REGION_ID = (select REGION_ID from REGIONS where REGION_NAME = 'Europe'))) then
into locations4europe
select *
from LOCATIONS;

commit;

update locations2
set POSTAL_CODE=123321
where POSTAL_CODE is null;

rollback;

update locations2
set POSTAL_CODE=(select POSTAL_CODE from LOCATIONS where LOCATION_ID = 2600)
where POSTAL_CODE is null;

commit;

delete from locations2 where COUNTRY_ID='IT';

savepoint s1;

update locations2 set STREET_ADDRESS='Sezam st. 18' where LOCATION_ID > 2500;

savepoint s2;

delete from locations2 where STREET_ADDRESS='Sezam st. 18';

rollback to s1;

commit;