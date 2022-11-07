 show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| 44_Library         |
| COLLEGE            |
| Company            |
| LIBRARY            |
| Library            |
| Library1           |
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
| library            |
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
28 rows in set (0.14 sec)

mysql> select * from author;
ERROR 1046 (3D000): No database selected
mysql> use library;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------+
| Tables_in_library |
+-------------------+
| authors           |
| book_author       |
| books             |
| languages         |
| publishers        |
+-------------------+
5 rows in set (0.00 sec)

mysql> select * from authors;
+-----------+-----------------+---------------------------------+----------+--------+
| author_id | name            | email                           | phone_no | status |
+-----------+-----------------+---------------------------------+----------+--------+
|         1 | Richard Dawkins | mediacontact@richarddawkins.net |   716636 |      1 |
|         2 | Roger Penrose   | rouse@maths.ox.ac.uk            |   233576 |      1 |
+-----------+-----------------+---------------------------------+----------+--------+
2 rows in set (0.00 sec)

mysql> desc books;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| book_id        | int(11)     | NO   | PRI | NULL    |       |
| title          | varchar(25) | YES  |     | NULL    |       |
| lang_id        | int(11)     | YES  |     | NULL    |       |
| mrp            | int(11)     | YES  |     | NULL    |       |
| publisher_id   | int(11)     | YES  |     | NULL    |       |
| published_date | int(11)     | YES  |     | NULL    |       |
| volume         | int(11)     | YES  |     | NULL    |       |
| status         | int(11)     | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> insert into authors values(4,"amal","amal@gmail.com",34445555,6);
Query OK, 1 row affected (0.05 sec)

mysql> insert into authors values(3,"akhill","akhill@gmail.com",432332,3);
Query OK, 1 row affected (0.05 sec)

mysql> insert into authors values(8,"achu","achu@gmail.com",44656565,8);
Query OK, 1 row affected (0.04 sec)

mysql> insert into books values(2,"mysql",33,444 from author where name="amal",66,2002-12-23,33,"done");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from author where name="amal",66,2002-12-23,33,"done")' at line 1
mysql> insert into books values(2,"mysql",33,444,66,2002-12-23,33,"done");
ERROR 1366 (HY000): Incorrect integer value: 'done' for column 'status' at row 1
mysql> insert into books values(2,"mysql",33,444,66,2002-12-23,33,12);
ERROR 1062 (23000): Duplicate entry '2' for key 'PRIMARY'
mysql> select * from books;
+---------+-----------------------+---------+------+--------------+----------------+--------+--------+
| book_id | title                 | lang_id | mrp  | publisher_id | published_date | volume | status |
+---------+-----------------------+---------+------+--------------+----------------+--------+--------+
|       1 | The Selfish Gene      |       1 |  500 |            1 |           1976 |      1 |      1 |
|       2 | Ancestors Tale        |       1 |  600 |            2 |           2004 |      1 |      1 |
|       3 | The God Delusion      |       1 |  300 |            3 |           2006 |      1 |      1 |
|       4 | The Emperors New Mind |       1 |  500 |            1 |           1998 |      1 |      1 |
|       5 | Cycles of Time        |       1 |  500 |            4 |           2011 |      1 |      1 |
+---------+-----------------------+---------+------+--------------+----------------+--------+--------+
5 rows in set (0.00 sec)

mysql> select count(*) from authors where name="amal";
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.01 sec)

mysql> select * from authors;
+-----------+-----------------+---------------------------------+----------+--------+
| author_id | name            | email                           | phone_no | status |
+-----------+-----------------+---------------------------------+----------+--------+
|         1 | Richard Dawkins | mediacontact@richarddawkins.net |   716636 |      1 |
|         2 | Roger Penrose   | rouse@maths.ox.ac.uk            |   233576 |      1 |
|         3 | akhill          | akhill@gmail.com                |   432332 |      3 |
|         4 | amal            | amal@gmail.com                  | 34445555 |      6 |
|         8 | achu            | achu@gmail.com                  | 44656565 |      8 |
+-----------+-----------------+---------------------------------+----------+--------+
5 rows in set (0.00 sec)

mysql> select count(*) from authors where name="Richard Dawkins";
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

mysql> select count(*) from books where name="Richard Dawkins";
ERROR 1054 (42S22): Unknown column 'name' in 'where clause'
mysql> select count(*) from books where status=1;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

mysql>  SELECT author.name, COUNT(*) AS 'number of books'
    ->     -> FROM author, book
    ->     -> WHERE author.a_id = book.a_id
    ->     -> GROUP BY author.name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> FROM author, book
    -> WHERE author.a_id = book.a_id
    -> GROUP BY author' at line 2
mysql> SELECT authors.name, COUNT(*) AS 'number of books' FROM authors, book WHERE author.status = book.status GROUP BY authors.name; 
ERROR 1146 (42S02): Table 'library.book' doesn't exist
mysql> SELECT authors.name, COUNT(*) AS 'number of books' FROM authors, books WHERE author.status = books.status GROUP BY authors.name;
ERROR 1054 (42S22): Unknown column 'author.status' in 'where clause'
mysql> SELECT authors.name, COUNT(*) AS 'number of books' FROM authors, books WHERE authors.status = books.status GROUP BY authors.name;
+-----------------+-----------------+
| name            | number of books |
+-----------------+-----------------+
| Richard Dawkins |               5 |
| Roger Penrose   |               5 |
+-----------------+-----------------+
2 rows in set (0.00 sec)

