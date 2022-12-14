 show databases
    -> 

^C
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| LIBRARY            |
| TRANSACTION        |
| batmobile          |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.13 sec)

mysql> use LIBRARY;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| Author            |
| BOOK              |
| Book_Issue        |
| Book_Return       |
| Language          |
| Late_Fee_Rule     |
| Member            |
| Publisher         |
+-------------------+
8 rows in set (0.00 sec)

mysql> select * from Author;
+-----------+--------+------------------+------------+--------------+
| Author_id | Name   | Email            | Ph_no      | Status       |
+-----------+--------+------------------+------------+--------------+
|         1 | Ashwin | ashwin@gmail.com | 8547354992 | Story Writer |
|         2 | Fahma  | fahma@gmail.com  | 9495669621 | Novelist     |
|         3 | Durga  | dga@gmail.com    | 9847082962 | Story Wrier  |
|         4 | Melvin | melv@gmail.com   | 8547353423 | Novelist     |
+-----------+--------+------------------+------------+--------------+
4 rows in set (0.00 sec)

mysql> select * from BOOK;
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
| Book_id | Title      | Language_id | MRP  | Publisher_id | Published_date | Volume | Status       |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
|       1 | C PROGRAM  |           5 |  300 |            2 | 2000-10-21     |      3 | Returned     |
|       2 | CHERUKADHA |           3 |  150 |            4 | 2010-07-30     |      1 | Not Returned |
|       3 | JAVA       |           5 |  200 |            1 | 2010-02-10     |      2 | Not Returned |
|       4 | DATA BASE  |           6 |  250 |            3 | 2005-10-03     |      1 | Returned     |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
4 rows in set (0.00 sec)

mysql> mysql> select * from 
    -> 

^C
mysql> select * from Language;
+---------+-----------+
| lang_id | Name      |
+---------+-----------+
|       3 | Malayalam |
|       5 | English   |
|       6 | Hindi     |
+---------+-----------+
3 rows in set (0.00 sec)

mysql> select * from Book_Issue;
Empty set (0.00 sec)

mysql> select * from Book_Return;
Empty set (0.00 sec)

