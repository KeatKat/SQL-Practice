/* 1 */
SET GLOBAL log_output = "TABLE";
SET GLOBAL general_log = "ON";


/*2*/
TRUNCATE TABLE mysql.general_log;


/*3*/
CREATE TABLE A3 ( Description VARCHAR(30) NOT NULL, CONSTRAINT A3_PKEY PRIMARY KEY (Description));
CREATE TABLE FUN ( Name VARCHAR(10) NOT NULL, CONSTRAINT A3_PKEY PRIMARY KEY (Name));

DELETE FROM ONLINEPURCHASE WHERE PurchaseID = '50004';
DELETE FROM ONLINEPURCHASE WHERE PurchaseID = '50002';
DELETE FROM ONLINEPURCHASE WHERE PurchaseID = '50010';
DELETE FROM ONLINEPURCHASE WHERE PurchaseID = '50022';
DELETE FROM WALKINPURCHASE WHERE PurchaseID = '50025';
DELETE FROM WALKINPURCHASE WHERE PurchaseID = '50012';
DELETE FROM WALKINPURCHASE WHERE PurchaseID = '50029';
DELETE FROM WALKINPURCHASE WHERE PurchaseID = '50010';
DELETE FROM PURCHASE WHERE PurchaseID = '50004';
INSERT INTO BOOK VALUES ('20211','Rich and Poor',20.88);
DELETE FROM BOOKAUTHOR WHERE BookID = '20101' AND AuthorID = '10004';
DELETE FROM PURCHASE WHERE PurchaseID = '50002';
DELETE FROM PURCHASE WHERE PurchaseID = '50010';
INSERT INTO BOOK VALUES ('20112','Najib influence',29.88);
DELETE FROM PURCHASE WHERE PurchaseID = '50022';
INSERT INTO BOOK VALUES ('20210','4G Singapore',25.88);
UPDATE BOOK SET Price=60 WHERE BookID = '20201';

ALTER TABLE A3 MODIFY Description VARCHAR(35);

COMMIT;

DELETE FROM PURCHASE WHERE PurchaseID = '50025';
DELETE FROM PURCHASE WHERE PurchaseID = '50012';
DELETE FROM PURCHASE WHERE PurchaseID = '50029';
DELETE FROM BOOKAUTHOR WHERE BookID = '20104' AND AuthorID = '10007';
DELETE FROM BOOKAUTHOR WHERE BookID = '20207' AND AuthorID = '10022';
INSERT INTO BOOK VALUES ('20110','Taipei Summer',20.88);
DELETE FROM BOOK WHERE BookID = '20101';
UPDATE BOOK SET Price=40 WHERE BookID = '20202';
DELETE FROM BOOK WHERE BookID = '20104';
DELETE FROM BOOK WHERE BookID = '20207';
INSERT INTO BOOK VALUES ('20111','Bangkok Wealther',20.88);
UPDATE BOOK SET Title='Myanmar Travel' WHERE BookID = '20108';

ROLLBACK;


INSERT INTO A3 VALUES ('Assignment 3 is fun');
SELECT * FROM A3;

DROP TABLE A3;
DROP TABLE FUN;

SELECT * FROM BOOK;

COMMIT;

/*4*/
SET GLOBAL general_log = "OFF";



/*5*/
SELECT * FROM mysql.general_log
WHERE argument LIKE "CREATE%" OR argument LIKE "ALTER%" OR argument LIKE "DROP%";

/*6*/ 
/* sql_mode cannot be in ONLY_FULL_GROUP_BY, if it is, this line of code will not run*/
SELECT * FROM (
SELECT *, COUNT(argument) AS CNT
FROM mysql.general_log
WHERE argument LIKE "SELECT%"
UNION
SELECT *, COUNT(argument)
FROM mysql.general_log
WHERE argument LIKE "INSERT%"
UNION
SELECT *, COUNT(argument)
FROM mysql.general_log
WHERE argument LIKE "DELETE%"
UNION
SELECT *, COUNT(argument)
FROM mysql.general_log  
WHERE argument LIKE "UPDATE%"
) E
ORDER BY CNT DESC;




