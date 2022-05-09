create table department (dep_id  integer primary key,dep_name varchar(20),dep_location varchar(15));
create table salary_grade (grade integer primary key ,min_salary integer ,max_salary integer );
create table employees (emp_id integer primary key, emp_name varchar(15),job_name varchar(10),
manager_id integer,hire_date date,salary decimal(10,2),commission decimal(7,2),dep_id integer);
insert into employees values(68319,"KAYLING","PRESIDENT",null,"1991-11-18",6000.00,null,1001);
insert into employees values(66928,"BLAZE","MANAGER",68319,"1991-05-01",2750.00,null,3001);
insert into employees values(67832,"CLARE","MANAGER",68319,"1991-06-09",2550.00,null,1001);
insert into employees values(65646,"JONAS","MANAGER",68319,"1991-04-02",2957.00,null,2001);
insert into employees values(67858,"SCARLET","ANALYST",65646,"1997-04-19",3100.00,null,2001);
insert into employees values(69062,"FRANK","ANALYST",65646,"1991-12-03",3100.00,null,2001);
insert into employees values(63679,"SANDRINE","CLERK",69062,"1990-12-18",900.00,null,2001);
insert into employees values(64989,"ADELYN","SALESMAN",66928,"1991-02-20",1700.00,400.00,3001);
insert into employees values(65271,"WADE","SALESMAN",66928,"1991-02-22",1350.00,600.00,3001);
insert into employees values(66564,"MADDEN","SALESMAN",66928,"1991-09-28",1350.00,1500.00,3001);
insert into employees values(68454,"TUCKER","SALESMAN",66928,"1991-09-08",1600.00,0.00,3001);
insert into employees values(68736,"ADNRES","CLERK",67858,"1997-05-23",1200.00,null,2001);
insert into employees values(69000,"JULIUS","CLERK",66928,"1991-12-03",1050.00,null,3001);
insert into employees values(69324,"MARKER","CLERK",67832,"1992-01-03",1400.00,null,1001);
insert into salary_grade values(1,800,1300);
insert into salary_grade values(2,1301,1500);
insert into salary_grade values(3,1501,2100);
insert into salary_grade values(4,2101,3100);
insert into salary_grade values(5,3101,9999);
insert into department values(1001,"FINANCE ","SYDNEY");
insert into department values(2001,"AUDIT ","MELBOURNE");
insert into department values(3001,"MARKETING ","PERTH");
insert into department values(4001,"PRODUCTION ","BISBANE");
select * from employees;
select salary from employees ;
select distinct job_name from employees;
select  emp_name ,concat("$", (salary+(salary*15)/100)) as salary from employees;
select concat(emp_name,"  " ,job_name) as Employee$Job from employees ;
select emp_id,emp_name,salary,date_format(hire_date,'%M %d %Y') as hire_date from employees;
select length(emp_name) as length from employees;
select emp_id,salary,commission from employees;
select distinct dep_id,job_name from employees ;
select * from employees where dep_id !=2001;
select * from employees where hire_date<"1991-01-01";
select avg(salary) from employees where job_name="ANALYST";
select * from employees where emp_name="BLAZE";
select  * from employees where (1.25*salary)>3000;
select * from employees where  date_format(hire_date,"%M")="January";
select emp_id,emp_name,hire_date,salary from employees where hire_date<"1991-04-01";
SELECT e.emp_name,e.salary FROM employees e,salary_grade s
WHERE e.emp_name = 'FRANK'AND e.salary BETWEEN s.min_salary AND s.max_salary
AND e.salary = s.max_salary ;
select * from employees where (job_name !="MANAGER")and (job_name!="PRESIDENT") order by salary;
select max(salary) as highest from employees;
select job_name,avg(salary),avg(salary+commission) from employees group by job_name;
select e.emp_id,e.emp_name,e.dep_id,d.dep_location,d.dep_name
from employees e,department d
where e.dep_id = d.dep_id and e.dep_id in (1001,2001);
select w.manager_id,count(*)
from employees w,employees m
where w.manager_id = m.emp_id
group by  w.manager_id
order by w.manager_id ASC;
select dep_id ,count(emp_id) as count from employees group by dep_id having count(emp_id)>1;
select * from employees where emp_name like "%AR%";
Alter table employees add gender varchar(10);
update employees set gender="male" where emp_id in (68319,66928,67832,69062,64989,65271,66564,68454,69324);
update employees set gender="female" where emp_id in (65646,67858,69000,68736,63679);




