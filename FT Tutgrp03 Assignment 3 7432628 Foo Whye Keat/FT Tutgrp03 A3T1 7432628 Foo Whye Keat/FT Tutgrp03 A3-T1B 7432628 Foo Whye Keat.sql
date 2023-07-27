
/* Rows added */
SELECT *
FROM book 
WHERE bookID NOT IN (SELECT bookID FROM wkf866_doc);

/*Rows Deleted*/
SELECT * 
FROM wkf866_doc
WHERE bookID NOT IN (SELECT bookID FROM book);

/*Rows changed  -rows added,  rows deleted, rows with updates*/
SELECT *
FROM book 
WHERE bookID NOT IN (SELECT bookID FROM wkf866_doc)
UNION
SELECT * 
FROM wkf866_doc
WHERE bookID NOT IN (SELECT bookID FROM book)
UNION
SELECT n.bookID, n.title, n.price
FROM book n JOIN wkf866_doc o ON n.bookid=o.bookid
WHERE n.price NOT IN (SELECT price FROM wkf866_doc) 
OR n.title NOT IN (SELECT title FROM wkf866_doc);





