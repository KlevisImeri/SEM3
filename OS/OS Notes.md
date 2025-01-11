TARGET DECK: SEM3::OS::MID1

What is an operating system? #flashcard 
***Collection*** of software:
- **Control** operation computer hardware 
- ***Support*** execution of use's tasks
<!--ID: 1699201858365-->



What is the evolution of OS? #flashcard 
- Batch computing: 
	- (magnetic tapes) batches
	- big room computers
- Muliprogrammed OS:
	  - memory split
	  - several processes
- Time sharing OS
	- The processor time is shared equally between the users
	- Predictable
- Personal computer OS
	- graphical user interface
- Embedded OS
	- Read Time very imporant
<!--ID: 1699201858373-->




What are real-time systems? #flashcard 
Real-time system
	- The response to time of a query will be less than a given period
		- Hard real time P(e)=1
		- Soft real time P(e)~1
<!--ID: 1699201858381-->




What are `multikernels`? #flashcard 
Multikernels are a type of operating system design that extends the traditional monolithic kernel"
- break the kernel into multiple smaller, specialized kernels, 
- each responsible for a specific subset of system functionality. 
- These specialized kernels: "multikernel components" or "cores," 
- work together to manage various aspects of the operating system and provide services to applications.
<!--ID: 1699201858388-->



What are `exokernels`? #flashcard 
- Application have more direct access to the hardware
- Applications are more isolated form each other => security
- `exo` because it lives outside of applications and exposes them to hardware
- `exo` because very small only the skeleton 
<!--ID: 1699201858396-->



What is `Universal Memorory`? #flashcard 
- A type of memory which can serve multiple roles (flash)
<!--ID: 1699201858403-->



What are the protection operational modes? #flashcard 
How much are you restricted to hardware => restricted instruction set:
	- Level 0 protected
	- Level 1 user
<!--ID: 1699201858409-->



What mode does the kernel run? #flashcard 
- Protected mode => govern others software (handles their life cycle)
<!--ID: 1699202193583-->



Who handles the events of hardware and software? #flashcard 
- Kernel
<!--ID: 1699202193593-->


What are parts of OS? #flashcard 
- `System Libraries` (\<stdout\>)
- `System Program` (Task manager)
- `System Services` (Print Spooler)
<!--ID: 1699202193600-->



What are the parts of the Kernel? #flashcard 
- Process management
	- Communication IPC
	- Memory manager
	- Loader 
	- Scheduler
- I/O operations
- IT handler
- Device Managers
- Systemcall Interface
<!--ID: 1699203954012-->



Monolithic vs Microkernel? #flashcard 
- Monolithic:
	- 1 exe
	- one error crashes all
- Microkernel:
	- OS as minimal as possible => micro
	- Modular (load modules at:)
		- Static (offline) - compile time
		- Dynamic (online) - runtime (load/unload)
		- complex
	- Layered (interfaces)
<!--ID: 1699203954020-->




What is an armored OS? #flashcard 
Monolithic, but the ***device drivers*** are isolated, are wrapped in protected functions, because device drivers create the most problems.
<!--ID: 1699203954027-->



What does a kernel task manager do? #flashcard 
- memory management
- scheduling
<!--ID: 1699203954033-->



What does a microkernel have that a monolithic doesn't? #flashcard 
- High-level device manger because of modularity
<!--ID: 1699203954039-->


What kernel is windows? #flashcard 
- monolithic with microkernel elements
<!--ID: 1699206306923-->



What are Multiserver and Hybrid kernel? #flashcard 
- multiple servers in the same microkernel
- microkernel with monolithic on top
<!--ID: 1699206306934-->



What kernels are good for IPC communication? #flashcard 
- L4 microkernel (exokernel)
<!--ID: 1699206306940-->



What does loader and scheduler do? #flashcard 
- resource allocate
- control program
<!--ID: 1699206306946-->



What kind of task are there? #flashcard 
- I/O bound
- CPU bound
- Memory Intensive
<!--ID: 1699206306952-->



Does loader allocate resources? #flashcard 
- No
<!--ID: 1699206306958-->



What file system does windows use? #flashcard 
***NTFS*** : the new file system
<!--ID: 1699206306964-->



