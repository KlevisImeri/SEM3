TARGET DECK: SEM3::DB::Transaction_Management

What is a transaction? 
What is it composed from?
What is it expressed with? #flashcard 
- One Execution of a single program.
- Read and write operations on data items.
- Query language
<!--ID: 1701887673192-->

Where are all the computations of a transaction performed? #flashcard 
- Local workspace
<!--ID: 1701888193618-->


What are the properties that a transaction should have? #flashcard 
ACID
- Atomic: performed in one go
- Consistent: fully completed
- Isolated: from other transactions (on one knows for each other)
- Durable: the effect are saved (preserved)
<!--ID: 1701888193626-->

What is a data item? #flashcard 
- It is a data unit which the access to it can be controlled.
<!--ID: 1701890731285-->


What is granularity? 
What is it called when size of item is small and vice versa? #flashcard 
- The size of the data item used for transactions (for access control).
- 'Fine-grained': small items 
- 'Course-grained': large items
<!--ID: 1701890731311-->


What are steps?
What is a schedule? #flashcard 
- Steps: read/write operations
- The order in which the steps of many transactions are executed.
<!--ID: 1701890731318-->


What is a scheduler?
What is it part of? #flashcard 
- A program **in** the **DBMS** which **arbitrates** the **conflicts**. 
- **Controls** of **access** **rights** for each transaction.
<!--ID: 1701890731325-->



What are the types of schedules? #flashcard 
- Serial 
- Non-Serial Unserializable (parallelismn)
- Non-Serial Serializable  (no conflicting parallelismn)
<!--ID: 1701890731332-->


When is a scheduler serializable? #flashcard 
- IFF the serial equivalent exits
<!--ID: 1701890731339-->


What is Concurrency Control? #flashcard 
- Managing a non conflict execution of simultaneous transactions.
<!--ID: 1701890731346-->



List the possible concurrency problems?
Explain each one of them? #flashcard 
- Dirty read:
	- ![](Pasted%20image%2020231206201335.png)
- Lost update WAW:
	- ![](Pasted%20image%2020231206201917.png)
- Unrepeatable Read RAW:
	- ![](Pasted%20image%2020231206202220.png)
	- T2 wonders how come X changed 
- Phantom Read:
	- ![](Pasted%20image%2020231206202428.png)
	- T2 wonders who deleted X
<!--ID: 1701890731353-->


What is a lock? 
Who manages the locks and how are they stored? #flashcard 
- Is access privilege.
- The ***lock manager*** stored the lock in the ***lock table***:
	- \<data item>, \<lock type>, \<transaction> 
<!--ID: 1701891360562-->



What is a protocol? #flashcard 
- A protocol is a set of rules on how the transactions are performed.
<!--ID: 1701891360573-->


Explain with a drawing what is the Concurrency-Control of the ***Lock Manger***, ***Scheduler*** and ***Protocol***? #flashcard 
![](Pasted%20image%2020231206203555.png)
<!--ID: 1701891360579-->


How can a lock solve the lost update problem? #flashcard 
![](Pasted%20image%2020231206203846.png)
T2 waits till T1 commits so the update is never lost.
<!--ID: 1701893565582-->


Explain a deadlock?
How does it look in a precedence grapth?
What happens then? 
What are the solutions? #flashcard 
```
L(A)
	L(B)
L(B)
	L(A)
U(A) 
	U(B)
U(B) 
	U(A)
```
<!--ID: 1701893565596-->


- Cycles are Deadlocks.
- The scheduler decides (example: aborts one of the transactions.)
- The solutions to deadlocks:

- Requests all its locks at once
```
L(A)
L(B)
//do somthing
U(A) 
U(B)
	L(B)
	L(A)
	//do somthing
	U(B)
	U(A)
```

- Arbitrary linear ordering to the locking of items
```
L(A)
	L(A)
L(B)
	L(B)
U(A) 
	U(A)
U(B) 
	U(B)
```

What is a Live Lock? #flashcard 
- Starvation of a transaction for the lock
<!--ID: 1701893565607-->

Explain the simple transaction model? #flashcard 
- Lock 
- Precedence Graph 
<!--ID: 1701895383928-->


What is the faze between locking and unlocking called in a TPL? #flashcard 
- Synchronization point
<!--ID: 1701895383940-->


What are the phases of the TPL? #flashcard 
- Locking
- Synchronization point
- Unlocking 
<!--ID: 1701895416787-->


What are the types of locks? #flashcard 
- Shared locks (Read)
- Exclusive Locks (Write Read)
<!--ID: 1701895383948-->

How Does items Granularity Affect Performance with Locks? #flashcard 
- large -> less overhead less parallelism 
- small -> more overhead more parallelism 
<!--ID: 1701896751694-->



When does a transaction fail? #flashcard 
- If checks made by ***database recovery system***. 
<!--ID: 1701896751703-->



After aborting the transaction what are the possible states? #flashcard 
- Re-start
- Kill
<!--ID: 1701896751710-->


What is the difference between Partially Committed and Committed state? #flashcard 
- Partially Committed: the transaction finished the final step the results are not stored in the database yet.
- Committed: permanently saved in DB
<!--ID: 1701896751717-->


What are the possible states of a transaction? #flashcard 
![](Pasted%20image%2020231206220420.png)
<!--ID: 1701896751724-->



Draw the compatibility matrix? #flashcard 
![](Pasted%20image%2020231206221103.png)
<!--ID: 1701898587810-->



Explain the Tree Protocol? #flashcard 
Idea: Linear Ordering of the locks => No deadlocks`
- First Lock everywhere
- Further lock Children of Locked node.
- No relocking
<!--ID: 1701898587819-->



Explain the Warning Protocol? #flashcard 
Idea: Use 2PL
 - Lock or Warn the root node 
 - Lock or Warn if Warn on parent 
 - Phase locking must be used
<!--ID: 1701898587826-->



What are timestamps in the timestamps Protocol? #flashcard 
- Unique identifiers that indicated relative starting time of a transaction.
<!--ID: 1701898587832-->


Using timestamps Protocol what should we allocate at the data item? #flashcard 
- Read timestamps: T that read most recently
- Write timestamps:  T that wrote most recently
<!--ID: 1701898587840-->


When is a transaction legal? #flashcard 
- Transaction may not proceed until the lock is released by an unlock command
- Every lock must be unlocked
<!--ID: 1704555015856-->



What is the difference between a Deadlock and a Livelock? #flashcard 
![](Pasted%20image%2020240106152438.png)
<!--ID: 1704555015886-->


What does a scheduler do? #flashcard 
- Eleminate livelock, deadlock 
- Forcing a transaction to wait 
- Abort a transaction
- Assure serializability
<!--ID: 1704555015892-->



What are the rules of strict 2PL? #flashcard 
- Perform operations, COMMIT, WRITE, Unlock  ![](Pasted%20image%2020240106205433.png)
	- Commit tells you everything was done right.
	- you can only abort int the perform operation fase it implies that after the commit point there will be no problems with the data.
	- Unlocking is done in after you assure that everything is right and you have recorded the result in the database.
<!--ID: 1704570894766-->

