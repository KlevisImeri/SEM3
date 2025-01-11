	
<br>
<br>
<br>
<br>
<br>
<br>
<br>


## *Lab 2: SQL1*
## Task:'Electronic registration system'


| Field                | Value              |
|----------------------|--------------------|
| Name                 | Imeri Klevis       |
| Neptun ID            | T4XGKO             |
| Exercise code        | 27-HALL-A          |
| Name of instructor   | Tatiana Barbova    |
| Time of laboratory   | 2023-10-05 16:15   |
| Location of laborator| R4P                |
| User name            | T4XGKO             |
| Password             | HelloDatabases1@?  |
| Solved exercises     | 1, 2, 3            |

<div style="page-break-after: always;"></div>

## Solution of exercises
---
#### *exercise 1*
![[Pasted image 20231007121117.png]]

###### Design choices for the ER diagram
- There could have been a `COURSES` entity set and two relations between the `SUBJECTS` and the `COURSES` called  `ON ODD WEEK` and `ON EVEN WEEK` but here we went with the simpler design choice of including them as attributes in the `SUBJECTS` entity set. 
- `Days of the week`  is divided into `First day of the week` and the `Second day of the week` because every subject has two lectures a week. We could have used multivalued attribute of `Days of the week` but for the sake of clarifying the implementation we have separated it.
- `Subject code` and `Student code` could have been used as keys(business) for the ER diagram but again for the sake of clarifying the implementation we are using the `Subject id` and `Student id` which will be automatically generated sequences from the DBMS(artificial keys).
- The relation `REGISTERED` is a many to many relationship. Many students can register into many subjects and a subject can have many students.
- All the other implementations of the entity sets and relations are as mentioned int the problem.


#### *exercise 2*
For representing the relationship `REGISTERED` we will create a new relational schema for it.
Here are the following relational schemas for the ER diagram constructed above:
- Students($\underline{students\_id}$, student_code, name, birth_date, address, beginning_year_of_studies)
- Subjects($\underline{subjects\_id}$, subject_code, name, first_day_of_the_week,    second_day_of_the_week, even_week_course, odd_week_course, lecturer, room)
- Registrations($\underline{registrations\_id}$, $\underline{\underline{subjects\_id}}$, $\underline{\underline{students\_id}}$, registration_date, frist_time, even_or_odd_week, final_exam_date)

No we will create the tables using the the relationship schemas we created.
For the `students` table here is the SQL code:
> Every SQL code is entered and is run in the `Worksheet` of the database.
```SQL
CREATE TABLE students (
    students_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_code VARCHAR2(20) CONSTRAINT UNQ_student_code UNIQUE NOT NULL,
    name VARCHAR2(255) NOT NULL,
    birth_date DATE NOT NULL,
    address VARCHAR2(255),
    beginning_year_of_studies NUMBER NOT NULL,
    CONSTRAINT CHK_student_code_alphanumeric_invalid_format 
    CHECK (REGEXP_LIKE(student_code, '^[a-zA-Z0-9]+$')),
    CONSTRAINT CHK_birth_dates_invalid_input 
    CHECK (birth_date >= TO_DATE('1970-01-01', 'YYYY-MM-DD')),
    CONSTRAINT CHK_beginning_year_of_studies_invalid_input 
    CHECK (beginning_year_of_studies >= 1988)
);
```

> `NOT NULL` : you can not assign null values to the column.
> The name of the constrain comes after the keyword `CONSTRAIN`.
> `CHECK` sets the constrain.


There are several things to be noted here:
- `students_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY` :
	- `students_id` column name.
	- `NUMBER` datatype.
	- `GENERATED ALWAYS AS IDENTITY` Oracle creates an invisible sequence associated with the `student_id` column to generate unique values automatically.If you to to the table you will see: ![[Pasted image 20231007124656.png]]
	  The expression `"T4XGKO"."ISEQ$$_2030875".nextval` is a sequence in Oracle Database.
	  In this case:
		- `"T4XGKO"` is the schema name.
		- `"ISEQ$$_2030875"` is the name of the sequence.
		- `.nextval` is a method that retrieves the next value from the sequence. 
	- `PRIMARY KEY` set it as primary key.
