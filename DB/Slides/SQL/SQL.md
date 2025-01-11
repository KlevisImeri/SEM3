TARGET DECK: SEM3::DB::SQL

## SQL language statements Groups #flashcard
- Data Definition Statement (DDS);
- Data Manipulation Statements (DMS);
- Queries; and
- Data Control Statements (DCS)
<!--ID: 1698715863609-->


## Data (Table) Definition Statements
##### Base Data Types #flashcard 
Some base data types are:
- CHAR(n): string of size n
- LONG: string of unlimited size
- NUMBER(p,s):
	- p: the number of digits total
	- s: how many of them are decimal
- DATE
<!--ID: 1698794492447-->
##### Create Table #flashcard
```SQL
CREATE TABLE cars (
    carID           INT         GENERATED ALWAYS AS IDENTITY                  PRIMARY KEY,
    serialNumber    INT         CONSTRAINT notUniqueSerialNumber UNIQUE       NOT NULL,
    manufacturer    VARCHAR(20) NOT NULL,
    model           VARCHAR(20) NOT NULL,
    CONSTRAINT nameOfConstrain CHECK (REGEXP_LIKE(serialNumber, '^[a-zA-Z0-9]+$'))
);
```
> You need at least 1 column 
- `REGEXP_LIKE` : Regular Expression Like
	- It checks the string is in accordance with the pattern.
<!--ID: 1698719097160-->


##### Delete Table #flashcard 
```SQL
DROP TABLE cars;
```
<!--ID: 1698716131128-->

##### Delete data from Table #flashcard
```SQL
DELETE FROM cars 
WHERE model = 'red';
```
> if you don't put `WHERE` all data is removed
<!--ID: 1698716678938-->

##### Modifying Data on Table #flashcard
```SQL
UPDATE cars 
SET manufacturer = 'Ferrari',
    model  = 'SuperRed'
WHERE serialNumber = '12124ABC';
```
<!--ID: 1698716678947-->



##### Insert Data #flashcard
```SQL
INSERT INTO cars (serialNumber, manufacturer, model)
VALUES ('12124ABC', 'Jaguar', 'red');
```
> if you want you can remove the columns if you can insert in the rows as they are listed in the Crete Table
<!--ID: 1698716678958-->

## Constrains and Comments
##### Constrains #flashcard
`PRIMARY KEY`:
- each row uniquely identified 
- unique and not null
- one primary key
`UNIQUE`:
- unique and can be null
- multiple unique can be used
`CHECK` condition:
- condition that must be for each row
`FOREIGN KEY` theRow `REFERENCES` tableName(referencedColumn):
- the referencedColumn should be `UNIQUE` or `PRIMARY KEY`
`DEFAULT` value:
- If nothing is inserted the `value` is used
`NOT NULL`:
- Ensures that null values cant be entered in this column
Giving names to constrains:
```SQL
CONSTRAINT nameOfConstrain conditionHere;
```
<!--ID: 1698716678967-->

##### Comments #flashcard
Comments in SQL:
```SQL
-- This is a single-line comment in SQL.
/* This is a multi-line comment in SQL.
You can add comments across multiple lines
within the comment block. */
```
<!--ID: 1698716678977-->

## Queries
##### Querying Generally #flashcard
```SQL
SELECT columnNames /*Result Table columns*/
FROM tableNames    /*Tables from witch the resutls are selected*/
WHERE conditons    /*Which rows to retrive*/
GROUP BY criteria  
ORDER BY criteria;
```
> `WHERE`, `GROUP BY`, `ORDER BY` are optional
<!--ID: 1698716678987-->


##### Projection(SELECT) #flashcard
```SQL
SELECT serialNumber, model FROM cars; /*Select those columns*/
SELECT * FROM cars;                   /*Select all of the columns*/
SELECT 100*CARID, model FROM cars;    /*Using arithmetic expression*/
```
> The `SELECT` can result in identical lines they can be removed using the `DISTINCT` 
> Example many cars can have the same manufacturer
```SQL
SELECT DISTINCT manufacturer FROM cars;
```
`As` keyword:
```SQL
SELECT 100*CARID AS CARID00, model AS Color FROM cars;    /*Naming the rows of the Result Table*/
```
Question:
Why is `AS` not working ins SQL developer?
<!--ID: 1698716678994-->

##### Restrictions(WHERE) #flashcard
```SQL
WHERE predicate 
```
Predicate can have:
- `literals`:
	 - numbers
	 - string
	 - dates 
	 - column names
