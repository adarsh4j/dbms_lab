
create procedure BOOK(IN S1 INT,IN S2 VARCHAR(30),IN S3 INT ,IN S4 INT,IN S5 INT,IN S6 date,IN S7 INT,IN S8 VARCHAR(20),IN S9 INT) BEGIN if S9=1 THEN INSERT INTO BOOK VALUES(S1,S2,S3,S4,S5,S6,S7,S8); ELSEIF S9=2 THEN UPDATE BOOK SET MRP=S4,Volume=S7,Status=S8 where Book_id=S1; ELSEIF S9=3 THEN DELETE FROM BOOK WHERE Book_id=S1; END IF; END&&
Query OK, 0 rows affected (0.00 sec)

mysql> create procedure BOOK(IN S1 INT,IN S2 VARCHAR(30),IN S3 INT ,IN S4 INT,IN S5 INT,IN S6 date,IN S7 INT,IN S8 VARCHAR(20),IN S9 INT)
    -> BEGIN
    -> if S9=1 THEN
    -> INSERT INTO BOOK VALUES(S1,S2,S3,S4,S5,S6,S7,S8);
    -> ELSEIF S9=2 THEN
    -> UPDATE BOOK SET MRP=S4,Volume=S7,Status=S8 where Book_id=S1;
    -> ELSEIF S9=3 THEN
    -> DELETE FROM BOOK WHERE Book_id=S1;
    -> ENDIF;
    -> END &&


mysql> call BOOK(4,"DATA BASE",6,250,3,'2005-10-03',1,"NA",2);
    -> &&
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM BOOK;
    -> &&
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
| Book_id | Title      | Language_id | MRP  | Publisher_id | Published_date | Volume | Status       |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
|       4 | DATA BASE  |           6 |  250 |            3 | 2005-10-03     |      1 | NA           |
|       5 | C PROGRAM  |           5 |  300 |            2 | 2000-10-21     |      3 | Returned     |
|       6 | CHERUKADHA |           3 |  150 |            4 | 2010-07-30     |      1 | Not Returned |
|       8 | JAVA       |           5 |  200 |            1 | 2010-02-10     |      2 | Not Returned |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
4 rows in set (0.00 sec)

mysql> call BOOK(7,"C++",10,2500,44,'2015-11-04',9,"Returned",1);
    -> &&
Query OK, 1 row affected (0.05 sec)

mysql> SELECT * FROM BOOK;
    -> &&
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
| Book_id | Title      | Language_id | MRP  | Publisher_id | Published_date | Volume | Status       |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
|       4 | DATA BASE  |           6 |  250 |            3 | 2005-10-03     |      1 | NA           |
|       5 | C PROGRAM  |           5 |  300 |            2 | 2000-10-21     |      3 | Returned     |
|       6 | CHERUKADHA |           3 |  150 |            4 | 2010-07-30     |      1 | Not Returned |
|       7 | C++        |          10 | 2500 |           44 | 2015-11-04     |      9 | Returned     |
|       8 | JAVA       |           5 |  200 |            1 | 2010-02-10     |      2 | Not Returned |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
5 rows in set (0.00 sec)

mysql> call BOOK(7,"C++",10,2500,44,'2015-11-04',9,"Returned",3);
    -> &&
Query OK, 1 row affected (0.04 sec)

mysql> SELECT * FROM BOOK;
    -> &&
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
| Book_id | Title      | Language_id | MRP  | Publisher_id | Published_date | Volume | Status       |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
|       4 | DATA BASE  |           6 |  250 |            3 | 2005-10-03     |      1 | NA           |
|       5 | C PROGRAM  |           5 |  300 |            2 | 2000-10-21     |      3 | Returned     |
|       6 | CHERUKADHA |           3 |  150 |            4 | 2010-07-30     |      1 | Not Returned |
|       8 | JAVA       |           5 |  200 |            1 | 2010-02-10     |      2 | Not Returned |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
4 rows in set (0.00 sec)
