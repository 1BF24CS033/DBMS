create database bank;
use bank;

create table Branch(branch_name VARCHAR(30), branch_city VARCHAR(20), assets REAL, PRIMARY KEY(branch_name));

create table BankAccount(accno INT, branch_name VARCHAR(30), balance REAL, PRIMARY KEY(accno),
FOREIGN KEY(branch_name) REFERENCES Branch(branch_name));

create table BankCustomer(customer_name VARCHAR(50), customer_street VARCHAR(50), customer_city VARCHAR(20),
PRIMARY KEY(customer_name));

create table Depositor(customer_name VARCHAR(50), accno INT, PRIMARY KEY(customer_name, accno),
FOREIGN KEY(customer_name) REFERENCES BankCustomer(customer_name),
FOREIGN KEY(accno) REFERENCES BankAccount(accno));

	create table Loan(loan_number INT, branch_name VARCHAR(30), amount REAL, PRIMARY KEY(loan_number),
FOREIGN KEY(branch_name) REFERENCES Branch(branch_name));


insert into Branch VALUES('SBI_Chamrajpet', 'Bangalore', 50000);
insert into Branch VALUES('SBI_ResidencyRoad', 'Bangalore', 10000);
insert into Branch VALUES('SBI_ShivajiRoad', 'Bombay', 20000);
insert into Branch VALUES('SBI_ParliamentRoad', 'Delhi', 10000);
insert into Branch VALUES('SBI_Jantarmantar', 'Delhi', 20000);

insert into BankCustomer values('Avinash', 'Bull_TempleRoad', 'Bangalore'), 
('Dinesh', 'Bannerghatta_Road', 'Bangalore'), ('Mohan', 'NationalCollege_Road', 'Bangalore'), 
('Nikil', 'Akbar_Road', 'Delhi'), ('Ravi', 'Prithviraj_Road', 'Delhi');

insert into BankAccount VALUES(1, 'SBI_Chamrajpet', 2000), (2, 'SBI_ResidencyRoad', 5000), 
(3, 'SBI_ShivajiRoad', 6000), (4, 'SBI_ParliamentRoad', 9000), 
(5, 'SBI_Jantarmantar', 8000), (6, 'SBI_ShivajiRoad', 4000),
 (8, 'SBI_ResidencyRoad', 4000), (9, 'SBI_ParliamentRoad', 3000),
 (10, 'SBI_ResidencyRoad', 5000), (11, 'SBI_Jantarmantar', 2000);

insert into Depositor values('Avinash', 1), ('Dinesh', 2), ('Nikil', 4), ('Ravi', 5), ('Avinash', 8), ('Nikil', 9), ('Dinesh', 10), ('Nikil', 11);


insert into Loan values(1, 'SBI_Chamrajpet', 1000), (2, 'SBI_ResidencyRoad', 2000),
 (3, 'SBI_ShivajiRoad', 3000), (4, 'SBI_ParliamentRoad', 4000), (5, 'SBI_Jantarmantar', 5000);
 
 select * from Branch;
select * from BankAccount;
select * from BankCustomer;
select * from Depositor;
select * from Loan;

drop table branch;

select branch_name, (assets/100000) AS 'Assets in Lakhs' from Branch;

select d.customer_name, ba.branch_name from depositor d join BankAccount ba on ba.accno=d.accno
group by d.customer_name, ba.branch_name having count(ba.accno)>=2;

create VIEW branchsumloan as select branch_name, sum(amount) as totalLoan from Loan
group by branch_name;
select * from branchsumloan;
COMMIT;