select user (), database ();

show tables;

desc title;
desc department; 
desc employee;

-- title
select tno, tname from title;
select tno, tname from title where tno = 1;

update title set tname = '계약직' where tno = 6;
delete from title where tno = 6;
insert into title values(6,'인턴');

-- join (selectSameTitleEmployeeByTitleNo) 
select tno, tname, empno, empname, title, manager, salary, dept
	from title t join employee e on t.tno =e.title
 where t.tno = 3;

-- department
select deptNo, deptName, floor from department;
select deptNo, deptName, floor from department where deptno = 1;

update department set deptName = '회계' where deptNo = 5;
delete from department where deptNo = 5;
insert into department values(5, '마케팅', 20);


-- employee
select empno, empname, title, manager, salary, dept from employee;
select empno, empname, title, manager, salary, dept from employee where empno = 2106;

insert into employee values(1004, '박규영', 5, 1003, 2000000, 3);
update employee 
set empname = '천사', title = 3, manager = 4377, salary = 4000000, dept = 2
where empno = 1004;
delete from employee where empno = 1004;

-- employee join
select e.*, t.*, m.empno, m.empname, d.*
from employee e join title t on e.title = t.tno 
	left join employee m on e.manager = m.empno 
	join department d on e.dept= d.deptno;

create or replace view vm_employee
(empno, empname, title, tname, manager, mgrname, salary, dept, deptname, floor)
as
select e.empno, e.empname, e.title, t.tname, m.empno, m.empname, e.salary,
	   d.deptNo, d.deptName, d.floor
  from employee e join title t on e.title = t.tno 
	left join employee m on e.manager = m.empno 
	join department d on e.dept= d.deptno;

select empno, empname, manager, mgrname, salary, title, tname, dept, deptname, floor
	from vm_employee;

select empno, empname, manager, mgrname, salary, title, tname, dept, deptname, floor
	from vm_employee
  where empno = 1003;
    	
select * from vm_employee;

 select e.empno
 	  , e.empname
 	  , t.tno
 	  , t.tname
 	  , e.manager as manager_no
 	  , m.empname as manager_name
 	  , e.salary
 	  , d.deptno
 	  , d.deptname
 	  , d.floor
   from employee e join title t on e.title = t.tno
   		left join employee m on e.manager = m.empno 
   		join department d on e.dept = d.deptNo;

select empno, empname, title as title_no, manager as manager_no, salary, dept as deptNo
  from employee;
 
-- 부서가 1인 사원정보를 출력
select empno, empname, title, manager, salary, dept
from employee
where dept = (select deptNo from department where deptNo = 1);

