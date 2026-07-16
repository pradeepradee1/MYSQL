/*

1) Think Where we can apply the Conditions (Important) 

      *) Where

      *) Group By

      *) Aggregate functions

      *) Nested Aggregate functions
            Ex : max(if action = "in" , `time`,100)  or max(CASE when action = "in" then `time` END)

      *) Having

      *) Order By
            Ex : order by (count col) desc


*/


/*

2)  When we should apply the Conditions for where and group by

        Where (Specificatoions)
        
                Ex1:
                    Get the total in every Feb of year
                        Where mon = Feb 
                Ex2:
                    Find the top 3 products with the highest sales in the past week
                        where s.date >= CURDATE() - INTERVAL 7 DAY 
        
        Group By (UnSpecificatoions)

                Ex1:
                    Get the total of every month of year 
                        group by year,month
                Ex2:
                    Find all customers who have placed orders in at least 3 different product categories in the same calendar month.
                        group by year,month

        Where   ---> Specificatoions (Feb , past week , last 6 months)
        GroupBy ---> UnSpecificatoions (every month of year, same calendar month)

*/