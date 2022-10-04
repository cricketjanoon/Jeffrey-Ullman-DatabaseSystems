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

-- 2.4.1 (d)
select model from Printer
where printer.color='true' and Printer.type='laser'

-- 2.4.1 (e)
select DISTINCT maker from Product P1
where P1.type='laptop'
EXCEPT
select DISTINCT maker from Product P1
where P1.type='pc'