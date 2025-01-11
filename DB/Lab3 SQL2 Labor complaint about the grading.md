#### Question:
2.5. feladat (2p)
In descending order, list the names of those students who have not even registered for a single
subject.

#### Answer 
**Evaluator**
```sql
SELECT name 
FROM students 
LEFT JOIN enrollments 
ON student_id = student 
WHERE student IS NULL 
ORDER BY name DESC; 
```

**Mine**
```sql
SELECT s.name
FROM students s, enrollments e
WHERE s.student_id=e.student(+)
GROUP BY s.name
HAVING COUNT(e.subject)=0
ORDER BY name DESC;
```

The evaluator's solution works as intended, and mine, although different, is also valid solution. I count for each student how many subjects they are enrolled into and then display them who are enrolled for 0 subjects.
I know my solution is not the most efficient one but it is not wrong.

#### Question:
2.8. feladat (3p, amiből (i) 1p)
List the codes and names of all subjects. In the case of subjects for which any of the students
registered for the first time, list the suggested exam date(s) as well.
The order of columns should be: neptuncode, subjectname, examdate.

#### Answer 
**Evaluator** 
> The right way of doing this would have been like this: 
LEFT JOIN enrollments ON (subject_id = subject AND firstenroll = 1) 
The selection should've come before the join.

What the evaluator really ment by his answer is very hard to understand but I suppose he wanted this:
```sql
SELECT 
    s.neptuncode, 
    s.subjectname,
    e.examdate
FROM 
    subjects s, 
    enrollments e
WHERE 
    s.subject_id = e.subject(+)
    AND e.firstenroll=1;
```

**Mine**
```sql
SELECT
    s.neptuncode,
    s.subjectname,
    CASE
        WHEN SUM(e.firstenroll) >= 1 THEN 
        MIN(e.examdate)
        ELSE NULL
    END AS examdate
FROM
    subjects s,
    enrollments e
WHERE
    s.subject_id = e.subject(+)
GROUP BY
    s.neptuncode,
    s.subjectname;
```

The problem with the solution of the evaluator is that it doesn't fulfill the requirement from the exercise. It is mentioned `In the case of subjects for which any of the students registered for the first time, list the suggested exam date(s) as well.` which implies that if there are subject where none of the students registered for the first time then the value should be of the exam date should be null. The evaluator solution doesn't fulfil that.
Secondly, the specification is not clear and I have a long discussion on what date should I list with the lab tutor. ![](Pasted%20image%2020231130203938.png)
As you can see I only list the earliest date. 
My solution precisely does what mentioned above.