 Delimiter &&
mysql> create procedure delete (IN p_id INT)
    -> delete from Book_Return
    -> where Issue_id=p_id;
    -> end &&
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'delete (IN p_id INT)
delete from Book_Return
where Issue_id=p_id;
end' at line 1
mysql> create procedure delete1(IN p INT)  BEGIN delete from Book_Return  where Issue_id=p; end&&
Query OK, 0 rows affected (0.01 sec)

mysql> call delete1(4);
    -> &&
Query OK, 1 row affected (0.04 sec)

mysql> select * from Book_Return;
    -> &&
+----------+-----------------------+-----------+----------+
| Issue_id | Actual_date_of_return | late_days | late_fee |
+----------+-----------------------+-----------+----------+
|        3 | 2020-05-09            |        23 |      100 |
|        2 | 2020-04-07            |         3 |      200 |
|        5 | 2020-08-09            |        10 |       20 |
|        6 | 2020-07-10            |        30 |      210 |
+----------+-----------------------+-----------+----------+
4 rows in set (0.00 sec)
