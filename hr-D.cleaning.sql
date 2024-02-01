CREATE database project1;

use project1;
select * from hr;
alter table hr
change column ï»¿id emp_ID varchar (20) null;

describe hr;

select birthdate from hr;

set sql_safe_updates = 0;

UPDATE hr 
SET birthdate = 
    CASE 
        WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate,'%m/%d/%Y'), '%Y-%m-%d') 
        WHEN birthdate LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(birthdate,'%m-%d-%Y'), '%Y-%m-%d') 
        ELSE NULL 
    END;

alter table hr
modify column birthdate date;
    
select birthdate from hr;

UPDATE hr 
SET hire_date = CASE 
	WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date,'%m/%d/%Y'), '%Y-%m-%d') 
	WHEN hire_date LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(hire_date,'%m-%d-%Y'), '%Y-%m-%d') 
	ELSE NULL 
END;
alter table hr
modify column hire_date date;

UPDATE hr 
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate!='';

alter table hr
modify column termdate date;

alter table hr add column age int;

update	hr
set age = timestampdiff(year, birthdate,curdate());

select birthdate,age from hr;

select 
	min(age) as youngest,
    max(age) as eldest
from hr;

select count(*) from hr where age<18;
 
