
use training;

-- Sub Query : query nested within another query (inner query)

select * from customer;
select * from transaction_tbl;

-- Customer who made txn (in command)

select * from customer where custid in (select distinct custid from transaction_tbl);   

-- Customer who did not made txn (not in command)

select * from customer where custid not in (select distinct custid from transaction_tbl);

-- Customer who purchased laptop

select * from customer where custid in (select distinct custid from transaction_tbl where productname = 'Laptop');

create table employee (empid integer, empname varchar(50), gender char(1), salary int);
select * from employee;

select * from employee where salary = (select max(salary) from employee);

select  avg(salary) from employee;
select * from employee where salary > (select avg(salary) from employee);
select * from employee where salary < (select avg(salary) from employee);

-- Views (virtual table based on results set of an SQL statement)

select * from employee;
create view emp_data as select empname, gender from employee;
select * from emp_data;
delete from employee where empname = 'Kashi';
set sql_safe_updates=0;

-- Updating view

alter view emp_data as select empname, gender, salary from employee;
select * from emp_data; 

-- Indexes (used to speedup the select query record)

show indexes from customer;
create index cust_idx on customer(custid);
select * from customer where custid = 1002;

-- index on more than 1 column

select * from employee;
show indexes from employee;
create index emp_idx on employee (empid, empname);
select * from employee where empid= 1 or salary < 45000;
























