mysql> alter table authors update column status where book_id=2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'update column status where book_id=2' at line 1
mysql> alter table authors modify status int;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from authors;
+-----------+-----------------+---------------------------------+----------+--------+
| author_id | name            | email                           | phone_no | status |
+-----------+-----------------+---------------------------------+----------+--------+
|         1 | Richard Dawkins | mediacontact@richarddawkins.net |   716636 |      1 |
|         2 | Roger Penrose   | rouse@maths.ox.ac.uk            |   233576 |      1 |
|         3 | akhill          | akhill@gmail.com                |   432332 |      3 |
|         4 | amal            | amal@gmail.com                  | 34445555 |      6 |
|         8 | achu            | achu@gmail.com                  | 44656565 |      8 |
+-----------+-----------------+---------------------------------+----------+--------+
5 rows in set (0.00 sec)

mysql> alter table authors modify status=2 where author_id=3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '=2 where author_id=3' at line 1
mysql> alter table authors modify status int where author_id=3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where author_id=3' at line 1
mysql> insert into table books values(7,"HTML",444,231,88,1983,5,2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table books values(7,"HTML",444,231,88,1983,5,2)' at line 1
mysql> insert into table books values(7,"HTML",444,231,88,1983,5,"2");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table books values(7,"HTML",444,231,88,1983,5,"2")' at line 1
mysql> DESC BOOKS;
ERROR 1146 (42S02): Table 'library.BOOKS' doesn't exist
mysql> desc books;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| book_id        | int(11)     | NO   | PRI | NULL    |       |
| title          | varchar(25) | YES  |     | NULL    |       |
| lang_id        | int(11)     | YES  |     | NULL    |       |
| mrp            | int(11)     | YES  |     | NULL    |       |
| publisher_id   | int(11)     | YES  |     | NULL    |       |
| published_date | int(11)     | YES  |     | NULL    |       |
| volume         | int(11)     | YES  |     | NULL    |       |
| status         | int(11)     | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> insert into table books values(7,'HTML',444,231,88,1983,5,"2");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table books values(7,'HTML',444,231,88,1983,5,"2")' at line 1
mysql> insert into table books values(7,'HTML',444,231,88,1983,5,2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table books values(7,'HTML',444,231,88,1983,5,2)' at line 1
mysql> insert into table books values(7,'HTML',444,231,88,1983,5,2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table books values(7,'HTML',444,231,88,1983,5,2)' at line 1
mysql> insert into  books values(7,'HTML',444,231,88,1983,5,2);
Query OK, 1 row affected (0.05 sec)

mysql> insert into  books values(10,'java',444,230,88,1973,6,3);
Query OK, 1 row affected (0.05 sec)

mysql> insert into  books values(20,'css',444,230,88,1978,6,8);
Query OK, 1 row affected (0.05 sec)

mysql> insert into  books values(10,'node',444,230,88,1979,6,3);
ERROR 1062 (23000): Duplicate entry '10' for key 'PRIMARY'
mysql> insert into  books values(22,'node',444,230,88,1979,5,3);
Query OK, 1 row affected (0.04 sec)

mysql> SELECT authors.name, COUNT(*) AS 'number of books' FROM authors, book WHERE author.status = book.status GROUP BY authors.name;
ERROR 1146 (42S02): Table 'library.book' doesn't exist
mysql> SELECT authors.name, COUNT(*) AS 'number of books' FROM authors, books WHERE authors.status = book.status GROUP BY authors.name;
ERROR 1054 (42S22): Unknown column 'book.status' in 'where clause'
mysql> SELECT authors.name, COUNT(*) AS 'number of books' FROM authors, books WHERE authors.status = books.status GROUP BY authors.name;
+-----------------+-----------------+
| name            | number of books |
+-----------------+-----------------+
| achu            |               1 |
| akhill          |               2 |
| Richard Dawkins |               5 |
| Roger Penrose   |               5 |
+-----------------+-----------------+
4 rows in set (0.00 sec)







select * from authors;
+-----------+-----------------+---------------------------------+----------+--------+
| author_id | name            | email                           | phone_no | status |
+-----------+-----------------+---------------------------------+----------+--------+
|         1 | Richard Dawkins | mediacontact@richarddawkins.net |   716636 |      1 |
|         2 | Roger Penrose   | rouse@maths.ox.ac.uk            |   233576 |      1 |
|         3 | akhill          | akhill@gmail.com                |   432332 |      3 |
|         4 | amal            | amal@gmail.com                  | 34445555 |      6 |
|         8 | achu            | achu@gmail.com                  | 44656565 |      8 |
+-----------+-----------------+---------------------------------+----------+--------+
5 rows in set (0.00 sec)

mysql> select * from book_author;
+---------+-----------+
| book_id | author_id |
+---------+-----------+
|       1 |         1 |
|       2 |         1 |
|       3 |         1 |
|       4 |         2 |
|       5 |         2 |
+---------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT authors.name, COUNT(*) AS 'number of books' FROM authors, book-author WHERE authors.author_id=book_author.author_id GROUP BY publishers.name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-author WHERE authors.author_id=book_author.author_id GROUP BY publishers.name' at line 1
mysql> SELECT authors.name, COUNT(*) AS 'number of books' FROM authors, book_author WHERE authors.author_id=book_author.author_id GROUP BY publishers.name;
ERROR 1054 (42S22): Unknown column 'publishers.name' in 'group statement'
mysql> SELECT authors.name, COUNT(*) AS 'number of books' FROM authors, book_author WHERE authors.author_id=book_author.author_id GROUP BY authors.name;
+-----------------+-----------------+
| name            | number of books |
+-----------------+-----------------+
| Richard Dawkins |               3 |
| Roger Penrose   |               2 |
+-----------------+-----------------+
2 rows in set (0.00 sec)