What is the general boot procedure? #flashcard 
- ROM loader
- RAM loader
- OS loader
:::::::::::::::::::::::::::::::
- ROM loader => to load BIOS
- system initiator program:
	- BIOS (in Windows)
	- bootROM (in Android)
- RAM loader (at MBR)
- OS loader(at PBR | VRB) => boot managers => kernel
- Kernel Self Loading
- Change into kernel mode
	- here everything related to kernel is done
- Winload.exe -> Ntoskrnl.exe -> SMSS.exe -> Autochk.exe -> Wininit.exe -> admin session -> csrss.exe -> Winlogon.exe
Unix has init (non parallel) -> linux sustemd (parallel)
linux vmlinux | windows ntoskrnl.exe
<!--ID: 1699206306970-->



What is system call interface? #flashcard 
- separates the protected and user mode
- provides common functions for user mode programs
<!--ID: 1699206306977-->



Does kernel have its own address space? #flashcard 
yes
<!--ID: 1699206306983-->



What are virtual system calls? #flashcard 
- kernel address space and user space shared us use that
- gettimeofday()
<!--ID: 1699206306989-->



How are address spaces of services in monolithic kernel? #flashcard 
user services and kernel services are in the same address space.
<!--ID: 1699206306995-->

How can task with intensive memory effect CPU or I/O? #flashcard 
- enough memory -> CPU intensive
	- cpu has to process all the time
- not enough memory -> I/O intensive
	- I/O has to move to RAM new things all the time
Example: indexes or matrix multiplciation
<!--ID: 1699208340981-->



What is a task and what a program? #flashcard 
- Program: binary instructions and data structures (static)
- Task: program during execution (dynamic)
<!--ID: 1699208340990-->



What is a state and what a life-cycle of a task? #flashcard 
- State  - properties of the task at the moment
- Life-cycle - state transitions from start to termination
<!--ID: 1699208340996-->



What is a process? What does it contain? #flashcard 
A task with it's own memory range:
	- kernel protects this range
	- higher overhead | slow | complex
It contains Threads:
	- sequential Tasks 
	- share memory with other threads
	- own stack
	- 'parallel'
<!--ID: 1699208341003-->



