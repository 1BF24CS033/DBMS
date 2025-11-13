create database Supplier;
use Supplier;
create table Supplier(sid int primary key, sname varchar(30), city varchar(20));
create table Parts(pid int primary key, pname varchar(20), color varchar(20));
create table Catalog(sid int, pid int, cost decimal(10, 2),
primary key(sid, pid),
foreign key (sid) references Supplier(sid),
foreign key (pid) references Parts(pid));


insert into Supplier values(1, 'Acme Widget Suppliers', 'New York'), (2, 'Big Suppliers', 'Delhi'), (3, 'Catch Suppliers', 'Chicago');
insert into Parts values(101, 'Nut', 'Red'), (102, 'Bolt', 'Blue'),(103, 'Screw', 'Red');
insert into Catalog values(1, 101, 10.00),
(2, 101, 12.00), (2, 102, 12.00), (2, 103, 12.00),
(3, 101, 15.00), (3, 103, 15.00);


select distinct p.pname from parts p join catalog c on c.pid=p.pid;

select s.sname from supplier s join catalog c on c.sid=s.sid
group by s.sid having count(distinct c.pid)=(select count(pid) from Parts);

select s.sname from supplier s
join catalog c on s.sid=c.sid
join parts p on c.pid=p.pid
where p.color="Red"
group by s.sid
having count(distinct c.pid)=(select count(*) from parts where color="Red");

SELECT p.pname from parts p
join catalog c on p.pid=c.pid
join supplier s on s.sid=c.sid
where s.sname='Acme Widget Suppliers' and c.pid in(select pid from Catalog group by pid having count(distinct sid)=1);

select p.pname from supplier s 
join catalog c on s.sid=c.sid
join parts p on p.pid=c.pid
group by p.pname having count(distinct s.sid)=1;

select distinct c.sid from catalog c where c.cost > (select avg(c2.cost) from catalog c2 where c2.pid=c.pid);

select p.pname, s.sname from catalog c 
join supplier s on c.sid=s.sid
join parts p on p.pid=c.pid
where c.cost=(select max(c2.cost) from catalog c2 where c2.pid=c.pid);