-  `student_code VARCHAR2(20) CONSTRAINT UNQ_student_code UNIQUE NOT NULL` 
	- `CONSTRAINT UNQ_student_code UNIQUE`: set a constrain so that the `student_code ` row has unique values. The constrain is called `UNQ_student_code`.
-  You can see that the `address` can take null values because it is mentioned that it should be optional.
- `CONSTRAINT CHK_student_code_alphanumeric_invalid_format`:
    - It uses a regular expression (`REGEXP_LIKE`) to ensure that the `student_code` column contains only alphanumeric characters (letters and numbers).
- `CONSTRAINT CHK_birth_dates_invalid_input`:
    - It checks that the `birth_date` column contains valid date values, specifically ensuring that dates are on or after January 1, 1970.
- `CONSTRAINT CHK_beginning_year_of_studies_invalid_input`:
    - It checks that the `beginning_year_of_studies` column contains valid values, specifically ensuring that the beginning year is 1988 or later.

Now, For the `subjects` table here is the SQL code:
```SQL
CREATE TABLE subjects (
    subjects_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    subject_code VARCHAR2(20) CONSTRAINT UNQ_subject_code UNIQUE NOT NULL,
    name VARCHAR2(255) CONSTRAINT UNQ_subject_name UNIQUE NOT NULL,
    first_day_of_the_week VARCHAR2(10) NOT NULL,
    second_day_of_the_week VARCHAR2(10) NOT NULL,
    even_week_course VARCHAR2(255) NOT NULL,
    odd_week_course VARCHAR2(255) NOT NULL,
    lecturer VARCHAR2(255) DEFAULT 'Bármi Áron' NOT NULL,
    room VARCHAR2(255) NOT NULL,
    CONSTRAINT CHK_first_weekday_invalid_input 
    CHECK (first_day_of_the_week IN('Monday','Tuesday','Wednesday','Thursday','Friday')),
    CONSTRAINT CHK_second_weekday_invalid_input 
    CHECK (second_day_of_the_week IN('Monday','Tuesday','Wednesday','Thursday','Friday')),
    CONSTRAINT CHK_weekdays_of_lecture_are_different 
    CHECK (first_day_of_the_week != second_day_of_the_week),
    CONSTRAINT CHK_subject_code_alphanumeric_invalid_format 
    CHECK (REGEXP_LIKE(subject_code, '^[a-zA-Z0-9]+$'))
);
```
> `DEFAULT` set a default value.
> `IN` after that comes the possible values the row can take.

Many of the thing have the same concepts as in the previous table like for example `GENERATED ALWAYS AS IDENTITY PRIMARY KEY` , `CONSTRAINT UNQ_subject_code UNIQUE`  or the `REGEXP_LIKE` usage but there are also some new things:
- We defined the `name` of the subjects to be `UNIQUE`.
- `lecturer VARCHAR2(255) DEFAULT 'Bármi Áron' NOT NULL`:
    - `DEFAULT 'Bármi Áron'` sets a default value for this column to 'Bármi Áron'.
- `CHECK (first_day_of_the_week IN('Monday','Tuesday','Wednesday','Thursday','Friday'))`:
    - It checks that the `first_day_of_the_week` column contains values that are limited to the weekdays: Monday, Tuesday, Wednesday, Thursday, or Friday. Any other value is considered invalid for this column.
- `CONSTRAINT CHK_second_weekday_invalid_input`:
    - It performs a similar check as the first one but is applied to the `second_day_of_the_week` column, ensuring that it also contains values limited to the weekdays: Monday, Tuesday, Wednesday, Thursday, or Friday.
- `CONSTRAINT CHK_weekdays_of_lecture_are_different`:
    - It checks that the `first_day_of_the_week` and `second_day_of_the_week` columns have different values, ensuring that lectures are held on two different weekdays.

Now, For the `registrations` table here is the SQL code:
```SQL
CREATE TABLE registrations (
	registrations_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    subjects_id NUMBER NOT NULL,
    students_id NUMBER NOT NULL,
    registration_date DATE NOT NULL,
    first_time VARCHAR2(3) DEFAULT 'yes' NOT NULL,
    final_exam_date DATE NOT NULL,
    even_or_odd_week VARCHAR2(10) NOT NULL,
    CONSTRAINT FK_subjects_id FOREIGN KEY (subjects_id) REFERENCES subjects (subjects_id),
    CONSTRAINT FK_students_id FOREIGN KEY (students_id) REFERENCES students (students_id),
    CONSTRAINT CHK_first_time CHECK (first_time IN ('yes', 'no')),
    CONSTRAINT CHK_even_or_odd_week CHECK (even_or_odd_week IN ('even', 'odd'))
);
```