How is the data of the tasks divided? #flashcard 
- Program data (task's memory range)
- Administrative data (mange by kernel)
	- u-space | process-space
	- kernel-space
<!--ID: 1699208341009-->



How can the ***running*** state of the kernel be divided? #flashcard 
- user mode
- kernel mode
System call interrupt makes it change
<!--ID: 1699208341015-->




According to the running right of task what kind of schedulers do we have? #flashcard 
- ***Preemtive*** - full control (takes away the right)
- ***Non-preemtive(Cooperative)*** - waits for the process to give the right of running.
- if interrupt or exception the right of running it taken either way
<!--ID: 1699208341022-->



What is the context change? #flashcard 
When something else need to happen the context of the task need to be saved so it can be restored later when it will be runed again.
<!--ID: 1699208341028-->



Execution mode and context? #flashcard 
Task context | User mode -> normal program run
Task context | Kernel mode -> system call
Kernel context | User mode -> doesn't make any sense (security)
Kernel context | Kernel mode -> IT handling and system management
<!--ID: 1699208888836-->



When does a context of task change? #flashcard 
When there is a Interrupt or Task change.
<!--ID: 1699208888844-->



What resources do we give a task? #flashcard 
Abstract virtual machine: „virtual” CPU and memory for the tasks
<!--ID: 1699208888862-->



What are the life-cycles of task? #flashcard 
Creation, ready-to-run, run, waiting, termination.
<!--ID: 1699208888869-->


What states does the scheduler mange? Does it manage waiting? #flashcard 
- R<->RTR run<->ready-to-run
- No it doesn't care about waiting
<!--ID: 1699211236953-->



How is Round-robin scheduling (RR) done? 
Why cant the time slice be to shorty? #flashcard 
- Every one gets the same amount of time in a circle => preemtive 
- time quantum | time slice
- FIFO
Because to many context changes -> higher overhead
<!--ID: 1699211236961-->


How is Shortest job first scheduling (SJF) done? #flashcard 
- The task with shortest CPU bursts are done first
- List we need to insert into appropriate location
<!--ID: 1699211236968-->


What is a common problem of schedulers with priority? How to avoid? #flashcard 
- Starvation
- Dynamic priorities 
<!--ID: 1699211236975-->


What is Multilevel Scheduling? #flashcard 
- Many schedulers of different algos working together with accordance to priority
<!--ID: 1699215830727-->



Why is preemtive very bad? #flashcard 
1. Interrupting time critical hardware
2. Stop task => change context
3. Stop kernel task => corruption
4. Deadlocks
<!--ID: 1699215830736-->


Where are the tasks selected from? #flashcard 
- Short term CPU scheduling
- Long term - user space
- Medium term - pulled from short term
<!--ID: 1699215830742-->


What is the preemtive verison of SJF? #flashcard 
- SRTF - shortest remaining time first
<!--ID: 1699215830749-->



What scheduler does (Unix and Windows NT kernel use)? #flashcard 
- MFQ - Multilevel Feedback Queue
<!--ID: 1699215830756-->


What is the correction factor CF? #flashcard 
- CT < 1
- And it takes care of aging the p_cpu
<!--ID: 1699215830763-->


What are the characteristics of schedulers for kernel mode and for user mode? #flashcard 
- Kernel mode:
	- cooperative
	- static priority 
	- waiting (I/O) time is inportant
- User mode:
	- preemtive
	- dynamic priorites
	- time-sharing
<!--ID: 1699215830769-->



What is the problem with cooperative in kernel mode? #flashcard 
- ***priority inversion***: they both wait for the same resource (memory for example).
	- the low priority task has the key
	- the high priority should wait for the key
- you can just do ***priority inheritance***
	- for a short time make the low priority high till it releases the key
	- because the high priority wants the key of the low priority => low priority know inherits the priority of the high task
- you can do  ***priority ceiling***
	- upgraded to highest level kernel mode
- you can do ***random boosting***
	- boost the lock holders to higher priority randombly
<!--ID: 1699215830776-->



What are the variants of multiprocessor scheduling? #flashcard 
- Asymmetrical systems (kernel on on CPU)
- Symmetrical systems (every processor its own scheduler) (this is used)
<!--ID: 1699215830782-->


What is process affinity? #flashcard 
- bounds the process to CPU
- Soft affinity (no guarantees) (this is used)
- Hard affinity (process specify which processors)
<!--ID: 1699215830789-->

What is turnaround time? #flashcard 
- time it takes for a process to complete its execution from the moment it enters the system's queue to the moment it finishes and exits the system.
<!--ID: 1699218861938-->


What kind of scheduler does windows have? #flashcard 
Full preemtive, dynamic, multilevel.
<!--ID: 1699218861947-->


What is the linux CFS (Completely Fair Scheduler)? #flashcard 
- Red-Black tree
<!--ID: 1699218861954-->


Who are jobs implemented by? #flashcard 
- One or multiple tasks
<!--ID: 1699218861960-->


What is Copy-ON-Write? #flashcard 
- processes have the same memory space as parent 
- when the process wants to write to something, it writes to a copy.
<!--ID: 1699218861967-->


What is PRAM model of tasks communication? #flashcard 
- PRAM (pipelined RAM)
- Shared physical memory range for the tasks
- Several tasks can read and write there (competitive)
- The operations are pipilined
- If they arive at the same time:
	- Write happens before Read
	- If two simultaneous writs when one of them is written
=> You need synchronization
<!--ID: 1699218861973-->


What are the methods of communication? #flashcard 
- Memory Sharing
- Message Passing
<!--ID: 1699221535097-->


What are the basic methods of addressing? #flashcard 
- Direct  sender -> receiver 
- Indirect  sender -> mailbox -> receiver
- Asymmetric sender -> Mail|receiver 
	- Here is direct on sender
- Multiple addressing (brodcasting) sender -> everyone
<!--ID: 1699221535105-->



What are the synchronazation method of message-passing? #flashcard 
- Blocking: sender and receiver wait till data is received
- Non-blocking: don't wait => 'no data received' can happen
<!--ID: 1699221535111-->


What kind of communication is Client-Server Communicatoin? 
Give examples? #flashcard 
- Asymetric because the server has a mailbox to id, it receives a pull of request form many users.
- Socket communication TCP/UDP/IP
- RPC (Remote Procedure Call):
	- calls a function in another task | or machine
	- receives the results
	- API (RPC library) => You can send with C++ receive with Python
<!--ID: 1699221535118-->



What is POSIX Shared Memory? 
What are the commands? #flashcard 
- Shared memory communication between ***processes***.
- shmget() to create memory. MODES as input
- shmat(shmid, shaddr, shmflg) to access it
<!--ID: 1699221535124-->


Which contains which socket and RPC? #flashcard 
- RPC contains socket
<!--ID: 1699221535131-->


What is the addressing mode of RPC? #flashcard 
- Direct and Asymmertic
<!--ID: 1699221535137-->


You have an indirect communication, what is the diff between having a mail and a message queue? #flashcard 
- Mail:
	- predefined size
- Message queue:
	- unlimited size
<!--ID: 1699221535144-->


What are some signals in UNIX? #flashcard 
- SIGINT - interrupt from keyboard
- SIGKILL - kill signal
- SIGUSR1 - user defiend
- SIGUSR2 
<!--ID: 1699227518231-->


What is NO sync.? #flashcard 
No synchronous -> Asynchronous 
<!--ID: 1699227518240-->



What are the basics form of synchronizations? #flashcard 
- Mutual exclusion -> keys
- Rendezvous -> semaphores
- Precedence -> dependency graphs
<!--ID: 1699227518246-->


What is a critical section and what are the states? 
What are the rules? #flashcard 
- A critical section of code can be:
	- writing to memory | variable | data structures ...
- States are:
	- entry section
	- critical section
	- exit section
	- remainder section
- Rules
	- Entering
		- Only one task in critical section
	- Exiting
		- The task should finish the critical section on time
<!--ID: 1699227518253-->


What is the solution to the critical-section problem? #flashcard 
1. Mutual Exclusion (only one process at the time)
2. Progress (if empty then another one should enter)
3. Bounding Waiting (the same task can't keep getting in)
<!--ID: 1699227518260-->



Explain Peterson's Solution? #flashcard 
```c
int turn;
bool ready[2]; //0->i  1->j
<!--ID: 1699227518266-->


do{
	ready[i]=true;
	turn=j;
	//while(ready[j] && turn=j);
	while(true){
		if(!ready[j] || turn=i) break;
	}
		//critical section
	read[i]=false;
		//remaider section
		
}while(true);

do{
	ready[j]=true;
	turn=i;
	//while(ready[j] && turn=j);
	while(true){
		if(!ready[i] || turn=j) break;
	}
		//critical section
	read[j]=false;
		//remaider section
}while(true);
```



What are atomic instructions?
What are the atomic functions for synchronization?  #flashcard 
Non interruptible memory instructions.
- Test-and-Set-Lock(TSL)
- Compare-and-Swap(CAS)
<!--ID: 1699227518272-->


What function so mutex locks use? #flashcard 
Mutex : mutual exclusion locks
- `acquire()`
- `release()`
  
What is the problem with mutex locks? #flashcard 
- busy waiting
- spinlock 
<!--ID: 1699227518278-->


What is a binary semaphore? #flashcard 
A mutex lock
<!--ID: 1699227518285-->


What does semaphore do differently? #flashcard 
- It provides more lock
- It lets several tasks in (like cars in traffic) 
<!--ID: 1699227518292-->


What is the problem with SpinLock semaphores? 
What can you do to fix it? #flashcard 
- Busy-Waiting
- You can use a **waiting queue**:
	- but can cause Starvation
<!--ID: 1699227518298-->



How can a deadlock happen? #flashcard 
- Both processes are waiting for one another
- They both start waiting at the same time
<!--ID: 1699227518304-->

What is the ReaderWriterLock? #flashcard 
- Many readers can enter
- Writer will be blocked until all reader are left
<!--ID: 1699229002048-->


What is RecurseveLock? #flashcard 
- The task can get the same lock without being blocked
- recursive functions
<!--ID: 1699229002063-->



user-mode agent
kernel mode task manager


