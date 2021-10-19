create table cars(make varchar(10));

insert into cars values('maruthi');
insert into cars values('maruthi');
insert into cars values('maruthi');
insert into cars values('benz');
insert into cars values('benz');
insert into cars values('tata');

select * from cars;

select make, count(*) from cars group by make;
-- here we gets a 3 groups of data with their count.

