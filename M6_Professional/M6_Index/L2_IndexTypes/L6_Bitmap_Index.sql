/*

Bitmap Index :
                Efficient for low-cardinality columns (few distinct values)
                Common in Oracle databases

*/


CREATE BITMAP INDEX idx_gender
ON employees(gender);