mysql> desc Book_Issue;
+-------------------------+---------+------+-----+---------+-------+
| Field                   | Type    | Null | Key | Default | Extra |
+-------------------------+---------+------+-----+---------+-------+
| Issue_id                | int(11) | NO   | PRI | NULL    |       |
| Book_id                 | int(11) | YES  | MUL | NULL    |       |
| Member_id               | int(11) | YES  | MUL | NULL    |       |
| Expected_date_of_return | date    | YES  |     | NULL    |       |
+-------------------------+---------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into Book_Issue values(2,5,7,'2020-03-12');
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`LIBRARY`.`Book_Issue`, CONSTRAINT `Book_Issue_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `BOOK` (`Book_id`))
mysql> set foreign_key_checks=0;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into Book_Issue values(2,5,7,'2020-03-12');
Query OK, 1 row affected (0.08 sec)

mysql> insert into Book_Issue values(3,6,8,'2020-04-2');
Query OK, 1 row affected (0.05 sec)

mysql> insert into Book_Issue values(4,7,9,'2020-05-9');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Book_Issue values(5,8,10,'2020-06-5');
Query OK, 1 row affected (0.04 sec)

mysql> insert into Book_Issue values(6,9,11,'2020-04-8');
Query OK, 1 row affected (0.04 sec)

mysql> select * from Book_Issue
Book_Issue                         Book_Issue.Issue_id               
Book_Issue.Book_id                 Book_Issue.Member_id              
Book_Issue.Expected_date_of_return
mysql> select * from Book_Issue
    -> 

^C
mysql> select * from Book_Issue;
+----------+---------+-----------+-------------------------+
| Issue_id | Book_id | Member_id | Expected_date_of_return |
+----------+---------+-----------+-------------------------+
|        2 |       5 |         7 | 2020-03-12              |
|        3 |       6 |         8 | 2020-04-02              |
|        4 |       7 |         9 | 2020-05-09              |
|        5 |       8 |        10 | 2020-06-05              |
|        6 |       9 |        11 | 2020-04-08              |
+----------+---------+-----------+-------------------------+
5 rows in set (0.00 sec)

mysql> desc Book_Return;
+-----------------------+---------+------+-----+---------+-------+
| Field                 | Type    | Null | Key | Default | Extra |
+-----------------------+---------+------+-----+---------+-------+
| Issue_id              | int(11) | YES  | MUL | NULL    |       |
| Actual_date_of_return | date    | YES  |     | NULL    |       |
| late_days             | int(11) | YES  |     | NULL    |       |
| late_fee              | int(11) | YES  |     | NULL    |       |
+-----------------------+---------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into Book_Return values(3,'2020-05-9',23,100);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Book_Return values(2,'2020-04-7',3,200);
Query OK, 1 row affected (0.07 sec)

mysql> insert into Book_Return values(5,'2020-08-9',10,20);
Query OK, 1 row affected (0.04 sec)

mysql> insert into Book_Return values(6,'2020-07-10',30,210);
Query OK, 1 row affected (0.04 sec)

mysql> select * from Book_Return;
+----------+-----------------------+-----------+----------+
| Issue_id | Actual_date_of_return | late_days | late_fee |
+----------+-----------------------+-----------+----------+
|        3 | 2020-05-09            |        23 |      100 |
|        2 | 2020-04-07            |         3 |      200 |
|        5 | 2020-08-09            |        10 |       20 |
|        6 | 2020-07-10            |        30 |      210 |
+----------+-----------------------+-----------+----------+
4 rows in set (0.00 sec)

mysql> Delimiter &&
mysql> create procedure Book_Return(IN p1 int,IN p2 date,IN p3,int,IN p4 int);
    -> begin
    -> update Book_Issue set status='Returned' where Issue_id=p1;
    -> insert into Book_Return values(p1,p2,p3,p4);
    -> end &&
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int,IN p4 int); 
begin
update Book_Issue set status='Returned' where Issue_id=p1' at line 1
mysql> &&
ERROR: 
No query specified

mysql> Delimiter ;
mysql> Delimiter &&
mysql> create procedure Book_Return(IN p1 INT,IN P2 date,IN p3 INT,IN p4 INT) BEGIN upadtemysql> create procedure Book_Return(IN p1 INT,IN P2 ^[[A
       end &&
^C
mysql> Delimiter;
    -> 
    -> 

^C
mysql> Delimiter ;
mysql> Delimiter &&
mysql> create procedure Book_Return(IN P1 INT,IN P2 date,IN P3 INT,IN P4 INT) 
    -> BEGIN
    -> insert into Book_Return values(p1,p2,p3,p4);
    -> UPDATE Book_Issue set status='Return' where Issue_id=p1;
    -> end &&
Query OK, 0 rows affected (0.04 sec)

mysql> Delimiter ;
mysql> Alter table Book_Issue add status varcahr(10);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'varcahr(10)' at line 1
mysql> Alter table Book_Issue add status varchar(10);
Query OK, 0 rows affected (0.77 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> end &&                                                                                                                                     -> 
    -> 
    -> 

^C
mysql> update Book_Issue set status='Returned' where Issue_id=2;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Book_Issue set status='Returned' where Issue_id=3;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Book_Issue set status='Returned' where Issue_id=4;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Book_Issue set status='Returned' where Issue_id=5;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Book_Issue set status='Returned' where Issue_id=6;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Book_Issue;
+----------+---------+-----------+-------------------------+----------+
| Issue_id | Book_id | Member_id | Expected_date_of_return | status   |
+----------+---------+-----------+-------------------------+----------+
|        2 |       5 |         7 | 2020-03-12              | Returned |
|        3 |       6 |         8 | 2020-04-02              | Returned |
|        4 |       7 |         9 | 2020-05-09              | Returned |
|        5 |       8 |        10 | 2020-06-05              | Returned |
|        6 |       9 |        11 | 2020-04-08              | Returned |
+----------+---------+-----------+-------------------------+----------+
5 rows in set (0.00 sec)

mysql> Delimiter &&
mysql> call Book_Return(4,'2020-03-12',22,189);
    -> &&
Query OK, 1 row affected (0.12 sec)

mysql> select * from Book_Return;
    -> &&
+----------+-----------------------+-----------+----------+
| Issue_id | Actual_date_of_return | late_days | late_fee |
+----------+-----------------------+-----------+----------+
|        3 | 2020-05-09            |        23 |      100 |
|        2 | 2020-04-07            |         3 |      200 |
|        5 | 2020-08-09            |        10 |       20 |
|        6 | 2020-07-10            |        30 |      210 |
|        4 | 2020-03-12            |        22 |      189 |
+----------+-----------------------+-----------+----------+
5 rows in set (0.00 sec)

mysql> select * from Book_Issue;
    -> &&
+----------+---------+-----------+-------------------------+----------+
| Issue_id | Book_id | Member_id | Expected_date_of_return | status   |
+----------+---------+-----------+-------------------------+----------+
|        2 |       5 |         7 | 2020-03-12              | Returned |
|        3 |       6 |         8 | 2020-04-02              | Returned |
|        4 |       7 |         9 | 2020-05-09              | Return   |
|        5 |       8 |        10 | 2020-06-05              | Returned |
|        6 |       9 |        11 | 2020-04-08              | Returned |
+----------+---------+-----------+-------------------------+----------+
5 rows in set (0.00 sec)

mysql> Delimiter ;
mysql> select * from Book_Issue;
+----------+---------+-----------+-------------------------+----------+
| Issue_id | Book_id | Member_id | Expected_date_of_return | status   |
+----------+---------+-----------+-------------------------+----------+
|        2 |       5 |         7 | 2020-03-12              | Returned |
|        3 |       6 |         8 | 2020-04-02              | Returned |
|        4 |       7 |         9 | 2020-05-09              | Return   |
|        5 |       8 |        10 | 2020-06-05              | Returned |
|        6 |       9 |        11 | 2020-04-08              | Returned |
+----------+---------+-----------+-------------------------+----------+
5 rows in set (0.00 sec)

mysql> select * from Book_Return;
+----------+-----------------------+-----------+----------+
| Issue_id | Actual_date_of_return | late_days | late_fee |
+----------+-----------------------+-----------+----------+
|        3 | 2020-05-09            |        23 |      100 |
|        2 | 2020-04-07            |         3 |      200 |
|        5 | 2020-08-09            |        10 |       20 |
|        6 | 2020-07-10            |        30 |      210 |
|        4 | 2020-03-12            |        22 |      189 |
+----------+-----------------------+-----------+----------+
5 rows in set (0.00 sec)