> `FOREIGN KEY` after this you select the column you want to be a foreign key.
> `REFERENCES` after this comes the selection of `<tablef>(<row>)` that the foreign key will take values from.

Thing to consider here are:
- `first_time VARCHAR2(3) DEFAULT 'yes' NOT NULL`
	 - The default value for the `first_time` row is 'yes'.
- `CONSTRAINT FK_subjects_id FOREIGN KEY (subjects_id) REFERENCES subjects (subjects_id)`:
    - This is a foreign key constraint named `FK_subject_id`.
    - It establishes a relationship between the `subject_id` column in the `registrations` table and the `subject_id` column in the `subjects` table.
    - It enforces that a registration record can only be created for a subject that exists in the `subjects` table.
- `CONSTRAINT FK_students_id FOREIGN KEY (students_id) REFERENCES students (students_id)`:
    - This is another foreign key constraint named `FK_students_id`.
    - It establishes a relationship between the `student_id` column in the `registrations` table and the `students_id` column in the `students` table.
    - This constraint guarantees that registrations are associated with valid students.
- `CONSTRAINT CHK_first_time CHECK (first_time IN ('yes', 'no'))`:
    - It checks the values in the `first_time` column, ensuring that they are either 'yes' or 'no'. This constraint enforces that the `first_time` column can only contain these two specific values.
- `CONSTRAINT CHK_even_or_odd_week CHECK (even_or_odd_week IN ('even', 'odd'))`:
    - It validates the values in the `even_or_odd_week` column, allowing only 'even' or 'odd'. This constraint guarantees that the column only contains one of these two values.

#### *exercise 3*
To insert data we will use `INSERT INTO ... VALUES ...` format in SQL. The following SQL code inserts data in the tables:
```SQL
-- Insert data into the students table
INSERT INTO students (student_code, name, birth_date, address, 
					  beginning_year_of_studies)
VALUES ('S001', 'Alice Johnson', TO_DATE('2000-05-15', 'YYYY-MM-DD'), '123 Main St', 2000);

INSERT INTO students (student_code, name, birth_date, 
					  beginning_year_of_studies)
VALUES ('S002', 'Bob Smith', TO_DATE('2004-08-22', 'YYYY-MM-DD'), 1995);

INSERT INTO students (student_code, name, birth_date, address, 
					  beginning_year_of_studies)
VALUES ('S003', 'Charlie Brown', TO_DATE('2003-12-10', 'YYYY-MM-DD'), '456 Elm St', 1999);

-- Insert data into the subjects table
INSERT INTO subjects (subject_code, name, first_day_of_the_week, second_day_of_the_week, 
					  even_week_course, odd_week_course, lecturer, room)
VALUES ('SUB001', 'Mathematics', 'Monday', 'Wednesday', 'Math 101', 'Math 102', 
		'Dr. Smith', 'Room 101');

INSERT INTO subjects (subject_code, name, first_day_of_the_week, second_day_of_the_week, 
					  even_week_course, odd_week_course, lecturer, room)
VALUES ('SUB002', 'Physics', 'Tuesday', 'Thursday', 'Physics 101', 'Physics 102', 'Prof. 
		Johnson', 'Room 201');

INSERT INTO subjects (subject_code, name, first_day_of_the_week, second_day_of_the_week, 
					  even_week_course, odd_week_course, room)
VALUES ('SUB003', 'Computer Science', 'Monday', 'Friday', 'CS 101', 'CS 102', 'Room 301');

-- Insert data into the registrations table
INSERT INTO registrations (subjects_id, students_id, registration_date, final_exam_date, 
						   even_or_odd_week)
VALUES (1,2,TO_DATE('2022-10-10','YYYY-MM-DD'),TO_DATE('2023-11-10', 'YYYY-MM-DD'),'even');

INSERT INTO registrations (subjects_id, students_id, registration_date, final_exam_date, 
						   even_or_odd_week)
VALUES (2,2,TO_DATE('2022-10-15','YYYY-MM-DD'),TO_DATE('2023-11-15', 'YYYY-MM-DD'), 'odd');

INSERT INTO registrations (subjects_id, students_id, registration_date, final_exam_date, 
						   even_or_odd_week)
VALUES (3,3,TO_DATE('2022-10-20', 'YYYY-MM-DD'),TO_DATE('2023-11-20', 'YYYY-MM-DD'),'even');
```

