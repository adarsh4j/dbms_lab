 select * from Book_Issue;
+----------+---------+-----------+-------------------------+----------+
| Issue_id | Book_id | Member_id | Expected_date_of_return | status   |
+----------+---------+-----------+-------------------------+----------+
|        2 |       5 |         7 | 2020-03-12              | Returned |
|        3 |       6 |         8 | 2020-04-02              | NR       |
|        4 |       7 |         9 | 2020-05-09              | NR       |
|        5 |       8 |        10 | 2020-06-05              | NR       |
|        6 |       9 |        11 | 2020-04-08              | Returned |
+----------+---------+-----------+-------------------------+----------+
5 rows in set (0.00 sec)

 select * from BOOK;                                                                                                                    +---------+------------+-------------+------+--------------+----------------+--------+--------------+
| Book_id | Title      | Language_id | MRP  | Publisher_id | Published_date | Volume | Status       |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
|       4 | DATA BASE  |           6 |  250 |            3 | 2005-10-03     |      1 | Returned     |
|       5 | C PROGRAM  |           5 |  300 |            2 | 2000-10-21     |      3 | Returned     |
|       6 | CHERUKADHA |           3 |  150 |            4 | 2010-07-30     |      1 | Not Returned |
|       8 | JAVA       |           5 |  200 |            1 | 2010-02-10     |      2 | Not Returned |
+---------+------------+-------------+------+--------------+----------------+--------+--------------+
4 rows in set (0.00 sec)


create view available as select Title from BOOK where title not in(select Title from BOOK,Book_Issue where BOOK.Book_id=Book_Issue.Book_id and Book_Issue.status="NR");
Query OK, 0 rows affected (0.03 sec)

mysql> select * from available;
+-----------+
| Title     |
+-----------+
| DATA BASE |
| C PROGRAM |
+-----------+

