TARGET DECK: SEM3::SE::UML_State_Machines

What is a trace? #flashcard 
- series of (input, output) steps
(e, x), (f, y), (f, y)
<!--ID: 1702677078557-->


What is a behaviour? #flashcard 
- {$\forall$traces} : set of all traces
<!--ID: 1702677078568-->


How is a transition written? #flashcard 
- trigger [guards] / effect
<!--ID: 1702677241723-->

What is the difference between state and Pseudo state? #flashcard 

What is a region? #flashcard 
- Container for nodes and transitions 
<!--ID: 1702678377692-->


What kind of states can you have? #flashcard 
- State | Pseudo state
- Refinements:
	- Simple state
	- Composite state
		- Or-type (hierarchic) refinement
		- And-type (parallel) refinement
	- Submachine refinement
<!--ID: 1702678377701-->


What is active state configuration? 
What is valid configuration? #flashcard 
1. States put together to form a configuration (active) the one that is active 
2. The states in the configuration are allowed can happen together according to the model
<!--ID: 1702678377709-->

What states are shown in the configuration? #flashcard 
Those belonging to the or refinement:
![](Pasted%20image%2020231215231422.png)
<!--ID: 1702682949448-->



![](Pasted%20image%2020231215230325.png)
Give and explanation? #flashcard 
And - Both image and sound can happen at the same time
OR - One of them Clock or  NOClock
<!--ID: 1702678377717-->



What are the options of activating when entering a Region? #flashcard 
- Default Activation
- Explicit Activation
<!--ID: 1702652033893-->


What kind of histories do we have? #flashcard 
- Shallow (H)
- Deep (H*)
<!--ID: 1702652033941-->


What does ![](Pasted%20image%2020231123082422.png) the line connecting H-> On mean? #flashcard 
- The default behaviour.
<!--ID: 1702652033952-->


What are the behaviours that can happen Inside the States? #flashcard 
- Entry 
- DO
- Exit
![](Pasted%20image%2020231123082633.png)
<!--ID: 1702682959605-->



How are State Machines Executed? #flashcard 
- Event Pool | Stable State Configuration | RTC 
<!--ID: 1702652033958-->



How is Event Processing done? #flashcard 
- Select Event 
- What are the Enabled transitions form this event
- Resolve the Conflicts
- Selecting the transitions to be fired
- Executing the fired:
	- Exit 
	- Transition
	- Entry 
<!--ID: 1702727092332-->



What is a conflict? #flashcard 
The states the transitions exits is not empty
<!--ID: 1702727092341-->


How does UML Resolve the conflicts? #flashcard 
- Only one state in an OR Refinement
- Many states in And refinement (in each orthogonal)
- Substate transition has higher priority
<!--ID: 1702727092349-->

What relation is there between state and behaviour? #flashcard 
state        <=>   behaviour 
Completeness     Unambiguity
<!--ID: 1702727577406-->


Describe the State Table? #flashcard 
	 All events
State - - - - - 
For each state you have all events and you just need to tell to which state they go.
<!--ID: 1702727577417-->

How can you implement a state machine? #flashcard 
- Switch 
- Table
<!--ID: 1702727685416-->
