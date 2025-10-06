/*

Order Of execution

*/

/*

1. FROM → Index Scan

2. JOIN → Hash Match

3. ON → Join Condition 

4. WHERE → Predicate Pushdown / Filter
 
5. GROUP BY → Hash Match (Aggregate)
 
6. Aggregates (SUM, COUNT, MAX, etc.) → Compute Scalar / Aggregate Operators

7. HAVING → Filter (Post-aggregation)

8. Window Functions (ROW_NUMBER, RANK, etc.) → Segment → Sequence Project

9. SELECT → Projection
 
10. DISTINCT → Stream or Hash Aggregate
 
11. ORDER BY → Sort Operator
 
12. TOP → Top Operator
 
13. OFFSET / FETCH → Top + Filter
 
*/