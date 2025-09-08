/*
    Flattening and Unflattening Rows


StudentID StudentName CourseName
1 Alice Math
1 Alice Science
1 Alice English
2 Bob Math
2 Bob History
3 Charlie Science

Output :
StudentId StudentName Courses
1 Alice Math, Science, English
2 Bob Math, History
3 Charlie Science


*/

SELECT StudentId, StudentName, CONCAT_WS(', ', COLLECT_LIST(CourseName)) AS Courses
FROM StudentCourses
Group BY StudentId, StudentName
ORDER BY Studentd

/*

Input : (Reverse the Process)

StudentId StudentName Courses
3 Charlie Science
1 Alice Math, Science, English
2 Bob Math, History

*/

SELECT studentID, studentName, 
explode(split(courses, ',\\s*')) AS course
FROM FlattenedStudentCourses