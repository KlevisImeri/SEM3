	
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



## *Lab 4: SQL3*

|Field|Value|
|---|---|
|Name|Imeri Klevis|
|Neptun ID|T4XGKO|
|Exercise code|27-HALL-A|
|Name of instructor|Tatiana Barbova|
|Time of laboratory|2023-11-02 16:15|
|Location of laborator|R4P|
|User name|T4XGKO|
|Password|HelloDatabases1@?|
|Solved exercises|3.1, 3.2, 3.3, 3.4, 3.5, 3.6|

<div style="page-break-after: always;"></div>

## Solution of exercises
---

#### *exercise 3.1*
```sql
INSERT INTO STUDENTS
VALUES (
    67890, 
    'T4XGKO', 
    'Klevis Imeri', 
    'Oktogon',
    TO_DATE('2004-05-08', 'YYYY-MM-DD'),
    2022
);
```

- `INSERT INTO STUDENTS` specifies that you are inserting a new record into the "STUDENTS" table.

- `VALUES` is used to specify the values you want to insert. The values are enclosed within parentheses.

- `67890` is inserted into the "student_id" column. This value is the unique identifier for the new student.

- `'T4XGKO'` is inserted into the "neptuncode" column. 

- `'Klevis Imeri'` is inserted into the "student_name" column, which represents the full name of the student.

- `'Oktogon'` is inserted into the "address" column, representing the address of the student.

- `TO_DATE('2004-05-08', 'YYYY-MM-DD')` is used to insert a date value into the "birthdate" column. This date, '2004-05-08,' is formatted as 'YYYY-MM-DD' to match the date format specified in the TO_DATE function.

- `2022` is inserted into the "entranceyear" column, which indicates the year the student entered.

#### *exercise 3.2*
```sql
UPDATE subjects
SET lecturer = 'Keszthelyi Gábor', room = 'Q-I'
WHERE subjectname = 'PHP programming' AND neptuncode = 'VIPHPM01';
```

- `UPDATE subjects` specifies that you are updating the "subjects" table.

- `SET lecturer = 'Keszthelyi Gábor', room = 'Q-I'` indicates that you are updating two columns in the "subjects" table. You are setting the "lecturer" column to 'Keszthelyi Gábor' and the "room" column to 'Q-I' for the rows that meet the specified conditions.

- `WHERE subjectname = 'PHP programming' AND neptuncode = 'VIPHPM01'` is the condition that filters the rows that will be updated. It specifies that the update should only apply to rows where the "subjectname" is 'PHP programming' and the "neptuncode" is 'VIPHPM01'.

#### *exercise 3.3*
```sql
UPDATE ENROLLMENTS
SET examdate = ADD_MONTHS(examdate, 4*12)
WHERE firstenroll = 0 AND examdate < TO_DATE('2013-01-01', 'YYYY-MM-DD');
```

- `UPDATE ENROLLMENTS` specifies that you are updating the "ENROLLMENTS" table.

