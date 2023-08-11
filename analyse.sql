--CREATION OF THE DATABASE:
CREATE DATABASE analyse;

--CREATE A NEW USER FOR THE DATABASE
CREATE USER 'user'@'localhost';
GRANT ALL PRIVILEGES ON analyse.* TO 'user'@'localhost' IDENTIFIED BY 'password';

--CONNECT TO THE DATABASE WITH THE NEW CREATED USER
mysql -uuser -ppassword  

use analyse;

--CREATE THE STUDENT TABLE

CREATE TABLE student_data (
    school VARCHAR(2),
    sex CHAR(1),
    age INT,
    address CHAR(1),
    famsize CHAR(3),
    Pstatus CHAR(1),
    Medu INT,
    Fedu INT,
    Mjob VARCHAR(15),
    Fjob VARCHAR(15),
    reason VARCHAR(10),
    guardian VARCHAR(10),
    traveltime INT,
    studytime INT,
    failures INT,
    schoolsup TINYINT(1),
    famsup TINYINT(1),
    paid TINYINT(1),
    activities TINYINT(1),
    nursery TINYINT(1),
    higher TINYINT(1),
    internet TINYINT(1),
    romantic TINYINT(1),
    famrel INT,
    freetime INT,
    goout INT,
    Dalc INT,
    Walc INT,
    health INT,
    absences INT
);

-- LOAD THE DATA FROM THE CSV FILE TO OUR MYSQL DATABASE

LOAD DATA INFILE 'C:/Users/Toto/Downloads/Maths.csv'
INTO TABLE student_data
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

--SHOW THE FIRST FIVE ROWS OF OUR DATASET
SELECT count(*) "Total of student"
FROM student_data;

+------------------+
| Total of student |
+------------------+
|              395 |
+------------------+


--NOMBER OF STUDENTS BY SHCOOL
SELECT school, COUNT(*) "Nomber of Students By school"
FROM student_data
GROUP BY school;

+--------+------------------------------+
| school | Nomber of Students By school |
+--------+------------------------------+
| GP     |                          349 |
| MS     |                           46 |
+--------+------------------------------+

--NOMBER OF STUDENT BY SEX
SELECT sex, COUNT(*) "Nomber of Students By sex"
FROM student_data
GROUP BY sex;

+------+---------------------------+
| sex  | Nomber of Students By sex |
+------+---------------------------+
| F    |                       208 |
| M    |                       187 |
+------+---------------------------+


--HOW MANY STUDENT LIVES IN URBAN AREA OR RURAL ?
SELECT address, COUNT(*) "Nomber of Students By Area"
FROM student_data
GROUP BY address;

+---------+---------------------------+
| address | Nomber of Students By Area|
+---------+---------------------------+
| R       |                        88 |
| U       |                       307 |
+---------+---------------------------+

--SHOW ME THE NOMBER OF STUDENT BY FAMILY SIZE
SELECT famsize, COUNT(*) "Nomber of Students By family size"
FROM student_data
GROUP BY famsize;

+---------+-----------------------------------+
| famsize | Nomber of Students By family size |
+---------+-----------------------------------+
| GT3     |                               281 |
| LE3     |                               114 |
+---------+-----------------------------------+


--nomber of student with parent's cohabitation status,
SELECT Pstatus, COUNT(*) "parent\'s cohabitation status"
FROM student_data
GROUP BY Pstatus;

+---------+------------------------------+
| Pstatus | parents cohabitation status  |
+---------+------------------------------+
| A       |                           41 |
| T       |                          354 |
+---------+------------------------------+

--MOTHER AND FATHER EDUCATION 
SELECT Medu,Fedu, COUNT(*) "Nomber of students by parents education"
FROM student_data
GROUP BY Medu,Fedu
ORDER BY 3;

+------+------+-----------------------------------------+
| Medu | Fedu | Nomber of students by parents education |
+------+------+-----------------------------------------+
|    4 |    0 |                                       1 |
|    0 |    1 |                                       1 |
|    1 |    0 |                                       1 |
|    4 |    1 |                                       1 |
|    1 |    4 |                                       1 |
|    0 |    2 |                                       2 |
|    1 |    3 |                                       5 |
|    2 |    4 |                                       7 |
|    3 |    1 |                                      15 |
|    1 |    2 |                                      15 |
|    2 |    3 |                                      17 |
|    3 |    4 |                                      18 |
|    4 |    2 |                                      19 |
|    3 |    2 |                                      28 |
|    2 |    1 |                                      28 |
|    1 |    1 |                                      37 |
|    3 |    3 |                                      38 |
|    4 |    3 |                                      40 |
|    2 |    2 |                                      51 |
|    4 |    4 |                                      70 |
+------+------+-----------------------------------------+





