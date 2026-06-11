/*

Flattening Rows     →    Converting multiple rows into a single row (row-to-column aggregation)

Flattening Rows

StudentID   StudentName     CourseName
1           Alice           Math
1           Alice           Science
1           Alice           English
2           Bob             Math
2           Bob             History
3           Charlie         Science

Output :

StudentId   StudentName     Courses
1           Alice           Math, Science, English
2           Bob             Math, History
3           Charlie         Science


*/

CREATE or replace TABLE student_courses (
    StudentID INT,
    StudentName VARCHAR(50),
    CourseName VARCHAR(50)
);


INSERT INTO student_courses (StudentID, StudentName, CourseName) VALUES
(1, 'Alice', 'Math'),
(1, 'Alice', 'Science'),
(1, 'Alice', 'English'),
(2, 'Bob', 'Math'),
(2, 'Bob', 'History'),
(3, 'Charlie', 'Science');


SELECT
    StudentID,
    StudentName,
    GROUP_CONCAT(CourseName ORDER BY CourseName SEPARATOR ', ') AS Courses
FROM
    student_courses
GROUP BY
    StudentID, StudentName
ORDER BY
    StudentID;


/*

Unflattening Rows   →    Converting single row back into multiple rows

Input : (Reverse the Process)

StudentId   StudentName Courses
3           Charlie     Science
1           Alice       Math, Science, English
2           Bob         Math, History


Output  :

StudentID   StudentName     CourseName
1           Alice           Math
1           Alice           Science
1           Alice           English
2           Bob             Math
2           Bob             History
3           Charlie         Science


*/
CREATE TABLE student_courses_combined (
    StudentID INT,
    StudentName VARCHAR(50),
    Courses VARCHAR(255)
);



INSERT INTO student_courses_combined (StudentID, StudentName, Courses) VALUES
(3, 'Charlie', 'Science'),
(1, 'Alice', 'Math, Science, English'),
(2, 'Bob', 'Math, History');



SELECT 
    StudentID,
    StudentName,
    TRIM(course) AS CourseName
FROM 
    student_courses_combined,
    JSON_TABLE(CONCAT('["', REPLACE(Courses, ', ' , '","'), '"]'),"$[*]" COLUMNS (course VARCHAR(50) PATH "$")) AS jt
ORDER BY 
    StudentID;

/*

Explanation : 

"$[*]" COLUMNS (course VARCHAR(50) PATH "$") 

It is inside:

JSON_TABLE(json_data, json_path COLUMNS (...))

How to read JSON and convert it into rows and columns.

"$[*]" 

This is a JSON Path expression. “Go to the root $ and take all elements inside the array.”

| Symbol | Meaning               |
| ------ | --------------------- |
| `$`    | Root of JSON document |
| `[*]`  | All elements in array |


COLUMNS (course VARCHAR(50) PATH "$")

Means:

Create a column named course

Data type: VARCHAR(50)

Take its value from JSON path $


*/