- `SET examdate = ADD_MONTHS(examdate, 4*12)` indicates that you are updating the "examdate" column. The `ADD_MONTHS` function is used to add a specified number of months to the current value in the "examdate" column. In this case, you are adding 4 times 12 months, which is equivalent to adding 4 years to the current "examdate."
- 
- `WHERE firstenroll = 0 AND examdate < TO_DATE('2013-01-01', 'YYYY-MM-DD')` is the condition that filters the rows that will be updated. It specifies that the update should only apply to rows where "firstenroll" is equal to 0 (indicating it's not the first enrollment) and where the "examdate" is earlier than January 1, 2013.

#### *exercise 3.4*

###### option 1
There are several options we can do:
```sql
UPDATE (
  SELECT e.examdate, e.firstenroll
  FROM ENROLLMENTS e, STUDENTS s
  WHERE e.student = s.student_id
        AND e.firstenroll = 1 
        AND s.entranceyear = 2008
) es
SET es.examdate = TO_DATE('2018-01-05', 'YYYY-MM-DD');
```

- The `UPDATE` statement includes a subquery that selects specific columns from the "ENROLLMENTS" table (aliased as "e") and the "STUDENTS" table (aliased as "s"). The subquery filters the rows based on the following conditions:
   - `e.student = s.student_id`: It joins the "ENROLLMENTS" and "STUDENTS" tables based on the "student" column in "ENROLLMENTS" and "student_id" in "STUDENTS."
   - `e.firstenroll = 1`: It selects only rows where "firstenroll" is equal to 1, indicating the first enrollment.
   - `s.entranceyear = 2008`: It further filters the rows by selecting only those with an "entranceyear" of 2008.

> The result of the subquery is a set of rows given an alias "es". When you update these rows you update the corresponding tables to the columns of the rows. So when you say `UPDATE TABLE` you are getting the pool or rows table and updated those rows.

- The main `UPDATE` statement sets the "examdate" column of the rows returned by the subquery to '2018-01-05' using the `TO_DATE` function.

###### option 2
```sql
UPDATE ENROLLMENTS
SET examdate =  TO_DATE('2018-01-05', 'YYYY-MM-DD') 
WHERE firstenroll = 1
	AND student IN (SELECT student_id
	                FROM STUDENTS
	                WHERE entranceyear = 2008);
```

The important part here is:
```sql
AND student IN (SELECT student_id FROM STUDENTS WHERE entranceyear = 2008);
```
- This second part of the `WHERE` clause filters the rows further. It checks if the "student" column in the "ENROLLMENTS" table is present in the result of the subquery. The subquery selects "student_id" from the "STUDENTS" table where the "entranceyear" is 2008. This means that the update will only apply to rows where the student is present in the list of students who entered in 2008.

#### *exercise 3.5*
```sql
DELETE FROM enrollments
WHERE enrollmentdate < TO_DATE('2010-01-01', 'YYYY-MM-DD');
```

- `DELETE FROM enrollments` specifies that you want to delete records from the "enrollments" table.
- `WHERE enrollmentdate < TO_DATE('2010-01-01', 'YYYY-MM-DD')` is the condition that determines which records will be deleted. This condition filters the rows in the "enrollments" table where the "enrollmentdate" is earlier than January 1, 2010. 


##### *exercise 3.6*
###### option 1
```sql
INSERT INTO enrollments
VALUES (
    12345,
    (SELECT subject_id FROM SUBJECTS WHERE neptuncode = 'TTTT0001'),
    (SELECT student_id FROM STUDENTS WHERE neptuncode = 'T4XGKO'),
    SYSDATE,
    1,
    'odd',
    TO_DATE('2023-12-19', 'YYYY-MM-DD')
);
```

- `INSERT INTO enrollemtns` specifies that you are inserting a new record into the "enrollments" table.

- `VALUES` is used to specify the values you want to insert into the columns of the "enrollments" table. The values are enclosed within parentheses.

- `12345` is inserted into the first column representing the "enrollment_id."

- `(SELECT subject_id FROM SUBJECTS WHERE neptuncode = 'TTTT0001')` is a subquery that retrieves the "subject_id" from the "SUBJECTS" table where the "neptuncode" is 'TTTT0001.' 

- `(SELECT student_id FROM STUDENTS WHERE neptuncode = 'T4XGKO')` is a subquery that retrieves the "student_id" from the "STUDENTS" table where the "neptuncode" is 'T4XGKO.' 
- 
- `SYSDATE` is used to insert the current date and time into the fourth column representing the current "enrollment_date."

- `1` is the indicator for "firstenroll."

- `'odd'` is the "parity."

- `TO_DATE('2023-12-19', 'YYYY-MM-DD')` is used to insert the examdate.


###### option 2
```sql
INSERT INTO enrollments (
    SELECT 
        12345,
        s.subject_id,
        st.student_id,
        SYSDATE,
        1,
        'odd',
        TO_DATE('2023-12-19', 'YYYY-MM-DD')
    FROM
        SUBJECTS s,
        STUDENTS st
    WHERE
        s.neptuncode = 'TTTT0001' AND st.neptuncode = 'T4XGKO'
);
```

- The subquery within parentheses specifies the values that you want to insert. It is selecting values for each column from different tables. Here's what's happening in the subquery:

  - `12345` is inserted into the first column, presumably representing the "enrollment_id."
  
  - `s.subject_id` selects the "subject_id" from the "SUBJECTS" table, based on the condition that the "neptuncode" in the "SUBJECTS" table is 'TTTT0001.' This value is inserted into the second column, which likely represents the "subject_id."

  - `st.student_id` selects the "student_id" from the "STUDENTS" table, based on the condition that the "neptuncode" in the "STUDENTS" table is 'T4XGKO.' This value is inserted into the third column, likely representing the "student_id."

  - `SYSDATE` inserts the current date and time into the fourth column, possibly representing the "enrollment_date."

  - `1` is inserted into the fifth column, which appears to be a flag or indicator for "firstenroll."

  - `'odd'` is inserted into the sixth column, potentially representing the "parity."

  - `TO_DATE('2023-12-19', 'YYYY-MM-DD')` is used to insert a specific date into the seventh column, likely representing the "examdate."

> What is interesting here is that you understand that the `VALUES` is creating a set of rows with onw row, but the `SELECT` can return several rows. In our case is only one but i can be many and if it is many the `INSERT INTO table_name` will insert all of them into the table.