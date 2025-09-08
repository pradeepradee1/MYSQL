/*

 How would you identify users who upgraded to premium within 7 days of signup?


*/

SELECT s.user_id,
       s.signup_date,
       sub.upgrade_date
FROM signup s
JOIN subscription sub
    ON s.user_id = sub.user_id
WHERE sub.plan_type = 'PREMIUM'
  AND sub.upgrade_date <= s.signup_date + INTERVAL '7' DAY;

