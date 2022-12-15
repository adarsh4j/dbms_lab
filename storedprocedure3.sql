create table city(city_name varchar(10),postal_code int primary key not null,state varchar(20));
Query OK, 0 rows affected (0.05 sec)

mysql> desc city;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| city_name   | varchar(10) | YES  |     | NULL    |       |
| postal_code | int         | NO   | PRI | NULL    |       |
| state       | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> create table employee(emp_id int primary key not null,f_name varchar(20),l_name varchar(20),email_id varchar(20),phone_no int,hire_date date,salary int,postal_code int );
Query OK, 0 rows affected (0.03 sec)

mysql> Alter table employee ADD FOREIGN KEY(postal_code) REFERENCES city(posta_code);
ERROR 3734 (HY000): Failed to add the foreign key constraint. Missing column 'posta_code' for constraint 'employee_ibfk_1' in the referenced table 'city'
mysql> Alter table employee ADD FOREIGN KEY(postal_code) REFERENCES city(postal_code);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

create table department(manager_id int,dept_name varchar(20) primary key not null,foreign key(manager_id)references employee(emp_id));
Query OK, 0 rows affected (0.05 sec)

mysql> desc department;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| manager_id | int         | YES  | MUL | NULL    |       |
| dept_name  | varchar(20) | NO   | PRI | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> insert into city values('kulanada',689503,'kerala');
Query OK, 1 row affected (0.01 sec)

mysql> insert into city values('kaipuzha',689506,'kerala');
Query OK, 1 row affected (0.01 sec)
mysql> insert into city values('Thatta',689367,'kerala');
Query OK, 1 row affected (0.02 sec)

mysql> insert into city values('Thumbon',689309,'kerala');
Query OK, 1 row affected (0.01 sec)

mysql> select * from city;
+-----------+-------------+--------+
| city_name | postal_code | state  |
+-----------+-------------+--------+
| Thumbon   |      689309 | kerala |
| Thatta    |      689367 | kerala |
| kulanada  |      689503 | kerala |
| kaipuzha  |      689506 | kerala |
+-----------+-------------+--------+
4 rows in set (0.00 sec)

mysql> insert into employee values(110,'Adarsh ','J','adarsh123@gmail.com',946578392,'2002-09-23',10000,689367);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values(111,'Manu ','s','manu123@gmail.com',946078392,'2002-04-13',20000,689503);
Query OK, 1 row affected (0.02 sec)

mysql> insert into employee values(111,'Ashwin ','R','ashwin123@gmail.com',9460787692,'2002-09-13',20000,689506);
ERROR 1264 (22003): Out of range value for column 'phone_no' at row 1
mysql> insert into employee values(111,'Ashwin ','R','ashwin123@gmail.com',94607876,'2002-09-13',40000,689506);
ERROR 1062 (23000): Duplicate entry '111' for key 'employee.PRIMARY'
mysql> insert into employee values(11,'Ashwin ','R','ashwin123@gmail.com',94607876,'2002-09-13',40000,689506);
Query OK, 1 row affected (0.01 sec)

mysql> select *from employees;
ERROR 1146 (42S02): Table 'employees.employees' doesn't exist
mysql> select *from employee;
+--------+---------+--------+---------------------+-----------+------------+--------+-------------+
| emp_id | f_name  | l_name | email_id            | phone_no  | hire_date  | salary | postal_code |
+--------+---------+--------+---------------------+-----------+------------+--------+-------------+
|     11 | Ashwin  | R      | ashwin123@gmail.com |  94607876 | 2002-09-13 |  40000 |      689506 |
|    110 | Adarsh  | J      | adarsh123@gmail.com | 946578392 | 2002-09-23 |  10000 |      689367 |
|    111 | Manu    | s      | manu123@gmail.com   | 946078392 | 2002-04-13 |  20000 |      689503 |
+--------+---------+--------+---------------------+-----------+------------+--------+-------------+
3 rows in set (0.00 sec)

mysql> set foreign_key_checks=0;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into department values(119,'science');
Query OK, 1 row affected (0.01 sec)

mysql> insert into department values(200,'scology');
Query OK, 1 row affected (0.02 sec)

mysql> insert into department values(300,'Mathematics');
Query OK, 1 row affected (0.02 sec)

mysql> insert into department values(309,'MSS');
Query OK, 1 row affected (0.01 sec)

mysql> select * from department;
+------------+-------------+
| manager_id | dept_name   |
+------------+-------------+
|        119 | science     |
|        200 | scology     |
|        300 | Mathematics |
|        309 | MSS         |
+------------+-------------+
4 rows in set (0.00 sec)

       ----------------------------------------

CREATE A PROCEDURE TO COUNT THE NUMBER OF EMPLOYEES WITH FOLLOWING CONDITION
SALARY<20000
SALARY>20000
SALARY=20000
 
 --------------------------------------------------

mysql> delimiter &&
mysql> create procedure salary1(in sal int,in p int)
    -> begin
    -> if var=1 then
    -> select count(*) from employee where salary>sal;
    -> elseif var=2 then
    -> select count(*) from employee where salary<sal;
    -> elseif var=3 then
    -> select count(*) from employee where salary=sal;
    -> end if;
    -> end &&
Query OK, 0 rows affected (0.02 sec)


mysql> call salary2(40000,1);
    -> &&
+----------+
| count(*) |
+----------+
|        0 |
+----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call salary2(40000,2);
    -> &&
+----------+
| count(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> call salary2(40000,3);
    -> &&
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> 


Query OK, 0 rows affected (0.00 sec)
   --------------------------------------------

WRITE A PROCEDURE TO ACCEPT EMPLOYEE_NO AND CALCULATE THE BONUS AS PER THE FOLLOWING INSTRUCTIONS 

<15000        20% OF SALARY
15001-40000   15% OF SALARY
40001-80000   20% OF SALARY
>80001        20% OF SALARY

     -------------------------------------------

mysql> create procedure bonus(in e int)
    -> begin
    -> declare sal int;
    -> select salary from employee where emp_id = e into sal;
    -> if(sal<=15000) then
    -> select (0.2*sal);
    -> elseif(sal>15001 and sal<=40000)
    -> then select(0.15*sal);
    -> elseif(sal>40000and sal<=80000)
    -> then select(0.1*sal);
    -> elseif(sal>80001)
    -> then select(0.05*sal);
    -> end if;
    -> end &&
Query OK, 0 rows affected (0.01 sec)

mysql> call bonus(110);
    -> &&
+-----------+
| (0.2*sal) |
+-----------+
|    2000.0 |
+-----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