Something important to notice is that in the student `Bob Smith`:
```SQL
INSERT INTO students (student_code, name, birth_date, 
					  beginning_year_of_studies)
VALUES ('S002', 'Bob Smith', TO_DATE('2004-08-22', 'YYYY-MM-DD'), 1995);
```
we don't insert an address but still we don't get errors because we didn't set the row to be `NOT NULL`.
Oracle automatically enters `null` as value. We can see this if we open the table:
![[Pasted image 20231007134442.png]]
If we don't enter a value in the rows that are declared `NOT NULL` you will get an error because you can not insert `null` values there. For example let's insert:
```SQL
INSERT INTO students (student_code, name, 
					  beginning_year_of_studies)
VALUES ('S004', 'Klevis Imeri', 1995);
```
We get the error:
```java
Error report -
ORA-01400: cannot insert NULL into ("T4XGKO"."STUDENTS"."BIRTH_DATE")
```
Because we need to insert a non `NULL` value to the `birth_date` row in the table `students`.

###### Test Cases for constraints and foreign keys
Now we will have some test cases to check that some of the important constrains are working properly.
1. `CONSTRAINT UNQ_student_code UNIQUE` and `CONSTRAINT UNQ_subject_code UNIQUE`: 

The `S002` is the `tudent_code` of 'Bob Smith'. Lets try to enter another student with the same code:
```SQL
INSERT INTO students (student_code, name, birth_date, 
					  beginning_year_of_studies)
VALUES ('S002', 'Klevs Imeri', TO_DATE('2004-05-08', 'YYYY-MM-DD'), 2004);
```
We get the error:
```java
Error report -
ORA-00001: unique constraint (T4XGKO.UNQ_STUDENT_CODE) violated
```

Now for the subject we do the same thing:
```SQL
INSERT INTO subjects (subject_code, name, first_day_of_the_week, second_day_of_the_week, 
                      even_week_course, odd_week_course, lecturer, room)
VALUES ('SUB001', 'Chemistry', 'Tuesday', 'Thursday', 'Chemistry 101', 'Chemistry 102', 
        'Dr. Anderson', 'Room 103')
```
Error:
```java
Error report -
ORA-00001: unique constraint (T4XGKO.UNQ_SUBJECT_CODE) violated
```

2. `CONSTRAINT CHK_<row>_alphanumeric_invalid_format CHECK (REGEXP_LIKE(<row>, '^[a-zA-Z0-9]+$')),`

We will only check for students because the code is the same for the rows that are alphanumeric values. Here is the example using `OTS2!` which is not a valid format:
```SQL
INSERT INTO students (student_code, name, birth_date, 
					  beginning_year_of_studies)
VALUES ('0TS2!', 'Klevs Imeri', TO_DATE('2004-05-08', 'YYYY-MM-DD'), 2004);
```
Error:
```java
Error report -
ORA-02290: check constraint (T4XGKO.CHK_STUDENT_CODE_ALPHANUMERIC_INVALID_FORMAT) violated
```

3. `CONSTRAINT CHK_birth_dates_invalid_input CHECK (birth_date >= TO_DATE('1970-01-01', 'YYYY-MM-DD'))`
```SQL
INSERT INTO students (student_code, name, birth_date, 
					  beginning_year_of_studies)
VALUES ('SOO4', 'Klevs Imeri', TO_DATE('1969-09-12', 'YYYY-MM-DD'), 2005);
```

Error:
```SQL
Error report -
ORA-02290: check constraint (T4XGKO.CHK_BIRTH_DATES_INVALID_INPUT) violated
```

