## Graphing Calculator
What I will make is a Graphing Calculator similar to [Desmos](https://www.desmos.com/calculator).
Several things to mention are:
For the Swing-based GUI:
- User will input the expression into the box similar to these examples:
	x^(2/3)+0.9(3.3-x^2)^(1/2)sin(10pi\*x)
	x^(2/3)+0.9(3.3-x^2)^(1/2)sin(10*pi*x)
	cos(3x)+sin(x^2)
	sin(2sin(2sin(2sin(x))))
	![[Pasted image 20231008191805.png|300]]
- The program will display the function on the right using Graphics class:
	![[Pasted image 20231008191834.png|300]]
- For the parsing of the expression no external libraries will be used:
	- Lexer
	- Parser
	- Evaluator
	Will be implemented in the code.

For the Collection Framework:
- It will be everywhere. 
- Primarily the stack will be used extensively in the creation of Parser.

For the Serialization:
	- You will be able to save the state of the program into files.
	- You can reopen different projects you have done.

Unit tests (JUnit):
	- I am not sure yet but it will probably be for testing that the parsing of the expression is right.