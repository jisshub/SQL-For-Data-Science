# Installing postgres on Windows

https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

# Create tables - insert data

## Create Table statement

```SQL
create table departments (
    department varchar(100),
    division varchar(100),
    primary key (department)
  );
```

### Primary Key Constraint

- Ensures user inserting unique data.
- Ensure no duplicates values are inserted.
- Ensure there are some data in each row.
- Prevents null values from inserted to table.
- Only one primary key constraint per table.

## Insert statements

```SQL
insert into departments values ('Clothing','Home');
insert into departments values ('Grocery','Home');
```

## SELECT Statements
