/*

Deadlock :
            When two or more transactions are waiting for each other to release locks 
            Transactions are blocked
            No progress happens




Example:

Transaction T1 locks Row A and waits for Row B
Transaction T2 locks Row B and waits for Row A
Both are stuck forever



*/


/*

Livelock :
            When transactions keep changing their state (retrying/rolling back) 
            Transactions are not blocked
            No progress happens


Example:

T1 and T2 keep detecting conflict
Both roll back and retry repeatedly
They are active, but no work completes



*/