- `operators`:
	- for numbers:
		 - arithmetic operators (+, -, \*, /)
		 - arithmetic functions `WHERE ABS(balance) < 1000`
	- for strings:
		- `SUBSTR()`: `WHERE SUBSTR(product_name, 1, 3) = 'ABC'`
		- `INSTR()`: `WHERE INSTR(description, 'important') > 0` 
			- It returns the position (index) of the first occurrence of a specified substring within a given string.
			- If the substring is not found, it returns 0.
		- `UPPER()`: `WHERE UPPER(last_name) = 'SMITH'`
		- `LOWER()`: `WHERE LOWER(city) = 'new york'`
		- `SOUNDEX()`: `WHERE SOUNDEX(name) = SOUNDEX('John')`
			- It converts a string into a phonetic code (a four-character code) based on its pronunciation.
			- Find words that sound similar even if they are spelled differently.
	- for dates:
		- + -  `WHERE order_date + 7 <= NOW()`
		- conversions `WHERE order_date + 7 <= NOW()`
	- for evaluating:
		- <, <=, =, !=, >=, >;
		- BEEWEEN ... AND ... `WHERE ABS(balance) < 1000`
		- IS NULL, IS NOT NULL;
		- IN set;
		- LIKE pattern `WHERE email LIKE '%@gmail.com'`
			- % every string
			- _ only on char
		- AND OR NOT
