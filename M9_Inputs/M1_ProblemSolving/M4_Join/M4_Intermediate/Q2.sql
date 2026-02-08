/*
Questions: Find symmetric pairs (or) mutual relationships

Input :

			1	2
			3	2
			2	4
			2	1
			5	6
			4	2


Output :

			1   2
            2   4




*/


SELECT q1.a, q1.b
FROM Temp q1
inner JOIN Temp q2 ON q1.a = q2.b AND q1.b = q2.a
WHERE q1.a < q1.b;
