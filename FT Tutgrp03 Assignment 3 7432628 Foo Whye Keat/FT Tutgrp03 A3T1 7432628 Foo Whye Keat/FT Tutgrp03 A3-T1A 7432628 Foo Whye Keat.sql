/* 1 */
CREATE USER wkf866_1 IDENTIFIED BY "wkf866_1";
CREATE USER wkf866_2 IDENTIFIED BY "wkf866_2";
CREATE USER wkf866_3 IDENTIFIED BY "wkf866_3";
/* 2 */
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER, DROP ON wkf866.* TO wkf866_1 WITH GRANT OPTION;
/* 3 */
GRANT SELECT, CREATE VIEW ON wkf866.BOOK TO wkf866_2;
GRANT SELECT, CREATE VIEW ON wkf866.AUTHOR TO wkf866_2;
/* 4 */
ALTER USER wkf866_3 WITH MAX_QUERIES_PER_HOUR 100
									   MAX_UPDATES_PER_HOUR 10;
/* 5 */                                  
ALTER USER wkf866_2 PASSWORD EXPIRE;


/* 6 */                                         
SELECT Db, user, select_priv, insert_priv, update_priv, delete_priv, drop_priv, grant_priv, alter_priv
FROM mysql.db
WHERE user = "wkf866_1";

SELECT db, user, table_name, table_priv FROM mysql.tables_priv
WHERE user = "wkf866_2";

SELECT user, max_questions, max_updates FROM mysql.user
WHERE user = "wkf866_3";

SELECT user, password_expired FROM mysql.user
WHERE user = "wkf866_2";






