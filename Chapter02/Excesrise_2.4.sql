-- Excersice 2.4 (Ullman Book)

CREATE TABLE Product (
maker char(1),
model varchar(10), 
type varchar(10)
);

INSERT INTO PRODUCT VALUES ('A', '1001', 'pc');
INSERT INTO PRODUCT VALUES ('A', '1002', 'pc');
INSERT INTO PRODUCT VALUES ('A', '1003', 'pc');
INSERT INTO PRODUCT VALUES ('B', '1004', 'pc');
INSERT INTO PRODUCT VALUES ('B', '1005', 'pc');
INSERT INTO PRODUCT VALUES ('B', '1006', 'pc');
INSERT INTO PRODUCT VALUES ('C', '1007', 'pc');
INSERT INTO PRODUCT VALUES ('D', '1008', 'pc');
INSERT INTO PRODUCT VALUES ('D', '1009', 'pc');
INSERT INTO PRODUCT VALUES ('D', '1010', 'pc');
INSERT INTO PRODUCT VALUES ('E', '1011', 'pc');
INSERT INTO PRODUCT VALUES ('E', '1012', 'pc');
INSERT INTO PRODUCT VALUES ('E', '1013', 'pc');
INSERT INTO PRODUCT VALUES ('A', '2004', 'laptop');
INSERT INTO PRODUCT VALUES ('A', '2005', 'laptop');
INSERT INTO PRODUCT VALUES ('A', '2006', 'laptop');
INSERT INTO PRODUCT VALUES ('B', '2007', 'laptop');
INSERT INTO PRODUCT VALUES ('E', '2001', 'laptop');
INSERT INTO PRODUCT VALUES ('E', '2002', 'laptop');
INSERT INTO PRODUCT VALUES ('E', '2003', 'laptop');
INSERT INTO PRODUCT VALUES ('F', '2008', 'laptop');
INSERT INTO PRODUCT VALUES ('F', '2009', 'laptop');
INSERT INTO PRODUCT VALUES ('G', '2010', 'laptop');
INSERT INTO PRODUCT VALUES ('E', '3001', 'printer');
INSERT INTO PRODUCT VALUES ('E', '3002', 'printer');
INSERT INTO PRODUCT VALUES ('E', '3003', 'printer');
INSERT INTO PRODUCT VALUES ('H', '3006', 'printer');
INSERT INTO PRODUCT VALUES ('H', '3007', 'printer');
INSERT INTO PRODUCT VALUES ('D', '3004', 'printer');
INSERT INTO PRODUCT VALUES ('D', '3005', 'printer');
INSERT INTO PRODUCT VALUES ('B', '2011', 'laptop');

CREATE TABLE Printer (
model varchar(10), 
color varchar(5),
type varchar(10),
price integer,
);

INSERT INTO PRINTER VALUES ('3001', 'true', 'ink-jet', 99);
INSERT INTO PRINTER VALUES ('3002', 'false', 'laser', 239);
INSERT INTO PRINTER VALUES ('3003', 'true', 'laser', 899);
INSERT INTO PRINTER VALUES ('3004', 'true', 'ink-jet', 120);
INSERT INTO PRINTER VALUES ('3005', 'false', 'laser', 120);
INSERT INTO PRINTER VALUES ('3006', 'true', 'ink-jet', 100);
INSERT INTO PRINTER VALUES ('3007', 'true', 'laser', 200);

CREATE TABLE Laptop (
model varchar(10),
speed real,
ram integer,
hd integer,
screen real,
price integer
);

