insert into ACCIDENT values(11, '2003-01-01', 'Mysore Road');
insert into ACCIDENT values(12, '2004-02-02', 'South End Circle');
insert into ACCIDENT values(13, '2003-01-21', 'Bull Temple Road');
insert into ACCIDENT values(14, '2008-02-17', 'Mysore Road');
insert into ACCIDENT values(15, '2004-03-05', 'Kanakapura Road');

insert into PARTICIPATED values('A01', 'KA052250', 11, 10000);
insert into PARTICIPATED values('A02', 'KA053408', 12, 50000);
insert into PARTICIPATED values('A03', 'KA095477', 13, 25000);
insert into PARTICIPATED values('A04', 'KA031181', 14, 3000);
insert into PARTICIPATED values('A05', 'KA041702', 15, 5000);
desc accident;
SELECT * FROM PERSON;
SELECT * FROM CAR;
SELECT * FROM ACCIDENT;
SELECT * FROM OWNS;
SELECT * FROM PARTICIPATED;

UPDATE PARTICIPATED set damage_amount=25000 where reg_num='KA053408' AND report_num=12;
INSERT INTO ACCIDENT VALUES(16, '2006-05-08', 'JP Nagar');


SELECT * FROM CAR order by year asc;

SELECT COUNT(report_num) FROM CAR c, PARTICIPATED p where c.reg_num=p.reg_num and model='Lancer';

SELECT COUNT(DISTINCT driver_id) from PARTICIPATED p, ACCIDENT a
where p.report_num=a.report_num and a.accident_date like '2008%';

COMMIT;