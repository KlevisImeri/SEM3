TARGET DECK: SEM3::SE::UML_intro_and_Use_Case

UML long? #flashcard 
Unified Modeling Language.
<!--ID: 1699481603033-->

Who is UML maintained by? #flashcard 
OMG
<!--ID: 1699481603041-->

Talk about the versions? #flashcard 
- UML 1.0 proposal
- UML 2.0 renewed, semantic basis
- UML 2.5 simplified description
- Today -> specializations
<!--ID: 1699482136062-->


What is the diff between system, model, diagram? #flashcard 
- ***System***: the real world entity
- ***Model***:  (abstraction | simplified) representation of the system
- ***Diagram***: view of the model
<!--ID: 1699482136070-->


What are the two main types of UML diagrams? #flashcard 
- **Behaviour** Diagram
- **Structure** Diagram
<!--ID: 1699482136076-->


What are the most general abstract elements of UML? #flashcard 
- Element
- Relationship
<!--ID: 1699482136083-->


What are packages? #flashcard 
- group and organize model elements
<!--ID: 1699482136089-->


What are elements that can have multiple instances called? #flashcard 
**MultiplicityElement**
<!--ID: 1699482136095-->


What are classifiers? What do they have? #flashcard 
- UML elements that classify instances into classes.
- Features
<!--ID: 1699482136102-->


What is a generalization? #flashcard 
A directed ***relationship*** that organized other elements into a hierarchy.
<!--ID: 1699482136108-->


What are UML steriotypes? What is the notation? #flashcard 
You use it when you want to use some other elements rather than the standart ones
- Extends the UML modeling elements 
- << >> guillemets
<!--ID: 1699484628961-->


Does UML specify the development methodologies? #flashcard 
- NO it just gives a language to model the system.
<!--ID: 1699484628971-->


How is the specification seperated in UML? #flashcard 
- Overview of the modelling elements (abstract syntax)
	- How to use the element/relation
- Description of the semantics (in natural language)
	- What does the element/relation represent
- Details of the modelling elements („metamodell”)
	- How to implement it exacly
<!--ID: 1699484629206-->



What is a Use Case? #flashcard 
- scenarios that the user can do 
- captures a (main) functionality of the system corresponding to the functional requirement.
- verb+noun
  
What are the use case Descriptions? 
What is the difference between Alternative flow and Exception flow? #flashcard 
– Preconditions: must hold for the use case to begin
– Postconditions: must hold once the use case has been completed
– Primary flow: the most frequent scenario(s) of the use case
(aka. main success scenario, “happy path”)
– Alternate flow: less frequent (or not successful)
– Exception flow: not in support of the goals of the primary flow
++++
Alternative flow: is accounted for and it a good case.
Exception flow: is it not accounted for and can lead to bad things
++++
Example:
Primary Flow: Type the equation
Alternative Flow: Delete equation
Exception flow: put wrong expression in
<!--ID: 1699484629214-->


What is an actor? #flashcard 
***Is a role a user plays with respect to the system.***
- outside the boundary of the system
- subset of Context entities
- entity can act more than one actor
- is an external subsystem $\neq$ entity
<!--ID: 1699484629220-->


What kind of actors can we have? #flashcard 
- Primary Actors: invoke the system 
- Secondary Actors: the system relies on them 
<!--ID: 1699484629227-->


How can we represent an actor? #flashcard 
- actor stereotype
- stick figure
<!--ID: 1699484629235-->


What kind of relations are there in a Use Case diagarm? #flashcard 
- Extension: 
	- handles a special case 
	- adding optional behavior to base case
	- invoked under specific conditions =>
	- not always executed
- Inclusion: 
	- includes the case (they both happen)
	- reusability
- Generalization: 
	- Implementation (concreate) of that base class (abstract)
<!--ID: 1699484629242-->



What is and Actor - use case relation? #flashcard 
- Association (special):
	- no properties
	- 0..1 multiplicity
<!--ID: 1699484629249-->

What are the directions of extend and include in Use Case diagrams? Except these what else do you have? #flashcard  ![](Pasted%20image%2020231216191215.png)
![](Pasted%20image%2020231216191224.png)
- Don't forget implementations