4. To check valid input of the days of the week
```
CONSTRAINT CHK_first_weekday_invalid_input CHECK (first_day_of_the_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')),
CONSTRAINT CHK_second_weekday_invalid_input CHECK (second_day_of_the_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')),
CONSTRAINT CHK_weekdays_of_lecture_are_different CHECK (first_day_of_the_week != second_day_of_the_week), 
```

You can see that `Saturday` as an input to the first day of the week.
```SQL
INSERT INTO subjects (subject_code, name, first_day_of_the_week, second_day_of_the_week, 
                      even_week_course, odd_week_course, lecturer, room)
VALUES ('SUB001', 'Chemistry', 'Friday', 'Firday', 'Chemistry 101', 'Chemistry 102', 
        'Dr. Anderson', 'Room 103');
```

Error:
```java
Error report -
ORA-02290: check constraint (T4XGKO.CHK_SECOND_WEEKDAY_INVALID_INPUT) violated
```

Now lets make the 2 lectures in the same day `Friday`:
```SQL
INSERT INTO subjects (subject_code, name, first_day_of_the_week, second_day_of_the_week, 
                      even_week_course, odd_week_course, lecturer, room)
VALUES ('SUB001', 'Chemistry', 'Friday', 'Firday', 'Chemistry 101', 'Chemistry 102', 
        'Dr. Anderson', 'Room 103');
```
Error:
```java
Error report -
ORA-02290: check constraint (T4XGKO.CHK_SECOND_WEEKDAY_INVALID_INPUT) violated
```

5. Now we come to the important part we check of our `FOREIGN KEYS` are set up properly.
```
CONSTRAINT FK_subjects_id FOREIGN KEY (subjects_id) REFERENCES subjects (subjects_id),
CONSTRAINT FK_students_id FOREIGN KEY (students_id) REFERENCES students (students_id),
```

What we know about the `FOREIGN KEYS` keys is that you can only enter values that correspond to the reference. In our case you can only enter the values fond in `subjects (subjects_id)` in the row `registrations (subjects_id)`  and you can only enter values found in `students (students_id)` in the row `registrations (students_id)`. I also talk about this above in the creation of the `REGISTRATIONS` table. 
From this we can derive that the test that can be done here is entering values that the reference doesn't have. 
First let us lay out the data we have:
![[Pasted image 20231007160350.png]]
![[Pasted image 20231007160404.png]]
Here we can se that we only have the `{1,2,3}` values for the `students_id` and the `subjects_id`. If we only use these values we will be fine. For example here are the values we put earlier:
![[Pasted image 20231007160307.png]]
For all the pairs `{{1,1}{1,2},{3,3}}` the used values are correct and come from `{1,2,3}`. 
The knowledge we can extract from the first row of this table is:
```
The student with id 2 (Bob Smith) has registered for subject with id 1 (Mathematics) for the first time on 10/10/2022 for the even week course and for the final exam on date 10/11/2023.
```
You can extract the knowledge from each row the save way and you can clearly see how the `FOREIGN KEYS` correlate with each other.

Now we are going to test what happens if we put invalid values (values not from the referenced rows. `{1,2,3}`)
Here is the example or us taking the `4` as value for `registrations (subjects_id)` that doesn't exits in  `subjects (subjects_id)`:
```SQL
INSERT INTO registrations (subjects_id, students_id, registration_date, final_exam_date, 
						   even_or_odd_week)
VALUES (4,3,TO_DATE('2020-08-17', 'YYYY-MM-DD'),TO_DATE('2021-10-18', 'YYYY-MM-DD'),'odd');
```
Error:
```java
Error report -
ORA-02291: integrity constraint (T4XGKO.FK_SUBJECT_ID) violated - parent key not found
```
You can see that the name of the constrain violated is the same as the one set in the creation of the table.

We can also try for the other `FOREIGN KEY`:
```SQL
INSERT INTO registrations (subjects_id, students_id, registration_date, final_exam_date, 
						   even_or_odd_week)
VALUES (1,4,TO_DATE('2020-08-17', 'YYYY-MM-DD'),TO_DATE('2021-10-18', 'YYYY-MM-DD'),'odd');
```
Error:
```java
Error report -
ORA-02291: integrity constraint (T4XGKO.FK_STUDENT_ID) violated - parent key not found
```

