create database Employee;
use Employee;

create table PROJECT(PNO INT PRIMARY KEY, PNAME VARCHAR(20), PLOC VARCHAR(20));

create table DEPT(DEPTNO INT PRIMARY KEY, DNAME VARCHAR(20), DLOC VARCHAR(20));

create table EMPLOYEE(EMPNO INT PRIMARY KEY, ENAME VARCHAR(20), MGR_NO INT, HIREDATE DATE, SAL REAL, DEPTNO INT,
FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO));

create table INCENTIVES(EMPNO INT, INCENTIVE_DATE DATE, INCENTIVE_AMT REAL, 
PRIMARY KEY(EMPNO, INCENTIVE_DATE),
FOREIGN KEY(EMPNO) REFERENCES EMPLOYEE(EMPNO));

create table ASSIGNED_TO(EMPNO INT, PNO INT, JOB_ROLE VARCHAR(20),
PRIMARY KEY(EMPNO, PNO),
FOREIGN KEY(EMPNO) REFERENCES EMPLOYEE(EMPNO),
FOREIGN KEY(PNO) REFERENCES PROJECT(PNO));

insert into project VALUES(101, 'AI Project', 'Bengaluru'),(201, 'Blockchain', 'Mysuru'),(301, 'WebDevApp', 'Hyderabad'),
(401, 'Self Driving Car', 'Bengaluru'),(501, 'Phone Dev', 'Mumbai');

insert into DEPT VALUES(1, 'IT', 'Hyderabad'),(2, 'HR', 'Mumbai'),(3, 'Sales', 'Mysuru'),(4, 'Design', 'Bengaluru'),(5, 'Accounting', 'Hyderabad');

insert into EMPLOYEE VALUES(2001, 'Advit', 6001, '2025-01-01', 50000, 2),(1003, 'Aditya', 2003, '2025-03-09', 45000, 1),(3007, 'Rahul', 6002, '2025-02-04', 40000, 3),
(4001, 'Krishna', 7001, '2025-10-30', 80000, 4),(5010, 'Harsh', 7002, '2025-10-10', 60000, 5);

insert into INCENTIVES VALUES(1003, '2025-11-11', 10000),(2001, '2025-10-10', 20000),(4001, '2025-12-12', 5000),(4001, '2025-11-05', 15000),(5010, '2025-11-20', 10000);

insert into ASSIGNED_TO VALUES(1003, 101, 'Software Developer'),(2001, 201, 'Project Manager'),(3007, 301, 'Advertising'),(4001, 501, 'UI/UX Designer'),(5010, 501, 'Auditor');

SELECT E.EMPNO FROM EMPLOYEE E, PROJECT P, ASSIGNED_TO A WHERE E.EMPNO=A.EMPNO AND A.PNO=P.PNO AND P.PLOC IN('Bengaluru', 'Mysuru', 'Hyderabad');

select * from employee e where e.empno NOT in(select empno from incentives);

select e.ename, e.empno, e.deptno, a.job_role, d.dloc as Dept_LOC, p.ploc as Project_LOC from employee as e
join dept as d on e.deptno=d.deptno
join assigned_to as a on a.empno=e.empno
join project as p on p.pno=a.pno;


select m.ename as Manager_Name, count(e.empno) as Emp_Count from employee e join employee m on e.mgr_no=m.empno
group by m.ename order by emp_count desc;

select m.ename as Manager_Name from employee m where m.sal>(select avg(e.sal) from employee e where e.mgr_no=m.empno);

select * from employee;
insert into EMPLOYEE values(0001, "Amogh", NULL, '2023-01-01', 100000, 4);
update employee set mgr_no=1 where empno=4001;


select e2.ename as Second_Level_Manager, d.dname as Dept_Name from employee e1 join employee e2 on e1.empno=e2.mgr_no join dept d on e2.deptno=d.deptno where e1.mgr_no is NULL;