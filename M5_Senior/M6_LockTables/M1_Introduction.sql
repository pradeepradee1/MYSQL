/*

Deadlock :
            A deadlock occurs when two or more transactions are waiting for each other 
to release locks and none of them can proceed.

Example:

Transaction T1 locks Row A and waits for Row B
Transaction T2 locks Row B and waits for Row A
Both are stuck forever

Key Points:
            Transactions are blocked
            No progress happens


*/


/*

Livelock :
            A livelock occurs when transactions keep changing their state (retrying/rolling back) 
but still fail to make progress.


Example:

T1 and T2 keep detecting conflict
Both roll back and retry repeatedly
They are active, but no work completes

Key Points:

                Transactions are not blocked
                Continuously retrying

*/