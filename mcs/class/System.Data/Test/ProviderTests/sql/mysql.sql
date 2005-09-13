delimiter //
use monotest
//

-- =================================== OBJECT NUMERIC_FAMILY =========================
-- TABLE : NUMERIC_FAMILY
-- data with id > 6000 is not gaurenteed to be read-only.
drop table if exists numeric_family;
//

create table numeric_family (
	id int PRIMARY KEY NOT NULL,
	type_bit bit NULL,
	type_tinyint tinyint NULL,
	type_smallint smallint NULL,
	type_int int NULL,
	type_bigint bigint NULL,
	type_decimal decimal (38, 0) NULL,
	type_numeric numeric (38, 0) NULL,
	type_money numeric (38,0) NULL,
	type_smallmoney numeric (12,0) NULL);
-- does not have money & smallmoney types
//

insert into numeric_family values (1,1,255,32767,2147483647,9223372036854775807,1000,1000,922337203685477.5807,214748.3647);
insert into numeric_family values (2,0,0,-32768,-2147483648,-9223372036854775808,-1000,-1000,-922337203685477.5808,-214748.3648);
insert into numeric_family values (3,0,0,0,0,0,0,0,0,0); insert into numeric_family values (4,null,null,null,null,null,null,null,null,null); //

-- =================================== END OBJECT NUMERIC_FAMILY ========================

-- =================================== OBJECT BINARY_FAMILY =========================
-- TABLE : BINARY_FAMILY
-- data with id > 6000 is not gaurenteed to be read-only.
drop table if exists binary_family;
//

create table binary_family (
	id int PRIMARY KEY NOT NULL,
	type_binary binary NULL,
	type_varbinary varbinary (255) NULL,
	type_blob blob NULL,
	type_tinyblob tinyblob NULL,
	type_mediumblob mediumblob NULL,
	type_longblob_image longblob NULL);
//

insert into binary_family values (1, '555555', '0123456789012345678901234567890123456789012345678901234567890123456789', '66666666', '777777', '888888', '999999');
--insert into binary_family values (2,
--insert into binary_family values (3,
insert into binary_family values (4,null,null,null,null,null,null);
//

-- =================================== END OBJECT BINARY_FAMILY ========================


-- =================================== OBJECT EMPLOYEE ============================
-- TABLE : EMPLOYEE
-- data with id above 6000 is not gaurenteed to be read-only.
drop table if exists employee;
//

create table employee ( 
	id int PRIMARY KEY NOT NULL, 
	fname varchar (50) NOT NULL,
	lname varchar (50),
	dob datetime NOT NULL,
	doj datetime NOT NULL,
	email varchar (50));

grant all privileges on employee to monotester;

insert into employee values (1, 'suresh', 'kumar', '1978-08-22', '2001-03-12', 'suresh@gmail.com');
insert into employee values (2, 'ramesh', 'rajendran', '1977-02-15', '2005-02-11', 'ramesh@yahoo.com');
insert into employee values (3, 'venkat', 'ramakrishnan', '1977-06-12', '2003-12-11', 'ramesh@yahoo.com');
insert into employee values (4, 'ramu', 'dhasarath', '1977-02-15', '2005-02-11', 'ramesh@yahoo.com');
//

-- STORED PROCEDURES
-- SP : sp_clean_person_table
drop procedure if exists sp_clean_employee_table;
//

create procedure sp_clean_employee_table ()
begin
	delete from employee where id > 6000;
end
//

-- SP : sp_get_age
drop procedure if exists sp_get_age;
//

create procedure sp_get_age (
	fname varchar (50),
	OUT age int)
as 
begin
	select age = datediff (day, dob, getdate ()) from employee where fname like fname;
	return age;
end
//

-- =================================== END OBJECT EMPLOYEE ============================
