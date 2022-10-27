       EXPERIMENT 4:1

mysql> CREATE DATABASE LIBRARY;
Query OK, 1 row affected (0.00 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| 44_Library         |
| COLLEGE            |
| Company            |
| LIBRARY            |
| Loan               |
| OP                 |
| SD_Library         |
| TEST               |
| TESTdb             |
| TRANSACTION        |
| bank               |
| batmobile          |
| college            |
| company            |
| my_data            |
| my_data2           |
| my_data3           |
| my_database        |
| mysql              |
| performance_schema |
| sys                |
| test               |
| test_1             |
| testui             |
+--------------------+
25 rows in set (0.11 sec)

mysql> DROP DATABASE LIBRARY;
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| 44_Library         |
| COLLEGE            |
| Company            |
| Loan               |
| OP                 |
| SD_Library         |
| TEST               |
| TESTdb             |
| TRANSACTION        |
| bank               |
| batmobile          |
| college            |
| company            |
| my_data            |
| my_data2           |
| my_data3           |
| my_database        |
| mysql              |
| performance_schema |
| sys                |
| test               |
| test_1             |
| testui             |
+--------------------+
24 rows in set (0.00 sec)

mysql> CREATE DATABASE LIBRARY;
Query OK, 1 row affected (0.00 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| 44_Library         |
| COLLEGE            |
| Company            |
| LIBRARY            |
| Loan               |
| OP                 |
| SD_Library         |
| TEST               |
| TESTdb             |
| TRANSACTION        |
| bank               |
| batmobile          |
| college            |
| company            |
| my_data            |
| my_data2           |
| my_data3           |
| my_database        |
| mysql              |
| performance_schema |
| sys                |
| test               |
| test_1             |
| testui             |
+--------------------+
25 rows in set (0.00 sec)












            EXPERIMENT 4:2



mysql> USE LIBRARY
Database changed
mysql> CREATE TABLE BOOK(book_id int PRIMARY KEY,title varchar(20),language_id int,Mrp int,publisher_id int ,publisher_date date,volume int,status varchar(20)); 
Query OK, 0 rows affected (0.44 sec)

mysql> insert into BOOK values(23,abcd,66,555,3233,11/08/2002,33,dfdd);
ERROR 1054 (42S22): Unknown column 'abcd' in 'field list'
mysql> insert into BOOK values(23,"abcd",66,555,3233,11/08/2002,33,"ddff");
ERROR 1292 (22007): Incorrect date value: '0.000686813186813186' for column 'publisher_date' at row 1
mysql> insert into BOOK values(23,"abcd",66,555,3233,2002-10-22,33,"ddff");
ERROR 1292 (22007): Incorrect date value: '1970' for column 'publisher_date' at row 1
mysql> insert into BOOK values(23,"abcd",66,555,3233,2002-10-10,33,"ddff");
ERROR 1292 (22007): Incorrect date value: '1982' for column 'publisher_date' at row 1
mysql> insert into BOOK values(23,"abcd",66,555,3233,1982-10-10,33,"ddff");
ERROR 1292 (22007): Incorrect date value: '1962' for column 'publisher_date' at row 1
mysql> insert into BOOK values(23,"abcd",66,555,3233,10-10-2002,33,"ddff");
ERROR 1292 (22007): Incorrect date value: '-2002' for column 'publisher_date' at row 1
mysql> insert into BOOK values(23,"abcd",66,555,3233,10-10-02,33,"ddff");
ERROR 1292 (22007): Incorrect date value: '-2' for column 'publisher_date' at row 1
mysql> CREATE TABLE AUTHOR(author_id int PRIMARY KEY,name varchar(20),email varchar(20),phone int,status varchar(20));
Query OK, 0 rows affected (0.28 sec)

mysql> create book_author(book_id int PRIMARY KEY,author_id int PRIMARY KEY);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'book_author(book_id int PRIMARY KEY,author_id int PRIMARY KEY)' at line 1
mysql> create book_author(book_id int PRIMARY KEY,author_id int );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'book_author(book_id int PRIMARY KEY,author_id int )' at line 1
mysql> create book_author(book_id int FOREIGN KEY REFERENCES BOOK(book_id),author_id int FOREIGN KEY REFERENCES AUTHOR(author_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'book_author(book_id int FOREIGN KEY REFERENCES BOOK(book_id),author_id int FOREI' at line 1
mysql> show tables
    -> show tables;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'show tables' at line 2
mysql>  show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| AUTHOR            |
| BOOK              |
+-------------------+
2 rows in set (0.00 sec)

mysql> create table member(member_id int PRIMARY KEY,name varchar(20),branch_code int,rollno int,email varchar(20),dateofjoin date,status varchar(20));
Query OK, 0 rows affected (0.29 sec)

mysql> show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| AUTHOR            |
| BOOK              |
| member            |
+-------------------+
3 rows in set (0.00 sec)

mysql> create table publisher(publisher_id int PRIMARY KEY,name varchar(20),address varchar(22));
Query OK, 0 rows affected (0.29 sec)

mysql> alter table BOOK
    -> ^C

^C
mysql> ALTER TABLE BOOK
    -> ADD FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id);
Query OK, 0 rows affected (0.75 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table language(language_id int PRIMARY KEY,name varchar(20));
Query OK, 0 rows affected (0.26 sec)

mysql> ALTER TABLE BOOK ADD FOREIGN KEY(language_id) REFERENCES language(language__id);
ERROR 1215 (HY000): Cannot add foreign key constraint
mysql> ALTER TABLE BOOK ADD FOREIGN KEY(language_id) REFERENCES language(language_id);
Query OK, 0 rows affected (0.67 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| AUTHOR            |
| BOOK              |
| language          |
| member            |
| publisher         |
+-------------------+
5 rows in set (0.00 sec)

mysql> create table late_feerule(from_days int,to_days int,amount int(PRIMARY KEY(from_days,to_days,amount));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'PRIMARY KEY(from_days,to_days,amount))' at line 1
mysql> create table late_feerule(from_days int,to_days int,amount int,PRIMARY KEY(from_days,to_days,amount);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create table late_feerule(from_days int,to_days int,amount int,PRIMARY KEY(from_days,to_days,amount));
Query OK, 0 rows affected (0.29 sec)

mysql> show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| AUTHOR            |
| BOOK              |
| language          |
| late_feerule      |
| member            |
| publisher         |
+-------------------+
6 rows in set (0.00 sec)

mysql> create book_author(book_id int,author_id int,PRIMARY KEY(book_id,author_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'book_author(book_id int,author_id int,PRIMARY KEY(book_id,author_id))' at line 1
mysql> create table book_author(book_id int,author_id int,PRIMARY KEY(book_id,author_id));
Query OK, 0 rows affected (0.29 sec)

mysql> ALTER TABLE book_author
    -> ADD FOREIGN KEY(book_id) REFERENCES BOOK(book_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 2
mysql> ALTER TABLE book_author ADD FOREIGN KEY(book_id) REFERENCES BOOK(book_id);
Query OK, 0 rows affected (0.90 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE book_author ADD FOREIGN KEY(author_id) REFERENCES AUTHOR(author_id);
Query OK, 0 rows affected (0.62 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| AUTHOR            |
| BOOK              |
| book_author       |
| language          |
| late_feerule      |
| member            |
| publisher         |
+-------------------+
7 rows in set (0.00 sec)

mysql> create table book_issue(issue_id int PRIMARY KEY,date_issue date,FOREIGN KEY(book_id) REFERENCES BOOK(book_id),FOREIGN KEY(member_id) REFERENCES member(member_id),expected_date date);
ERROR 1072 (42000): Key column 'book_id' doesn't exist in table
mysql> create table book_issue(issue_id int PRIMARY KEY,date_issue date,book_id int FOREIGN KEY(book_id) REFERENCES BOOK(book_id),member_id int FOREIGN KEY(member_id) REFERENCES member(member_id),expected_date date);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FOREIGN KEY(book_id) REFERENCES BOOK(book_id),member_id int FOREIGN KEY(member_i' at line 1
mysql> create table book_issue(issue_id int PRIMARY KEY,date_issue date,book_id int, FOREIGN KEY(book_id) REFERENCES BOOK(book_id),member_id int, FOREIGN KEY(member_id) REFERENCES member(member_id),expected_date date);
Query OK, 0 rows affected (0.36 sec)

mysql> show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| AUTHOR            |
| BOOK              |
| book_author       |
| book_issue        |
| language          |
| late_feerule      |
| member            |
| publisher         |
+-------------------+
8 rows in set (0.00 sec)

mysql> create table book_return(issue_id int,actual_dateofreturn date,late_date int,late_fee int);
Query OK, 0 rows affected (0.25 sec)

mysql> ALTER TABLE book_return
    -> ADD FOREIGN KEY(issue_id)REFERENCES book_issue(issue_id);
Query OK, 0 rows affected (0.71 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| AUTHOR            |
| BOOK              |
| book_author       |
| book_issue        |
| book_return       |
| language          |
| late_feerule      |
| member            |
| publisher         |
+-------------------+
9 rows in set (0.00 sec)






mysql> DROP TABLE book_issue;
ERROR 1217 (23000): Cannot delete or update a parent row: a foreign key constraint fails
mysql> DROP TABLE late_feerule;
Query OK, 0 rows affected (0.14 sec)

mysql> show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| AUTHOR            |
| BOOK              |
| book_author       |
| book_issue        |
| book_return       |
| language          |
| member            |
| publisher         |
+-------------------+
8 rows in set (0.00 sec)

mysql> create table late_feerule(from_days int,to_days int,amount int,PRIMARY KEY(from_days,to_days,amount));
Query OK, 0 rows affected (0.28 sec)

mysql> drop table AUTHOR;
ERROR 1217 (23000): Cannot delete or update a parent row: a foreign key constraint fails
mysql> drop table book_return;
Query OK, 0 rows affected (0.17 sec)

mysql> show tables;
+-------------------+
| Tables_in_LIBRARY |
+-------------------+
| AUTHOR            |
| BOOK              |
| book_author       |
| book_issue        |
| language          |
| late_feerule      |
| member            |
| publisher         |
+-------------------+
8 rows in set (0.00 sec)




