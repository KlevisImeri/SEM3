TARGET DECK: SEM3::SE::UML_Structural_Modeling

What are the goals of structural modeling? #flashcard 
- Decomposition into components
- Documenting the System (System Map)
- Design Data Structures
<!--ID: 1699488584535-->



What are the types of Decomposition? #flashcard 
- ***Physical***: by pieces 
- ***Logical***: by functionality
<!--ID: 1699488584542-->



What is an Interface? #flashcard 
- Public coherent ***contract***.
<!--ID: 1699488584548-->


What are interfaces represented in a component? #flashcard 
- ***lollipop***: provided interface
- ***Socket***: required interface
<!--ID: 1699488584554-->


What is a port and what is its notation? #flashcard 
- Named Interaction Point
- little square
<!--ID: 1699488584561-->


What can ports have? #flashcard 
- types
- intefaces 
	- composite port <=> several interfaces
	- ![](Pasted%20image%2020231216141629.png)
<!--ID: 1699488584567-->


How can you connect ports? #flashcard 
- Dependencies
- Relations
![](Pasted%20image%2020231109012848.png)
<!--ID: 1699488584574-->


What kind of connectors can you have inside a component? 
How do they look? #flashcard 
- Delegation Connector [lollipop - lollipop] [Socket - Socket]
- Assembly Connector [lollipop - socket]
![Example Image](connectorsUML.png)
<!--ID: 1699489176013-->

What is the symbol of a component? #flashcard 
![](Pasted%20image%2020231109013134.png)
<!--ID: 1700722057381-->



What further notation can a component have with an interface? #flashcard 
- Interface Realization (lollipop)
- Interface Usage 
![](Pasted%20image%2020231109013042.png)
<!--ID: 1700722057390-->


What is a class in UML? #flashcard 
- A group of elements that have similar structural characteristics.
<!--ID: 1700722057397-->


What are some structural characteristics? #flashcard 
- Attributes
- associations
<!--ID: 1700722057404-->


What do attributes have in UML(Class Diagrams)? #flashcard 
- Type
- Multiplicity
![](Pasted%20image%2020231109013532.png)
<!--ID: 1700722057410-->


What are the build in types in Class Diagrams? #flashcard 
Primitives
- Integer
- Boolean
- String
- UnlimitedNatural
- Real
<!--ID: 1700722057417-->


Is multiple inheritance supported by UML? #flashcard 
- Yes, there can be several generalizations of the same classifier.
<!--ID: 1700722057423-->


What can you do when you generalize? #flashcard 
- expand ancestor
- redefine ancestor
![](Pasted%20image%2020231109013850.png)
<!--ID: 1700722057430-->


What do you do when you have an abstract classifier | behaviour? #flashcard 
- Italic
<!--ID: 1700722057436-->


What is an association? What does it contain? #flashcard 
- Semantic Relationship between instances
- It contains stores the attributes
![](Pasted%20image%2020231109014337.png)
<!--ID: 1700722057443-->


Give an example of naming associations? #flashcard 
![](Pasted%20image%2020231109014414.png)
<!--ID: 1700722057449-->


Does UML have object if no then what does it have? #flashcard 
- NO
- Instances
<!--ID: 1700722057455-->


Give example of instances? What is a link? #flashcard 
![](Pasted%20image%2020231109014620.png)
<!--ID: 1700722057462-->


What is the notation of constrains? #flashcard 
- {<constrain_goes_here>}  
- you can have it in a seperate comment
<!--ID: 1700722057468-->

What are the other elements of class diagrams? #flashcard 
- DataType
- Enumeration
<!--ID: 1702905236957-->



What are the ways to represent an association? #flashcard 
1. Attribute to classes
2. Association class 
<!--ID: 1702905236966-->


Can multiple associations be modeled in UML? #flashcard 
Yes.
![](Pasted%20image%2020231216180419.png)
<!--ID: 1702905236972-->


How is navigability in associations syntax? #flashcard 
![](Pasted%20image%2020231216180507.png)
<!--ID: 1702905236979-->


Who own the association notation? #flashcard 
![](Pasted%20image%2020231216180551.png)
<!--ID: 1702905236986-->


What is the notation for composition and aggregation? #flashcard 
![](Pasted%20image%2020231216180650.png)
![](Pasted%20image%2020231216180656.png)
<!--ID: 1702905236992-->



What is the diff between the aggregation and composition? #flashcard 
- In aggregation ***the instance*** can belong to more than one groping. Example: Wall belongs to many rooms.
- In Composition ***the instance*** belong only to that grouping. Example: The panel instance of the window belongs only to that instance of the window.
<!--ID: 1702905236999-->


How are the functions inside the classes in UML called? #flashcard 
- BehavioralFeature
<!--ID: 1702905237006-->


What is the notation for static behaviour? #flashcard 
- underlines
<!--ID: 1702905237014-->


Give the a full behaviour? #flashcard 
\+ foo(param: int, paramArr: char[O..\*]): int
same as:
`int foo(int param, char[] paramArr){}`
<!--ID: 1702905237020-->



What is Operation and what is Method in UML?


How do you model asynchronous communication in UML? #flashcard 
- Signal
- Reception
![](Pasted%20image%2020231216183232.png)
<!--ID: 1702905237026-->


What are the levels of visibility? #flashcard 
- private (-)
- protected (#)
- public (+)
- package (~)
<!--ID: 1702905237034-->



What is the notation for derived Property? #flashcard 
- slash ![](Pasted%20image%2020231216183946.png)
<!--ID: 1702905237041-->



What are property Modifiers? #flashcard 
Give more information
![](Pasted%20image%2020231216185000.png)
<!--ID: 1702905237047-->



What are:
- Nested Classes 
- Qualifier 
- Package 



loanApplication(int requestedAmount, costumer, bool repoaintPrivousLoan){}

repaintPrivousLoan:
	- true
	- false

costumer:
	- student
	- other

requestedAmount
	- {-$\infty$,-1}
	- {0,10^6}
	- {10^6, 3\*10^6}
	- {3\*10^6, +$\infty$}

//wrong requireqements
repaintPrivousLoan:k
	- true
	- false
- student
requestedAmount
	- {10^6, 3\*10^6}
	- {3\*10^6, +$\infty$}

repaintPrivousLoan:
	- true
- student
requestedAmount
	- {0,10^6}
	- {10^6, 3\*10^6}


int discont(#books)

books:
(-infinty,-1]
[0,2]
[3,10] - discont price
[10,+infinity] - discont price+additional dicount

-1000 -1 0 -1 2 3 4 8 9 10 11 +1000

[x] {sdafasd,asdfas} [pres me]

```cpp
int a = read(); 
while(a < 16) { 
	if(a < 10) { 
		a += 2; 
	} 
	else { 
		a++; 
	} 
} 
a = a * 2;
```


A desicion braches can have more than 2 outcomes
a=5
a=-10
b=5
b<5

k=0;
if(a>0 && b>0){
	k=1;
}
m=1/k;

(0, +$\infty$}
(-$\infty$,0]