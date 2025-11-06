CREATE TABLE STUDENT(
stdid INT(5), stdname varchar(20), dob date,
doj date, fee INT(5), gender char);

desc STUDENT;
insert into STUDENT(stdid, stdname, dob, doj, fee, gender)
values(1, 'NADEEM', '2006-11-3', '2024-10-26', 11000, 'M');
insert into STUDENT(stdid, stdname, dob, doj, fee)
values(2, 'RAFIQ', '2006-11-3', '2024-9-11', 11000);
insert into STUDENT(stdid, stdname, dob, doj, fee, gender)
values(3, 'ABDUL', '2006-11-3', '2024-10-26', 11000, 'M');

Alter table STUDENT ADD PHONE_NO INT(10);

alter table STUDENT
rename column PHONE_NO to STUDENT_NO;
alter table student rename to STUDENT_INFO;
SELECT * FROM STUDENT;
ALTER TABLE STUDENT DROP COLUMN GENDER;
USE newdatabase;
DELETE FROM STUDENT WHERE STDID=2;


