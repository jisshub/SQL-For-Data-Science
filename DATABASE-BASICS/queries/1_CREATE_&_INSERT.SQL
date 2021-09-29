create table regions (
   region_id int,
   region varchar(20),
   country varchar(20),
   primary key (region_id)
  );

insert into regions values (1, 'Southwest', 'United States');
insert into regions values (2, 'Northeast', 'United States');
insert into regions values (3, 'Northwest', 'United States');
insert into regions values (4, 'Central', 'Asia');
insert into regions values (5, 'East Asia', 'Asia');
insert into regions values (6, 'Quebec', 'Canada');
insert into regions values (7, 'Nova Scotia', 'Canada');