INSERT INTO Laptop VALUES ('2001', 2.00, 2048, 240 , 20.1, 3673);
INSERT INTO Laptop VALUES ('2002', 1.73, 1024, 80  , 17.0, 949 );
INSERT INTO Laptop VALUES ('2003', 1.80, 512 , 60  , 15.4, 549 );
INSERT INTO Laptop VALUES ('2004', 2.00, 512 , 60  , 13.3, 1150);
INSERT INTO Laptop VALUES ('2005', 2.16, 1024, 120 , 17.0, 2500);
INSERT INTO Laptop VALUES ('2006', 2.00, 2048, 80  , 15.4, 1700);
INSERT INTO Laptop VALUES ('2007', 1.83, 1024, 120 , 13.3, 1429);
INSERT INTO Laptop VALUES ('2008', 1.60, 1024, 100 , 15.4, 900 );
INSERT INTO Laptop VALUES ('2009', 1.60, 512 , 80  , 14.1, 680 );
INSERT INTO Laptop VALUES ('2010', 2.00, 2048, 160 , 15.4, 2300);
INSERT INTO Laptop VALUES ('2011', 2.81, 2048, 160 , 15.4, 2300);

CREATE TABLE PC (
model varchar(10),
speed real,
ram integer,
hd integer,
price integer
);

INSERT INTO PC VALUES (1001, 2.66, 1024 ,250 ,2114);
INSERT INTO PC VALUES (1002, 2.10, 512  ,250 ,995 );
INSERT INTO PC VALUES (1003, 1.42, 512  ,80  ,478 );
INSERT INTO PC VALUES (1004, 2.80, 1024 ,250 ,649 );
INSERT INTO PC VALUES (1005, 3.20, 512  ,250 ,630 );
INSERT INTO PC VALUES (1006, 3.20, 1024 ,320 ,1049);
INSERT INTO PC VALUES (1007, 2.20, 1024 ,200 ,510 );
INSERT INTO PC VALUES (1008, 2.20, 2048 ,250 ,770 );
INSERT INTO PC VALUES (1009, 2.00, 1024 ,250 ,650 );
INSERT INTO PC VALUES (1010, 2.80, 2048 ,300 ,770 );
INSERT INTO PC VALUES (1011, 1.86, 2048 ,160 ,959 );
INSERT INTO PC VALUES (1012, 2.80, 1024 ,160 ,649 );
INSERT INTO PC VALUES (1013, 3.06, 512  ,80  ,529 );


-- 2.4.1 (d)
select model from Printer
where printer.color='true' and Printer.type='laser'

-- 2.4.1 (e)
select DISTINCT maker from Product P1
where P1.type='laptop'
EXCEPT
select DISTINCT maker from Product P1
where P1.type='pc'

-- 2.4.1 (f): Find those hard-disk sizes that occur in two or more PC’s.
select Laptop.hd from Laptop
group by hd
having count(*)>=2

-- alternate solution (in terms of more simpler relational algebra)
select distinct l1.hd
from Laptop L1, Laptop L2
where l1.model!=l2.model and l1.hd=l2.hd

-- 2.4.1 (g);
select p1.model, p2.model
from pc p1, pc p2
where p1.model!=p2.model and p1.hd=p2.hd and p1.ram=p2.ram

-- 2.4.1 (h):
select P1.maker
from Product P1, PC
where p1.model=pc.model and pc.speed>2.8
intersect
select P1.maker
from Product P1, laptop
where p1.model=laptop.model and laptop.speed>2.8

-- alternate solution (not optimal)
select distinct p1.maker
from Product p1, product p2, (select model from pc where speed>2.8 union select model from laptop where speed>2.8) as T1, (select model from pc where speed>2.8 union select model from laptop where speed>2.8) T2
where p1.model=t1.model and p2.model=t2.model and p1.maker=p2.maker and t1.model>t2.model 

-- 2.4.1 (i):
-- (all computers - computers which are less than some other computer)
select model
from (select model, speed from pc union select model, speed from laptop) as temp 
except
select distinct t1.model
from (select model, speed from pc union select model, speed from laptop) as T1, (select model, speed from pc union select model, speed from laptop) as T2
where t1.speed<t2.speed

-- 2.4.1 (k):
select distinct p1.maker
from (select maker, model from Product where type='PC') AS P1, (select maker, model from Product where type='PC') AS P2, (select maker, model from Product where type='PC') AS P3
where p1.maker=p2.maker and p1.maker=p3.maker and p1.model!=p2.model and p1.model!=p3.model and p2.model!=p3.model
