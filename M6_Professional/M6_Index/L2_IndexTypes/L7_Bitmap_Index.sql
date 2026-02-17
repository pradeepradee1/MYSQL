/*

Bitmap Index :

                Stores bitmaps for each distinct value
                Efficient for low-cardinality columns (few distinct values)
                Common in Oracle / analytical databases

*/


CREATE BITMAP INDEX idx_gender
ON employees(gender);