- `functions`:
	- `NVL(columnName,value)`: if NULL you just take the value 
	- `DECODE(expression, search_value, result1, search_value2, result2, ..., default_result)`: 
		- for each `search_value` $\in$ `expression` you assign a new value
		- if there is a value in expression no covered than you use the defaut
		- Find the example [[#Decode|here]] 
- `sets`:
	- (10,20,30)
	- `WHERE department IN ('Sales','Marketing','Support')``
- `Nested Queries`:
	- WHERE (SELECT ... FROM ...)
<!--ID: 1698715863624-->





##### Join #flashcard
Inner Join
```SQL
SELECT A.column1 , B.*  /*Projection of the columns*/
FROM A, B               /*The tables taking part on join*/
WHERE A.ID = B.ID;      /*The inner Join predicate*/
```
> If their is no matching than the joined table doesn't contain the result
Outer Join
```SQL
SELECT A.column1 , B.*  
FROM  cars A, tractors B   /*Giving tables local names*/
WHERE A.ID = B.ID(+);      /*The outer Join predicate*/
```
> You get all the entries in A and there matching correspondence in B
> In another words you are adding B to A
> Notice the local names.
<!--ID: 1698715863630-->




##### Aggregate Functions #flashcard
f: `returnTable.column` -> `oneSingleValue`
- `AVG()`: average value for numbers
- `SUM()`: total of numeric column
- `COUNT()`:  number of rows in column or COUNT(\*) for the return table 
- `MAX()`:  select the highest value for column
- `MIN()`: select the lowest value for column
> IF result contains `aggregate functoins` and `constants` than is okay but if a column with many rows is introduced than the programmer should group 
Bad:
```SQL
SELECT COUNT(*), descrip FROM product;
=========================================
SELECT startdate, AVG(stdprice) FROM price
WHERE startdate = '01-jan-94';
```
Good:
```SQL
SELECT startdate, AVG(stdprice) FROM price
WHERE startdate = '01-jan-94'
GROUP BY startdate
```
<!--ID: 1698715863636-->




##### Nested Queries (Subquery) #flashcard
Generally
```SQL
SELECT ... FROM ...
WHERE ... (
	SELECT ... FROM ...
	WHERE ...
);
```
or
```SQL
SELECT ... 
FROM ... (
	SELECT ... FROM ...
	WHERE ...
);
WHERE ... 
```
<!--ID: 1698715863643-->



Questions:
```SQL
SELECT prodid, descrip FROM product
WHERE prodid IN (
	SELECT prodid FROM price
	WHERE startdate >= '01-jan-94'
)
```
The `prodid` is a row and not a set when I do the query i get a repeating values:

|prodid|
|------|
|1|
|2|
|3|
|2|


##### Grouping #flashcard
Effective when you have aggregate functions. You can apply those functions to specific group.
Lets suppose you have all the students and they are in different years. You want to find the average grade every year. So what you do is
```SQL
SELECT yearOfStudies, AVG(grade) 
FROM students
GROUP BY yearOfStudies;
```
> you can only have one column and the aggregate functions applied to it
If you only want first and second years than: 
```SQL
SELECT yearOfStudies As year, AVG(grade) 
FROM students
GROUP BY yearOfStudies
HAVING year<=2;
```
> If you can use `WHERE` but sometimes you may have to use `HAVING`.
> Here we can use `WHERE` because the `year<=2` does not have condition related to an aggregation.
> So we use `HAVING` when we have a condition related to aggregation
<!--ID: 1698717823614-->


Better example: Filters years where the average is greater than 3
```SQL
SELECT yearOfStudies As year, AVG(grade) AS avg
FROM students
GROUP BY yearOfStudies
HAVING avg>3;
```
<!--ID: 1698717431007-->




##### Ordering #flashcard
```SQL
SELECT ... FROM ...
ORDER BY column order, column order...;
```
`Order` can be:
- `ASC`: default
- `DESC`
<!--ID: 1698715863655-->



##### Set Operations #flashcard
> The return Table from the `SELECT` can be considered as a set.
> Therefor the set operations can only be between 2 `SELECT` statements.
- `UNION` 
- `INTERSECT`
- `MINUS`
- `IN`
<!--ID: 1698715863661-->





##### Hierarchical relationship query #flashcard
```SQL
SELECT name, parentID, childID
FROM tableName
CONNECT BY PRIOR parentID = childID  /*A recurisive call*/
START WITH name='SuperParent';       /*If you use the super parent it lists everything */
```
<!--ID: 1698715863667-->











## Indexes

##### Creating indexes #flashcard 
```SQL
CREATE INDEX name
ON tableName (column1,...)
```
<!--ID: 1698791061335-->

[if you want to know why we need the multicolumn indexes](https://dataschool.com/sql-optimization/multicolumn-indexes/)

What do you do if you want to ensure that the you cant insert two diff values in the column using the index you are creating? What if the table already had double records on that column? #flashcard 
```SQL
CREATE UNIQUE INDEX name
ON tableName (column1,...);
```
You would ***not*** be able to create a unique index in a table with double records on that table
<!--ID: 1698791455805-->

##### Deleting indexes #flashcard 
```SQL
DROP INDEX name;
```
<!--ID: 1698791512227-->

## Assigning privileges

##### Granting roles #flashcard 
```SQL
GRANT role
TO user1,...
INDENTIFIED BY password1,...
```
<!--ID: 1698792230975-->

What can the roles be in the `GRANT`? #flashcard 
- DBA: edit everyone’s 'data'
- RESOURCES: edit his own data only
- CONNECT: only logon
<!--ID: 1698792421843-->

##### Granting privileges to objects #flashcard 
```SQL
GRANT privilege1, ...
ON object               /*It can be table or view*/
TO user
```
<!--ID: 1698793316449-->


What are the possible privileges?
Which of these privileges can not be assign to views and why? #flashcard 
- ALL
- SELECT
- INSERT
- UPDATE column, ...
- DELETE
- ALTER
- INDEX
The `ALTER` and `INDEX` can not be assigned to views because:
	- views are virtual tables:
		- derived from queries 
		- they do not contain data -> no `ALTER` no `INDEX`
		- you can only alter and index real data
		
<!--ID: 1698793316458-->


What would you do if you want to give privilege to a user so he can grant the same privileges to someone else? #flashcard 
```SQL
GRANT privilege1, ...
ON object
TO user
WITH GRANT OPTION     /*You should use this*/
```
<!--ID: 1698793316465-->

## Modifying Table definitions #flashcard 
Adding
```SQL
ALTER TABLE table_name
ADD column_name dataType
```
Modifying 
```SQL
ALTER TABLE name
MODIFY column_to_modify dataType
```
Deleting
```sql
ALTER TABLE table_name
DROP COLUMN column_to_delete;
```
<!--ID: 1698794190920-->

## Transactions

What are transactions? #flashcard 
- A collection of SQL statements treated ad a unit of work.
<!--ID: 1698795346304-->


##### Syntax of `COMMIT` and `ROLLBACK` #flashcard 
```sql
DELETE from Students where name = 'Nagy Anna';
COMMIT;
```

```sql
DELETE from Students where name = 'Nagy Anna';
ROLLBACK;
```

```sql
/*This cant give Anna back to you*/
DELETE from Students where name = 'Nagy Anna'; 
COMMIT;
ROLLBACK;
```
<!--ID: 1698795346312-->

##### Automatic Commits #flashcard 
```SQL
SET AUTOMATIC [ON | OFF]
```
- `ON`: then everything is commited automatically 
- `OFF`: then only
	- ALTER
	- CREATE
	- DROP
	- GRANT
	- EXIT
	- => you can't roll them back
<!--ID: 1698796046713-->



## Concurrent Accesses

What is the syntax of locking tables?
What are the types of lockmodes are there?
What does NO WAIT do? #flashcard 
```SQL
LOCK TABLE table1, ...
IN [SHARE | SHARED UPDATE | EXCLUSIVE ]
MODE [NO WAIT];
```
- `SHARE`: 
	- read many users
	- no write
- `SHARE UPDATE`: 
	- read and write many users
	- lock on the rows (write)
- `EXCLUSIVE `:
	- read write only one user
The `NO WAIT` makes database give you (user) the control immediately.
<!--ID: 1698798273340-->




## Footer
##### Decode: 
``` SQL
SELECT
    DECODE(STUDENT_CODE, 'S001', 'Beni', 'S002', 'Klevis', 'S003', 'Sara', 'NoOne') AS code,
    AVG(BEGINNING_YEAR_OF_STUDIES) AS avg_beginning_year
FROM
    STUDENTS 
GROUP BY
    STUDENT_CODE
ORDER BY
    avg_beginning_year DESC
```








































